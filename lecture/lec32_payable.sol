// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;
/*
## Payable
It is ESSENTIAL when we send ethur by send, transfer and call
msg.value is the value of transfer ether
The 3 methods sending Ether
send: consumed 2300 gas, return true/false depending on the result
transfer: consumed 2300 gas, if failed, it occurs an error
call: we can adjust gas which means variable gas set, return true/false depending on the result


When you wanna check out whether to send, put inot another account's address 
*/
contract lec_payable{
    event howMuch(uint256 _value);

    function sendNow(address payable _to) public payable{
        // _to: sender 
        bool sent = _to.send(msg.value);// return true or false
        require(sent,"Failed to send ether");

    }

    // Unlike send, transfer does not need require phrase since voluntarily error.
    function transferNow(address payable _to )public payable{ 
        _to.transfer(msg.value);
        emit howMuch(msg.value);

    }

    function callNow(address payable _to) public payable{
    /* version ~ 0.7
    (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
    require(sent,"Failed to call ether."); 
    */
    /* version 0.7~  
    */
    (bool sent,) = _to.call{value: msg.value, gas:1000}("");
    require(sent,"Failed to call ether.");
    emit howMuch(msg.value);
    }
}