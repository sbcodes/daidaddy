pragma solidity^0.5.3;

/// @title DaiDaddy: secondary market to let people sell CDP's with outstanding debt
/// @author Chris Maree

import "./mocks/tub.sol";

contract DaiDaddy {

    enum Status {LISTED, BOUGHT, CANCLED}

    struct Debt {
        bytes32 cupId;
        address owner;
        uint256 discount; //percentage discount (no decimal)
        Status status;
    }

    struct Cup {
        address  lad;      // CDP owner
        uint256  ink;      // Locked collateral (in SKR)
        uint256  art;      // Outstanding normalised debt (tax only)
        uint256  ire;      // Outstanding normalised debt
    }

    Debt[] public debtBook;

    mapping (bytes32 => uint256) cupsToDebt;

    SaiTub public saiTubContract;

    constructor(address _saiTubAddress) public {
        saiTubContract = SaiTub(_saiTubAddress);
    }


    // Can't verify the lad of the cup becuase maker uses a proxy contract for deployments.
    // In this case of the hackathon it is fine becuase
    // if someone tried to sell a cup that they did not own it would be rejected by maker. 

    // This should use delegate call in the future but I couldent get this to work so for now have removed the require
    // on the mock. this is insecure but it's fine for the hackathon.
    // address(saiTubContract).delegatecall(abi.encodeWithSignature("give(bytes32,address)", _cdpId, address(this)));
    function sellCDP(bytes32 _cdpId, uint256 _discount) public {
        //transfer the CDP to the DaiDaddy Contract
        saiTubContract.give(_cdpId, address(this));

        // add the sale to the order book.
        uint256 index = debtBook.push(Debt(_cdpId, msg.sender, _discount, Status.LISTED)) - 1;
        cupsToDebt[_cdpId] = index;
    }

    function buyCDP(bytes32 _cdpId) public payable returns (uint256) {
        // get information on the CDP current state to get its value
        Cup memory cup;
        (cup.lad, cup.ink, cup.art, cup.ire) = saiTubContract.cups(_cdpId);
        
        uint256 cdpValueUSD = debtPrice(cup.art, cup.ire, debtBook[cupsToDebt[_cdpId]].discount);
        return cdpValueUSD;
    }

    function debtPrice(uint _art, uint _ire, uint _discount) public pure returns(uint) {
        return _art * (_ire/10 - 10 ** 18) * (100 - _discount) / 10 ** 20;
    }

    function saiTubAddress() public view returns (address) {
        return address(saiTubContract);
    }
}