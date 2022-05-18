// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
const hre = require("hardhat");

async function main() {
  const W3bnk = await hre.ethers.getContractFactory("W3bnk");
  const w3bnk = await W3bnk.deploy();

  await w3bnk.deployed();

  console.log("W3bnk deployed to:", w3bnk.address);

  let ensTnx1 = await w3bnk.registerEns("matheus1");
  await ensTnx1.wait()

  let ensTnx2 = await w3bnk.registerEns("matheus2");
  await ensTnx2.wait()

  let totalUsers = await w3bnk.getTotalUsers();
  console.log(totalUsers);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
