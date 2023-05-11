// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract YieldBasedNFT is Ownable {
    string private _name;
    string private _symbol;

    //721 : counter
    uint private _nftTokenId = 1;
    //721 : address => nft count
    mapping(address => uint256) private _balances;
    //721 : address => [entity](tokenId => nft)
    mapping(address => mapping(uint => YieldBased)) private _owners;
    //game_hash => entity(nft_hash => info)
    mapping(string => mapping(string => YieldBased)) private _nftType;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    struct YieldBased {
        string description;
        string nft_uri;
        uint256 tokenPerBlock;
        uint256 lastGetBlock; //if it's new ,then this is now block.number,update it when get rewards
        uint256[] fragmentCost;
        uint256 tokenCost;
    }

    // Add a new Type of NFT
    // mapping(string => mapping(uint => ProofBased)) private _nftType;
    function addNewNftType(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri,
        uint256 tokenPerBlock,
        uint256[] memory fragmentCost,
        uint256 tokenCost
    ) external onlyOwner {
        YieldBased memory yeildBased = _nftType[game_hash][nft_hash];
        require(
            bytes(yeildBased.description).length == 0 &&
                bytes(yeildBased.nft_uri).length == 0,
            "This game is already added"
        );
        YieldBased memory entity = YieldBased(
            description,
            nft_uri,
            tokenPerBlock,
            block.number,
            fragmentCost,
            tokenCost
        );
        _nftType[game_hash][nft_hash] = entity;
    }

    // Game's logic can't not be verify on chain, it must be done at server side
    // So let the owner mint for users
    function mintForUser(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) external onlyOwner {
        YieldBased memory yeildBased = _nftType[game_hash][nft_hash];
        require(
            bytes(yeildBased.description).length > 0 ||
                bytes(yeildBased.nft_uri).length > 0,
            "This nft of game is not exist"
        );
        YieldBased memory nft = _nftType[game_hash][nft_hash];
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
    ) public view returns (YieldBased memory) {
        return _nftType[game_hash][nft_hash];
    }

    function getUserNftInfo(
        address account,
        uint256 nftTokenId
    ) public view returns (YieldBased memory) {
        return _owners[account][nftTokenId];
    }

    function afterNftReward(address account, uint256 tokenId) public onlyOwner {
        YieldBased memory entity = _owners[account][tokenId];
        entity.lastGetBlock = block.number + 3;
        _owners[account][tokenId] = entity;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
}
