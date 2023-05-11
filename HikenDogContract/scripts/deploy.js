// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  //NFT contract
  const HKnft = await hre.ethers.getContractFactory("HikenDogBasedNFT");
  const nftContract = await HKnft.deploy();
  console.log("nft address", nftContract);

  //Token contract
  const HKtoken = await hre.ethers.getContractFactory("HikenDogToken");
  const tokenContract = await HKtoken.deploy();
  console.log("token address", tokenContract);

  const HiKenDog = await hre.ethers.getContractFactory("HikenDogGame");
  
  // const lock = await HiKenDog.deploy();

  // await lock.deployed();

  // console.log(
  //   `Lock with ${ethers.utils.formatEther(
  //     lockedAmount
  //   )}ETH and unlock timestamp ${unlockTime} deployed to ${lock.address}`
  // );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
