// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec25{

    // 	2978936 gas
    function assertNow() public pure{
        assert(false);
    }
    // 280 gas
    function revertNow() public pure{
        revert("now is not good");
    }

    function requireNow() public pure{
        require(false, "require is bad");
    }


}
