// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract add{
    uint256 public num = 0;
    event Info(address _addr, uint256 _num);

    function plusOne() public {
        num = num + 1;
        emit Info(msg.sender ,num);
    }
}

contract callerWithDelegate{
    uint256 public num =0;

    // Save num in add contract
    function callNow(address _contractAddr) public {
        (bool success,)= _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to invoke");
        }

        // Save this.num
    function delegatecallNow(address _contractAddr) public  {
        (bool success,)= _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to invoke");
        }
    
}