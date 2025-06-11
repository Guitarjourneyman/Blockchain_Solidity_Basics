// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract Array {
    uint256[] public array;

    function arrayLength() public view returns(uint256){
        return array.length;
    }

    // Same principle as a stack LIFO
    function arrayPop() public {
        array.pop();
    }
    function arrayGet (uint256 _index) view public returns(uint256){
        return array[_index];
    }

    // Caution: It just changes from the value of the index to 0.
    function arrayDelete(uint256 _index) public {
        delete array[_index];
    }
    function arrayChange(uint256 _index, uint256 _age) public{
        array[_index] = _age;
    }
}