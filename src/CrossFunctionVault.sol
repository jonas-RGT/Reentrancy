// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CrossFunctionVault {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount);

        (bool ok,) = msg.sender.call{value: amount}("");
        require(ok);

        unchecked {
            balances[msg.sender] -= amount;
        }
    }
}
