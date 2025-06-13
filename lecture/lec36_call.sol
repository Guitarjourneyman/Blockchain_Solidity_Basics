// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract add{

    event JustFallback(string _str);
    event JustReceive(string _str);
    function addNumber(uint256 _num1,uint256 _num2) public pure returns(uint256){
        return _num1 + _num2;
    }
    fallback() external {
        emit JustFallback("JustFallback is called");
    }
    receive() external payable {
        emit JustReceive("JustReceive is called");
     }
}

contract caller{
    event callerFunction(bool _success, bytes _output);

    //1. Transfer
    function transferEther(address payable _to) public payable{
        (bool success,) = _to.call{value: msg.value}("");
        require(success,"transfer is not successful");
    }
    // 2. Call external a function
    function callMethod(address _contractAddr, uint256 _num1, uint256 _num2) public{
        // This is how to call external a function from another contract
        (bool success,bytes memory outputFromCallFunction) = _contractAddr.call(
            abi.encodeWithSignature("addNumber(uint256,uint256)", _num1, _num2)
        );
        require(success,"Failed to transfer ether");
        // Saving returned value into outputFromCallFunction in 32 butes
        emit callerFunction(success, outputFromCallFunction);
    }
}