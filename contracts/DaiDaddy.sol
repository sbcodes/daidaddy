pragma solidity^0.5.0;

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

    function listCDP(bytes32 _cdpId, uint256 discount) public returns (address){
        Cup memory cup;
        (cup.lad, cup.ink, cup.art, cup.ire) = saiTubContract.cups(_cdpId);
        return cup.lad;
        // Cant verify the lad of the cup becuase maker uses a proxy contract for deployments. In this case of the hackathon it is fine becuase
        // if someone tried to sell a cup that they did not own it would be rejected by maker. 
    }

    function debtPrice(uint _art, uint _ire, uint _discount) public pure returns(uint){
        return _art * (_ire/10 - 1) * (100 - _discount);
    }
}