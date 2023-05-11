require("@nomicfoundation/hardhat-toolbox");
const { ethers } = require("ethers");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
    localhost: {
      url: "http://localhost:8545",
    },
    goerli: {
      url: "https://goerli.infura.io/v3/" + process.env.INFURA_KEY,
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
      // {
      //  mnemonic: process.env.MNEMONIC,
      //  count: 20,
      //}
    },
  },
  // networks: {
  //   localhost: {
  //     url: "http://127.0.0.1:8545",
  //   },
  //   // hardhat: {
  //   //   url: "http://127.0.0.1:8545",
  //   // },
  // },
  // paths: {
  //   sources: "./contracts",
  //   tests: "./test",
  //   cache: "./cache",
  //   artifacts: "./artifacts",
  // },
  // mocha: {
  //   timeout: 40000,
  // },
};
