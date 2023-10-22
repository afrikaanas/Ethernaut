// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface Instance {
    function authenticate(string memory passkey) external;
    function password() external view returns (string memory);
    function getCleared() external view returns (bool);
}

contract Level0Script is Script {
    function run() public {
        Instance level0 = Instance(0xc1baDEEf1C887313D48407240d7127dB9b793436);
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        level0.authenticate(level0.password());
        level0.getCleared();

        vm.stopBroadcast();
    }
}
