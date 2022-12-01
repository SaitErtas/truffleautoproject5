// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ContractB.sol";

//Bu kontratta SampleKontratı çalıştırmak için kodlar var.
contract A {
    ////////////////////////////////////////////////////////////////////////////
    //1. Call Function Of Other Contract
    //2. import keyword
    //3. contract interface
    //4. error propagation

    //1. interface of B   => B
    //2. address of B
    address addressB;

    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }

    function callHelloWorld() external view returns (string memory) {
        SampleContract b = SampleContract(addressB);
        return b.helloWorld();
    }

    function callHelloWorld2() external view returns (string memory) {
        InterfaceB b = InterfaceB(addressB);
        return b.helloWorld();
    }
}

contract SampleContract {
    mapping(address => uint256) balances;

    function invest() external payable {
        // if (msg.value < 1 ether) {
        //     revert();
        // }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns (uint256) {
        return address(this).balance;
    }

    /////////////////////////////////////////////////////////////////////////////
    //Sending Ether From a Smart Contract
    //İçerdeki payable smart kontrattan para çıkışı yapılabilir demek.
    //Payable öneki parantezin dışında olursa para girişi olacak demek.
    address payable[] recipients;

    function sendEther(address payable recepient) external {
        recepient.transfer(1 ether); // reverts on failure

        address payable a;
        a = recepient;
        a.transfer(100);

        //msg.sender.transfer(100);

        bool b = recepient.send(1 ether); //returns a boolean result for success/failure.

        if (b) {}
    }

    //Burda external dışar açık demek
    //pure function string dönen function demek
    function helloWorld() external pure returns (string memory) {
        return "HelloWorld";
    }
}
