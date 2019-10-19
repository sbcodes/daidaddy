pragma solidity^0.5.3;

/// @title DaiDaddy: secondary market to let people sell CDP's with outstanding debt
/// @author Chris Maree

import "./mocks/tub.sol";
import "./mocks/Medianizer.sol";

contract DaiDaddy {

    enum Status {LISTED, BOUGHT, CANCLED}

    struct Debt {
        bytes32 cupId;
        address payable seller;
        address buyer;
        uint256 discount; //percentage discount (no decimal)
        Status status;
    }

    struct Cup {
        address  lad;      // CDP owner
        uint256  ink;      // Locked collateral (in SKR)
        uint256  art;      // Outstanding normalised debt (tax only)
        uint256  ire;      // Outstanding normalised debt
    }

    // debt mappings and orders
    Debt[] public debtBook;
    mapping (bytes32 => uint256) cupsToDebt;
    uint256 debtItems;

    // contract instances
    SaiTub public saiTubContract;
    Medianizer public medianizerContract;


    constructor(address _saiTubAddress, address _medianizerAddress) public {
        saiTubContract = SaiTub(_saiTubAddress);
        medianizerContract = Medianizer(_medianizerAddress);
    }

    // Can't verify the lad of the cup becuase maker uses a proxy contract for deployments.
    // In this case of the hackathon it is fine becuase
    // if someone tried to sell a cup that they did not own it would be rejected by maker. 

    // This should use delegate call in the future but I couldent get this to work so for now have removed the require
    // on the mock. this is insecure but it's fine for the hackathon.
    // address(saiTubContract).delegatecall(abi.encodeWithSignature("give(bytes32,address)", _cupId, address(this)));
    function sellCDP(bytes32 _cupId, uint256 _discount) public {
        //transfer the CDP to the DaiDaddy Contract
        saiTubContract.give(_cupId, address(this));

        // add the sale to the order book.
        uint256 index = debtBook.push(Debt(_cupId, msg.sender, address(0), _discount, Status.LISTED)) - 1;
        cupsToDebt[_cupId] = index;
    }

    function buyCDP(uint256 _debtId) public payable returns (uint256) {
        //ensure write value is sent with tx
        require(msg.value == debtPositionPriceInEth(_debtId), "Wrong value sent with tx");
        
        bytes32 _cupId = debtBook[_debtId].cupId;

        //transfer the CDP to the new owner
        saiTubContract.give(_cupId, msg.sender);

        //transfer ether to seller
        debtBook[_debtId].seller.transfer(msg.value);

        //update debt book
        debtBook[_debtId].buyer = msg.sender;
        debtBook[_debtId].status = Status.BOUGHT;
    }

    function debtPositionPriceInEth(uint256 _debtId) public view returns (uint256) {
        Cup memory cup;
        (cup.lad, cup.ink, cup.art, cup.ire) = saiTubContract.cups(debtBook[_debtId].cupId);
        
        uint256 cdpValueUSD = debtPrice(cup.art, cup.ire, debtBook[_debtId].discount);
        return (cdpValueUSD * 10 ** 18) / getEtherPrice();
    }

    function debtPrice(uint _art, uint _ire, uint _discount) public pure returns(uint) {
        return _art * (_ire/10 - 10 ** 18) * (100 - _discount) / 10 ** 20;
    }

    function saiTubAddress() public view returns (address) {
        return address(saiTubContract);
    }

    function getEtherPrice() public view returns(uint256){
        return uint256(medianizerContract.read());
    }
}