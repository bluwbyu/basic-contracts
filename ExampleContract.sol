// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

contract ExampleContract {
    string private name;
    uint256 private number = 100;

    // memory - string, address
    constructor(string memory _name) {
        name = _name;
    }

    // nonpayable จ่าย gas
    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function increaseNumber() public {
        number++;
    }

    function decreaseNumber() public {
        number--;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}