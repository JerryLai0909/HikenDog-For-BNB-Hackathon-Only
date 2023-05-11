const { expect } = require("chai");
const hre = require("hardhat");
// const { ethers } = require("ethers");

describe("deploy test ", function () {
  it("Check Deploy", async function () {
    const signers = await hre.ethers.getSigners();

    let owner = signers[0];
    let address1 = signers[1];

    //NFT PROOF PPPPPPPPPPPPP
    let proofName = "HDProofBasedNFT";
    let proofSymbol = "HDPNFT";
    const ProofNft = await hre.ethers.getContractFactory("ProofBasedNFT");
    const proofNft = await ProofNft.deploy(proofName, proofSymbol);
    console.log("proof address", proofNft.address);
    expect(await proofNft.name()).to.equal(proofName);
    expect(await proofNft.symbol()).to.equal(proofSymbol);
    expect(await proofNft.owner()).to.equal(owner.address);

    //FFFFFFFFFFFF
    let fragmentName = "HDFragmentNFT";
    let fragmentSymbol = "HDFNFT";
    const FragmentNft = await hre.ethers.getContractFactory("FragmentBasedNFT");
    const fragmentNft = await FragmentNft.deploy(fragmentName, fragmentSymbol);
    expect(await fragmentNft.name()).to.equal(fragmentName);
    expect(await fragmentNft.symbol()).to.equal(fragmentSymbol);
    expect(await fragmentNft.owner()).to.equal(owner.address);

    ////YYYYYYYYYYYYYYYYYY
    let yieldName = "HDYieldBasedNFT";
    let yieldSymbol = "HDYNFT";
    const YieldNft = await hre.ethers.getContractFactory("YieldBasedNFT");
    const yieldNft = await YieldNft.deploy(yieldName, yieldSymbol);
    console.log("yield address", yieldNft.address);
    expect(await yieldNft.name()).to.equal(yieldName);
    expect(await yieldNft.symbol()).to.equal(yieldSymbol);
    expect(await yieldNft.owner()).to.equal(owner.address);

    // //TOKEN
    const Token = await hre.ethers.getContractFactory("HikenDogToken");
    const token = await Token.deploy();
    console.log("token address", token.address);
    expect(await token.name()).to.equal("HikenDoge");
    expect(await token.symbol()).to.equal("HDT");
    expect(await token.owner()).to.equal(owner.address);
    expect(await token.balanceOf(owner.address)).to.equal(
      hre.ethers.utils.parseUnits("100000000", 18)
    );

    // //GAME
    const Game = await hre.ethers.getContractFactory("HikenDogGame");
    const game = await Game.deploy(
      token.address,
      proofNft.address,
      yieldNft.address,
      fragmentNft.address
    );
    console.log("game address", game.address);
    // expect(await game.getTokenAddress()).to.equal(token.address);
    // expect(await game.getProofAddress()).to.equal(proofNft.address);
    // expect(await game.owner()).to.equal(owner.address);

    let pOwner1 = await proofNft.owner();
    console.log("original p owner", pOwner1);
    await proofNft.transferOwnership(game.address);
    let pOwner2 = await proofNft.owner();
    console.log("new p Owner is ", pOwner2);

    let pGameHash = "0xPROOFHASH11111";
    let pNftHash = "0xProofNftHash1111";
    let pDesc = "THIS IS THE ONE";
    let pUri = "www.s3.nft_proof.1";

    await game.addProofTypeNft(pGameHash, pNftHash, pDesc, pUri);

    let fOwner1 = await fragmentNft.owner();
    console.log("original f owner", fOwner1);
    await fragmentNft.transferOwnership(game.address);
    let fOwner2 = await fragmentNft.owner();
    console.log("new f Owner is ", fOwner2);

    let fGameHash1 = "0xFRAGMENTHASH11111";
    let fNftHash1 = "0xFragmentNftHash1111";
    let fDesc1 = "THIS IS THE ONE FRAGMETN 11111";
    let fUri1 = "www.s3.nft_fragment.1";

    let fNftHash2 = "0xFragmentNftHash2222";
    let fDesc2 = "THIS IS THE ONE FRAGMETN 22222";
    let fUri2 = "www.s3.nft_fragment.2";

    let fGameHash3 = "0xFragmentNftHash3333";
    let fNftHash3 = "0xFragmentNftHash3333";
    let fDesc3 = "THIS IS THE ONE FRAGMETN 3333";
    let fUri3 = "www.s3.nft_fragment.3";

    await game.addFragmentTypeNft(fGameHash1, fNftHash1, fDesc1, fUri1);
    await game.addFragmentTypeNft(fGameHash1, fNftHash2, fDesc2, fUri2);
    await game.addFragmentTypeNft(fGameHash3, fNftHash3, fDesc3, fUri3);

    let fNft1 = await fragmentNft.getNftTypeInfo(fGameHash1, fNftHash1);
    let fNft2 = await fragmentNft.getNftTypeInfo(fGameHash1, fNftHash2);
    let fNft3 = await fragmentNft.getNftTypeInfo(fGameHash3, fNftHash3);
    console.log("fNft111 info : ", fNft1);
    console.log("fNft222 info : ", fNft2);
    console.log("fNft333 info : ", fNft3);

    //check and mint ppp
    let balAdd1 = await proofNft.balanceOf(address1.address);
    console.log("proof1 address nft count : ", balAdd1);
    await game.mintProofNft(address1.address, pGameHash, pNftHash);
    let balAdd2 = await proofNft.balanceOf(address1.address);
    console.log("proof2 address nft count : ", balAdd2);
    let pNft = await proofNft.getUserNftInfo(address1.address, 1);
    console.log("address1 proof nft : ", pNft);

    //chenk and mint fff
    let fAdd1 = await fragmentNft.balanceOf(address1.address);
    console.log("fragment1 address nft count : ", fAdd1);
    await game.mintFragmentNft(address1.address, fGameHash1, fNftHash1);
    await game.mintFragmentNft(address1.address, fGameHash1, fNftHash2);
    await game.mintFragmentNft(address1.address, fGameHash3, fNftHash3);
    let fAdd2 = await fragmentNft.balanceOf(address1.address);
    console.log("fragment2 address nft count : ", fAdd2);

    let fNft = await fragmentNft.getUserNftInfo(address1.address, 2);
    console.log("address1 fragmetn nft : ", fNft);

    let yGameHash = "0xYIELDHASH2222";
    let yNftHash = "0XYieldNftHash";
    let yDesc = "THIS IS THE YIELD ONE";
    let yNftUrl = "www.s3.yield.pic";
    let yTokenPer = 10;
    let yFragCost = [1, 2, 3];
    let yTokenCost = hre.ethers.utils.parseUnits("200", 18);

    let yOO1 = await yieldNft.owner();
    console.log("original owner yyy ", yOO1);
    //转移owner给游戏合约
    await yieldNft.transferOwnership(game.address);
    let yOO2 = await yieldNft.owner();
    console.log("yyy new Owner is ", yOO2);

    await game.addYieldTypeNft(
      yGameHash,
      yNftHash,
      yDesc,
      yNftUrl,
      yTokenPer,
      yFragCost,
      yTokenCost
    );
    let yResult = await yieldNft.getNftTypeInfo(yGameHash, yNftHash);
    console.log("Yield nft entity: ", yResult);

    console.log("token own original : ", await token.owner());
    await token.transferOwnership(game.address);
    console.log("token own new : ", await token.owner());

    let bA1 = await token.balanceOf(address1.address);
    console.log("check token origin:", bA1);
    await game.tokenMint(
      address1.address,
      hre.ethers.utils.parseUnits("200", 18)
    );
    let bA2 = await token.balanceOf(address1.address);
    console.log("check token new:", bA2);

    await game.mintYieldNft(address1.address, yGameHash, yNftHash);
    let result = await yieldNft.getUserNftInfo(address1.address, 1);
    console.log("check reuslt", result);

    let bA3 = await token.balanceOf(address1.address);
    console.log("check token after mint:", bA3);

    let nftResult1 = await fragmentNft.getUserNftInfo(address1.address, 1);
    let nftResult2 = await fragmentNft.getUserNftInfo(address1.address, 2);
    let nftResult3 = await fragmentNft.getUserNftInfo(address1.address, 3);
    console.log("check fragment nft after mint 111 ", nftResult1);
    console.log("check fragment nft after mint 222 ", nftResult2);
    console.log("check fragment nft after mint 333 ", nftResult3);

    await game.getNftReward(address1.address, 1);

    let yNft1 = await yieldNft.getUserNftInfo(address1.address, 1);
    console.log("check yy nft 111", yNft1);
    let bA4 = await token.balanceOf(address1.address);
    console.log("check token after mint:", bA4);
    let yNft2 = await yieldNft.getUserNftInfo(address1.address, 1);
    console.log("check yy nft 222", yNft2);

    // let nftInfo = await proofNft.getNftInfo(address1.address, 1);
    // console.log("Proof base nft entity : ", nftInfo);

    // let yOO1 = await yieldNft.owner();
    // console.log("original owner yyy ", yOO1);
    // //转移owner给游戏合约
    // await yieldNft.transferOwnership(game.address);
    // let yOO2 = await yieldNft.owner();
    // console.log("yyy new Owner is ", yOO2);
  });
});
