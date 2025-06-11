// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec30{


    uint256 public num = 5;

    modifier numChange{
        _;
        num = 15;
    }

    function numChangeFunction() public numChange{
        num = 20;
    }
}