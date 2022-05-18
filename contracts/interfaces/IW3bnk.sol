//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface IW3bnk {
  event NewUser(address indexed wallet, uint256 timestamp, string username);

  function registerEns(string calldata user) external;

  function getTotalUsers() external view returns (uint256);

  function getAddressFromUser(string calldata user) external view returns (address);

  function getUserFromAddress(address _address) external view returns (string memory);
}