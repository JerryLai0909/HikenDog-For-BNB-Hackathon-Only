// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HikenDogToken is ERC20, Ownable {
    uint256 _totalSupply;

    constructor() ERC20("HikenDoge", "HDT") {
        _totalSupply = 100000000 * 10 ** decimals();
        _mint(msg.sender, _totalSupply);
    }

    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }
}
