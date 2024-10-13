// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract MMA is ERC721Enumerable, ERC721URIStorage, Ownable {
    uint256 public constant MAX_SUPPLY = 10000;
    mapping(address => bool) public hasMinted;  // Track if a user has minted an NFT

    constructor() ERC721("MAMA", "MMA") {}

    function mintNFT(string memory tokenURI) public {
        require(totalSupply() < MAX_SUPPLY, "All NFTs have been minted");
        require(!hasMinted[msg.sender], "You have already minted an NFT");

        uint256 tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);

        hasMinted[msg.sender] = true;  // Mark user as having minted
    }

    // Overrides
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
