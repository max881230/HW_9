// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "ERC721A/ERC721A.sol";

contract myANFT is ERC721A {
    uint256 public number;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721A(_name, _symbol) {}

    function mint_(address to, uint256 quantity) external {
        _mint(to, quantity);
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
