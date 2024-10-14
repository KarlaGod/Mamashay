// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {MMA} from "../src/NFT.sol";

contract MMA_Test is Test {
    MMA public mma;

    function setUp() public {
        mma = new MMA();
    }

    function testMinting() public {
        mma.mintItem(0x2d122fEF1613e82C0C90f443b59E54468e16525C, "https://example.com/metadata.json");
        assertEq(mma.totalSupply(), 1);
    }

    function testSingleMintPerUser() public {
        mma.mintItem(0x2d122fEF1613e82C0C90f443b59E54468e16525C, "https://example.com/metadata.json");
        vm.expectRevert("User has already minted an NFT");
        mma.mintItem(0x2d122fEF1613e82C0C90f443b59E54468e16525C, "https://example.com/metadata.json");
    }
}
