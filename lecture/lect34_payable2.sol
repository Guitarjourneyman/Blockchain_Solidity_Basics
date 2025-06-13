// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract MobileBanking{

    /*Due to constructor, Only address which deployed this contract can send money*/
    address owner;
    constructor() payable{
        owner = msg.sender;
        
    }

    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    function sendEther(address payable _to) public payable {
        require(msg.sender == owner, "Only Owner! ");
        require(msg.sender.balance >= msg.value, "Your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender,(msg.sender).balance);
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}