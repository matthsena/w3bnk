//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract W3bnk {
  using Counters for Counters.Counter;
  Counters.Counter private _totalUsers;

  event NewUser(address indexed wallet, uint256 timestamp, string username);

  mapping(string => address) public ens;

  constructor () {
    console.log("Hello world");
  }

  function registerEns(string calldata user) public {
    require(ens[user] == address(0), "there is already a user with that name");

    ens[user] = msg.sender;

    _totalUsers.increment();
    emit NewUser(msg.sender, block.timestamp, user);
  }
  
  function getTotalUsers() public view returns (uint256) {
    return _totalUsers.current();
  }
}