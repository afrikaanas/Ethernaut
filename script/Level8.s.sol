// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Vault.sol";

contract Level8Script is Script {
    Vault vault = Vault(payable(0x4be47fE82F3F5041C7E69a2F4002E5bD07Aeb81C));

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        vault.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);

        vm.stopBroadcast();
    }
}
