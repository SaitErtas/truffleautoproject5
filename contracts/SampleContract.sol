// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// import "./ContractB.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract SampleContract is ERC20, Pausable, ERC20Burnable, Ownable {
    constructor() ERC20("MyToken", "MTK") {}

    mapping(address => uint256) balances;
    /////////////////////////////////////////////////////////////////////////////
    //Sending Ether From a Smart Contract
    //İçerdeki payable smart kontrattan para çıkışı yapılabilir demek.
    //Payable öneki parantezin dışında olursa para girişi olacak demek.
    address payable[] recipients;

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function invest() external payable {
        // if (msg.value < 1 ether) {
        //     revert();
        // }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns (uint256) {
        return address(this).balance;
    }

    function sendEther(address payable recepient, uint256 _amount) external {
        recepient.transfer(_amount); // reverts on failure

        // address payable a;
        // a = recepient;
        // a.transfer(100);

        // //msg.sender.transfer(100);

        // bool b = recepient.send(1 ether); //returns a boolean result for success/failure.

        // if (b) {}
    }

    EtherReceiver private receiverAdr = new EtherReceiver();

    function sendEther2(uint256 _amount) public payable {
        if (!payable(address(receiverAdr)).send(_amount)) {
            //handle failed send
        }
    }

    function callValueEther(uint256 _amount) public payable {
        (bool success, ) = address(receiverAdr).call{
            value: _amount,
            gas: 35000
        }("");
        require(success, "Transfer failed.");
    }

    function transferEther(uint256 _amount) public payable {
        payable(address(receiverAdr)).transfer(_amount);
    }

    //Burda external dışar açık demek
    //pure function string dönen function demek
    function helloWorld() external pure returns (string memory) {
        return "HelloWorld";
    }
}

contract EtherReceiver {
    fallback() external payable {}
}

//Bu kontratta SampleKontratı çalıştırmak için kodlar var.
// contract A {
//     ////////////////////////////////////////////////////////////////////////////
//     //1. Call Function Of Other Contract
//     //2. import keyword
//     //3. contract interface
//     //4. error propagation

//     //1. interface of B   => B
//     //2. address of B
//     address addressB;

//     function setAddressB(address _addressB) external {
//         addressB = _addressB;
//     }

//     function callHelloWorld() external view returns (string memory) {
//         SampleContract b = SampleContract(addressB);
//         return b.helloWorld();
//     }

//     function callHelloWorld2() external view returns (string memory) {
//         InterfaceB b = InterfaceB(addressB);
//         return b.helloWorld();
//     }
// }
