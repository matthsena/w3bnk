// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
const hre = require("hardhat");

async function main() {
  const W3bnk = await hre.ethers.getContractFactory("W3bnk");
  const w3bnk = await W3bnk.deploy();

  await w3bnk.deployed();

  console.log("W3bnk deployed to:", w3bnk.address);

  let ensTnx1 = await w3bnk.registerEns("user1");
  await ensTnx1.wait()

  let ensTnx2 = await w3bnk.registerEns("user2");
  await ensTnx2.wait()

  let address1 = await w3bnk.getAddressFromUser("user1");
  console.log("Address of user1", address1)

  let address2 = await w3bnk.getAddressFromUser("user2");
  console.log("Address of user2", address2)

  let user1 = await w3bnk.getUserFromAddress(address1);
  console.log("User of address:", address1, user1)

  let totalUsers = await w3bnk.getTotalUsers();
  console.log("Users: ", totalUsers);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
