// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Erc20 is ERC20 {
    constructor(uint256 initialSupply) ERC20("Byu Token", "BT") {
        _mint(msg.sender, initialSupply*10**uint(decimals()));
    }

    function mint(address acount, uint256 amount) public {
        _mint(acount, amount*10**uint(decimals())); // decimals return 18
    }
}