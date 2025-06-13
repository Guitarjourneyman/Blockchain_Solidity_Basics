// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.5.0 < 0.9.0;

contract Bank{
    
    // event JustFallbackWithFunds(address _from, uint256 _value, string message);
        //  ~  0.5

    // 0.6 ~
    event Fallback(address _from, string message);
    event receiveFallbackWithFunds(address _from, uint256 _value, string message);
    
    fallback() external{
        emit Fallback(msg.sender, "Fallback is called");
    }
    receive() external payable {
        emit receiveFallbackWithFunds(msg.sender, msg.value,"Receive is called");
    }


}

contract You{

    //receive()
    function DepositWithSend(address payable _to) public payable{
        bool success = _to.send(msg.value);
        require (success,"Failed");
    }

    function TestNonExistFunction(address payable _to) public payable{
        // ~0.7
        (bool sent,) = _to.call("HI");
        require(sent,"Failed to send ether");

        // 0.7 ~
        // (bool sent,) = _to.call{vlaue: msg.value}("");
        // require(sent,"Failed to send ether");
    }
}