// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

contract ERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf; // mapping = variable (searchable by key) จดว่า account มีเงินเท่าไหร่ / เงินใคร
    mapping(address => mapping(address => uint)) public allowance; // allow ให้ใคร
    string public name = "Example Token";
    string public symbol = "ET";
    uint8 public decimals = 18;

    // unsecure (should check balance before decrease)
    // 3rd party call
    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount; // msg.sender - address variable
        balanceOf[recipient] += amount;
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount; // spender - คนที่เรา allow
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        return true;
    }

    // add ให้ user ที่อยู่ใน variable balanceOf
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }
}