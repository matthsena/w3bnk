//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./interfaces/IW3bnk.sol";

contract W3bnk is IW3bnk {
  using Counters for Counters.Counter;
  Counters.Counter private _totalUsers;

  mapping(string => address) public ens;
  mapping(address => string) public addresses;

  function registerEns(string calldata user) public {
    require(ens[user] == address(0), "there is already a user with that name");
    require(bytes(getUserFromAddress(msg.sender)).length > 0, "address is already in use");

    ens[user] = msg.sender;
    addresses[msg.sender] = user;

    _totalUsers.increment();
    emit NewUser(msg.sender, block.timestamp, user);
  }

  function getUserFromAddress(address _address) public view returns (string memory) {
    require(address(0) != _address, "invalid address");

    return addresses[_address];
  }
  
  function getAddressFromUser(string calldata user) public view returns (address) {
    require(ens[user] != address(0), "user not found");

    return ens[user];
  }

  function getTotalUsers() public view returns (uint256) {
    return _totalUsers.current();
  }
}