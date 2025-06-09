// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract father{
    string public familyName = "Kim";
    string public givenName = "Jung";
    uint256 public money = 100;

    constructor (string memory _givenName)   {
        givenName = _givenName;
    }

    function getFamilyName() view public returns(string memory){
        return familyName;
    }

    function getgivenName() view public returns(string memory){
        return givenName;
    }
    //note: 'virtual' to override
    function getMoney() view public virtual returns(uint256){
        return money;
    }
    
}

contract son is father ("James"){
    uint256 earning = 0;
    function work() public {
        earning += 100;
    }
    // note: override
    function getMoney() view public override returns (uint256){
        return money+earning;
    }
}