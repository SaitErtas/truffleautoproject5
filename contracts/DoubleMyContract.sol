// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

contract DoubleMyContract {
    uint public balance; //State variable
    uint public balance1; //State variable

    // call this function to send a response
    function doubleMyContract(uint _amount) public {
        balance = _amount * 2;
        balance1 = 50;
    }
    // call this function to send a response
    function sendMeMoneyContract() public payable{
    }

}
