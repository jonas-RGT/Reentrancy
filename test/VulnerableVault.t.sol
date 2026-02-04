// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/VulnerableVault.sol";
import "../src/Attacker.sol";

contract VulnerableVaultTest is Test {
    VulnerableVault vault;
    Attacker attacker;

    address user1 = address(0x1);
    address user2 = address(0x2);

    function setUp() public {
        vault = new VulnerableVault();

        vm.deal(user1, 10 ether);
        vm.deal(user2, 10 ether);

        vm.prank(user1);
        vault.deposit{value: 10 ether}();

        vm.prank(user2);
        vault.deposit{value: 10 ether}();
    }

    function testReentrancyAttack() public {
        //  Prove initial state
        assertEq(address(vault).balance, 20 ether);

        vm.deal(address(this), 1 ether);
        attacker = new Attacker(address(vault));

        assertEq(address(attacker).balance, 0);
        assertEq(address(this).balance, 1 ether);

        // Attack 
        attacker.attack{value: 1 ether}();

        //  Verify results
        assertEq(address(vault).balance, 0);
        assertEq(address(attacker).balance, 21 ether);
    }
}
