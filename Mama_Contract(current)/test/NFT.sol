// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ERC20Mama.sol";

contract MMA_Test is Test {
    MMA public mma;

    function setUp() public {
        mma = new MMA();
    }

    function testMinting() public {
        mma.mintNFT("https://example.com/metadata.json");
        assertEq(mma.totalSupply(), 1);
    }

    function testSingleMintPerUser() public {
        mma.mintNFT("https://example.com/metadata.json");
        vm.expectRevert("You have already minted an NFT");
        mma.mintNFT("https://example.com/metadata.json");
    }
}
