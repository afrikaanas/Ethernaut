// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

interface Instance {
    function authenticate(string memory passkey) external;
    function password() external view returns (string memory);
    function getCleared() external view returns (bool);
}

contract Level0 is Test {
    function setUp() public {}

    function testLevel0() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"), 4539329);
        Instance level0 = Instance(0xc1baDEEf1C887313D48407240d7127dB9b793436);
        level0.authenticate(level0.password());
        assertTrue(level0.getCleared());
    }
}
