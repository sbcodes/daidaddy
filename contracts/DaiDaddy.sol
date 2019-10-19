pragma solidity^0.5.3;

/// @title DaiDaddy: secondary market to let people sell CDP's with outstanding debt
/// @author Chris Maree

import "./mocks/tub.sol";

contract DaiDaddy {

    enum Status {LISTED, BOUGHT, CANCLED}

    struct Debt {
        bytes32 cupId;
        address owner;
        uint8 discount; //percentage discount (no decimal)
        Status status;
    }

    struct Cup {
        address  lad;      // CDP owner
        uint256  ink;      // Locked collateral (in SKR)
        uint256  art;      // Outstanding normalised debt (tax only)
        uint256  ire;      // Outstanding normalised debt
    }

    Debt[] public debtBook;

    SaiTub public saiTubContract;

    constructor(address _saiTubAddress) public {
        saiTubContract = SaiTub(_saiTubAddress);
    }

    function sellCDP(bytes32 _cdpId, uint256 discount) public{
        Cup memory cup;
        (cup.lad, cup.ink, cup.art, cup.ire) = saiTubContract.cups(_cdpId);
        // return cup.lad;
        // Cant verify the lad of the cup becuase maker uses a proxy contract for deployments. In this case of the hackathon it is fine becuase
        // if someone tried to sell a cup that they did not own it would be rejected by maker. 


        // _e.delegatecall(bytes4(keccak256("setN(uint256)")), _n); // D's storage is set, E is not modified 


        address(saiTubContract).delegatecall(abi.encodeWithSignature("give(bytes32,address)", _cdpId, address(this)));
    }

    function debtPrice(uint _art, uint _ire, uint _discount) public pure returns(uint){
        return _art * (_ire/10 - 10 ** 18) * (100 - _discount) / 10 ** 20;
    }

    function saiTubAddress() public view returns (address){
        return address(saiTubContract);
    }
}