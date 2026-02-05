// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/CrossFunctionVault.sol";
import "../src/CrossFunctionAttacker.sol";

contract CrossFunctionVaultTest is Test {
    CrossFunctionVault vault;
    CrossFunctionAttacker attacker;

    address attackerEOA = address(0xA);
    address receiver = address(0xB);

    function setUp() external {
        vault = new CrossFunctionVault();

        vm.deal(attackerEOA, 1 ether);
        vm.deal(address(this), 10 ether);

        vault.deposit{value: 5 ether}();

        vm.prank(attackerEOA);
        attacker = new CrossFunctionAttacker(vault, receiver);
    }

    function testCrossFunctionReentrancyExploit() external {
        vm.prank(attackerEOA);
        attacker.attack{value: 1 ether}();

        assertEq(address(vault).balance, 5 ether);
        assertEq(vault.balances(receiver), 1 ether);
        assertGt(vault.balances(address(attacker)), type(uint256).max / 2);
    }
}
