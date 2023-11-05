// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract myNFT is ERC721Enumerable {
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {}

    function mint_(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }

    function approve_(address to, uint256 tokenId) external {
        approve(to, tokenId);
    }

    function transfer_(address from, address to, uint256 tokenId) external {
        transferFrom(from, to, tokenId);
    }

    function balanceOf_(address owner) external view returns (uint256) {
        return balanceOf(owner);
    }

    function ownerOf_(uint256 tokenId) external view returns (address) {
        return ownerOf(tokenId);
    }
}
