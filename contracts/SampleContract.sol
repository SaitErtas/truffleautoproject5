// SPDX-License-Identifier: MIT
// pragma solidity >=0.4.25 <0.9.0;

// contract SampleContract {
//     // bool public serviceStart = false;
//     // address public walletOwner;
//     // uint256 public currentBalance;

//     //uint256 public balanceReceived = 2000;

//     //address public walletAddress;

//     constructor(uint256 _amt) {
//         //walletOwner = msg.sender;
//         //currentBalance = _amt;
//     }

//     // function restartService() public {
//     //     serviceStart = true;
//     // }
// }

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SampleContract is ERC20, Pausable, Ownable {
    constructor() ERC20("SampleContractToken", "SCT") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
