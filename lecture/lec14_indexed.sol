// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Lec14{

    event numberTracker1(uint256 num, string str);
    event numberTracker2(uint256 indexed num, string str);

    uint256 num = 0;
    function PushEvent(string memory _str) public {
        
        emit numberTracker1(num, _str); // You will get all results from 0 to the idenx you want

        emit numberTracker2(num, _str); // You will get filtered index you only want

        num++;
    }
}