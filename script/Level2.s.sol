// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Fallout.sol";

contract Level2Script is Script {
    Fallout fallout = Fallout(payable(0x3BcFDA695f300c0F6933fce850eD492e626147df));

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        fallout.Fal1out();

        vm.stopBroadcast();
    }
}
