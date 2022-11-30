// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface InterfaceB {
    function helloWorld() external pure returns (string memory);

    function foo() external;
}

contract ContractB is InterfaceB {
    function helloWorld() external pure returns (string memory) {
        //işlemleri iptal etmek istiyorsan revert(); kullanılabilir.
        //revert();

        return "HelloWorld";
    }

    function foo() external {}
}
