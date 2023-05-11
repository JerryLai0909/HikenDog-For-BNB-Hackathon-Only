// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract FragmentBasedNFT is Ownable {
    string private _name;
    string private _symbol;

    //721 : counter
    uint private _nftTokenId = 1;
    //721 : address => nft count
    mapping(address => uint256) private _balances;
    //721 : address => [entity](tokenId => nft)
    mapping(address => mapping(uint => FragmentBased)) private _owners;
    //game_hash => entity(nft_hash => info)
    mapping(string => mapping(string => FragmentBased)) private _nftType;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    struct FragmentBased {
        string description;
        string nft_uri;
    }

    // Add a new Type of NFT
    // mapping(string => mapping(uint => ProofBased)) private _nftType;
    function addNewNftType(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri
    ) external onlyOwner {
        FragmentBased memory fragmentBased = _nftType[game_hash][nft_hash];
        require(
            bytes(fragmentBased.description).length == 0 &&
                bytes(fragmentBased.nft_uri).length == 0,
            "This game is already added"
        );
        FragmentBased memory entity = FragmentBased(description, nft_uri);
        _nftType[game_hash][nft_hash] = entity;
    }

    // Game's logic can't not be verify on chain, it must be done at server side
    // So let the owner mint for users
    function mintForUser(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) public onlyOwner {
        FragmentBased memory fragmentBased = _nftType[game_hash][nft_hash];
        require(
            bytes(fragmentBased.description).length > 0 ||
                bytes(fragmentBased.nft_uri).length > 0,
            "This nft of game is not exist"
        );
        FragmentBased memory nft = _nftType[game_hash][nft_hash];
        _owners[account][_nftTokenId] = nft;
        _balances[account] += 1;
        _nftTokenId += 1;
    }

    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }

    function getNftTypeInfo(
        string memory game_hash,
        string memory nft_hash
    ) public view returns (FragmentBased memory) {
        return _nftType[game_hash][nft_hash];
    }

    function getUserNftInfo(
        address account,
        uint256 nftTokenId
    ) public view returns (FragmentBased memory) {
        return _owners[account][nftTokenId];
    }

    function checkUserNft(
        address account,
        uint256 nftTokenId
    ) public view returns (bool) {
        if (
            bytes(_owners[account][nftTokenId].description).length > 0 &&
            bytes(_owners[account][nftTokenId].nft_uri).length > 0
        ) {
            return true;
        } else {
            return false;
        }
    }

    function burnNft(address account, uint256 tokenId) external onlyOwner {
        _owners[account][tokenId] = FragmentBased("USED", "www.s3USED");
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
}
