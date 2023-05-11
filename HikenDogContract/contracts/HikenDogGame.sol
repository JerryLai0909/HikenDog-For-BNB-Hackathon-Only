// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YieldBaseNFT.sol";

interface IHikenDogToken {
    function balanceOf(address account) external returns (uint256);

    function mint(address to, uint256 amount) external;

    function burn(address account, uint256 amount) external;
}

interface IProofBaseNFT {
    function addNewNftType(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri
    ) external;

    function mintForUser(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) external;
}

interface IFragmentBaseNFT {
    function addNewNftType(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri
    ) external;

    function mintForUser(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) external;

    function checkUserNft(
        address account,
        uint256 nftTokenId
    ) external returns (bool);

    function burnNft(address account, uint256 tokenId) external;
}

interface IYieldBaseNft {
    function addNewNftType(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri,
        uint256 tokenPerBlock,
        uint256[] memory fragmentCost,
        uint256 tokenCost
    ) external;

    function mintForUser(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) external;

    function getNftTypeInfo(
        string memory game_hash,
        string memory nft_hash
    ) external returns (YieldBased memory);

    function getUserNftInfo(
        address account,
        uint256 nftTokenId
    ) external returns (YieldBased memory);

    function afterNftReward(address account, uint256 tokenId) external;
}

struct YieldBased {
    string description;
    string nft_uri;
    uint256 tokenPerBlock;
    uint256 lastGetBlock; //if it's new ,then this is now block.number,update it when get rewards
    uint256[] fragmentCost;
    uint256 tokenCost;
}

contract HikenDogGame is Ownable {
    string public constant NFT_PROOF_BASED = "PROOF_BASED";
    string public constant NFT_EQUITY_BASED = "EQUITY_BASED";
    string public constant NFT_YIELD_BASED = "YIELD_BASED";
    string public constant NFT_FRAGMENT_BASED = "FRAGMENT_BASED";

    address private _HDToken;
    address private _HDProofNft;
    address private _HDYieldNft;
    address private _HDFragmentNft;

    mapping(address => uint) name;

    event MintProofNft(
        address indexed account,
        string game_hash,
        string nft_hash
    );

    event AddProofNft(
        string indexed game_hash,
        string indexed nft_hash,
        string description,
        string nft_uri
    );

    event AddFragmentNft(
        string indexed game_hash,
        string indexed nft_hash,
        string description,
        string nft_uri
    );

    event MintFragmentNft(
        address indexed account,
        string game_hash,
        string nft_hash
    );

    event AddYieldTypeNft(
        string indexed game_hash,
        string indexed nft_hash,
        string description,
        string nft_uri,
        uint256 tokenPerBlock,
        uint256[] fragmentCost,
        uint256 tokenCost
    );

    event MintYieldNft(
        address indexed account,
        string game_hash,
        string nft_hash
    );

    event Log(address account, string value);

    event GetNftReward(address account, uint256 amount);

    constructor(
        address token,
        address _proofNft,
        address _yieldNft,
        address _fragmentNft
    ) {
        _HDToken = token;
        _HDProofNft = _proofNft;
        _HDYieldNft = _yieldNft;
        _HDFragmentNft = _fragmentNft;
    }

    function getTokenAddress() public view returns (address) {
        return _HDToken;
    }

    function getProofAddress() public view returns (address) {
        return _HDProofNft;
    }

    function getFragmentAddress() public view returns (address) {
        return _HDFragmentNft;
    }

    function getYieldAddress() public view returns (address) {
        return _HDYieldNft;
    }

    function tokenMint(address account, uint256 amount) public onlyOwner {
        IHikenDogToken(_HDToken).mint(account, amount);
    }

    // Game's logic can't not be verify on chain, it must be done at server side
    // So let the owner mint for users
    function addProofTypeNft(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri
    ) public onlyOwner {
        IProofBaseNFT(_HDProofNft).addNewNftType(
            game_hash,
            nft_hash,
            description,
            nft_uri
        );
        emit AddProofNft(game_hash, nft_hash, description, nft_uri);
    }

    function mintProofNft(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) public onlyOwner {
        IProofBaseNFT(_HDProofNft).mintForUser(account, game_hash, nft_hash);
        emit MintProofNft(account, game_hash, nft_hash);
    }

    function addFragmentTypeNft(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri
    ) public onlyOwner {
        IFragmentBaseNFT(_HDFragmentNft).addNewNftType(
            game_hash,
            nft_hash,
            description,
            nft_uri
        );
        emit AddFragmentNft(game_hash, nft_hash, description, nft_uri);
    }

    function mintFragmentNft(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) public onlyOwner {
        IFragmentBaseNFT(_HDFragmentNft).mintForUser(
            account,
            game_hash,
            nft_hash
        );
        emit MintFragmentNft(account, game_hash, nft_hash);
    }

    function addYieldTypeNft(
        string memory game_hash,
        string memory nft_hash,
        string memory description,
        string memory nft_uri,
        uint256 tokenPerBlock,
        uint256[] memory fragmentCost,
        uint256 tokenCost
    ) public onlyOwner {
        IYieldBaseNft(_HDYieldNft).addNewNftType(
            game_hash,
            nft_hash,
            description,
            nft_uri,
            tokenPerBlock,
            fragmentCost,
            tokenCost
        );
        emit AddYieldTypeNft(
            game_hash,
            nft_hash,
            description,
            nft_uri,
            tokenPerBlock,
            fragmentCost,
            tokenCost
        );
    }

    //mint yieldNft
    function mintYieldNft(
        address account,
        string memory game_hash,
        string memory nft_hash
    ) public onlyOwner {
        YieldBased memory entity = IYieldBaseNft(_HDYieldNft).getNftTypeInfo(
            game_hash,
            nft_hash
        );
        uint256[] memory fragmentArray = entity.fragmentCost;
        bool flag = true;
        for (uint i = 0; i < fragmentArray.length; i++) {
            flag = IFragmentBaseNFT(_HDFragmentNft).checkUserNft(
                account,
                fragmentArray[i]
            );
            if (!flag) {
                break;
            }
        }
        require(flag, "fragment not enought");
        uint256 tokenCost = entity.tokenCost;
        require(
            IHikenDogToken(_HDToken).balanceOf(account) >= tokenCost,
            "not enough token"
        );

        //burn nft & token
        for (uint i = 0; i < fragmentArray.length; i++) {
            IFragmentBaseNFT(_HDFragmentNft).burnNft(account, fragmentArray[i]);
        }
        IHikenDogToken(_HDToken).burn(account, tokenCost);
        IYieldBaseNft(_HDYieldNft).mintForUser(account, game_hash, nft_hash);
        emit MintYieldNft(account, game_hash, nft_hash);
    }

    //获取收益型nft奖励
    function getNftReward(address account, uint256 tokenId) public {
        YieldBased memory entity = IYieldBaseNft(_HDYieldNft).getUserNftInfo(
            account,
            tokenId
        );
        uint256 lastGetBlock = entity.lastGetBlock;
        uint256 tokenPerBlock = entity.tokenPerBlock;
        IYieldBaseNft(_HDYieldNft).afterNftReward(account, tokenId);
        uint256 diff = block.number - lastGetBlock;
        uint256 reward = tokenPerBlock * diff;
        reward = 23456 * 10 ** 18;
        IHikenDogToken(_HDToken).mint(account, reward);
        emit GetNftReward(account, tokenId);
    }

    //**************************************
}
