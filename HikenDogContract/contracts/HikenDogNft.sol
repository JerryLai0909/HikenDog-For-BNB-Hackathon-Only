// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

abstract contract HikenDogBasedNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("HikenDogBasedNFT", "HDNFT") {}

    function safeMint(
        address to,
        string memory uri
    ) internal onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        return tokenId;
    }

    function safeShanMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = safeMint(to, uri);
        _safeTransfer(owner(), to, tokenId,"");
    }
}
