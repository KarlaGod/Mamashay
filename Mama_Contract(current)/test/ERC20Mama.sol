// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MamaToken} from "../src/ERC20Mama.sol";

contract ERC20MamaTest is Test {

    function test_transfer() public {
        MamaToken Mama = new MamaToken(2000, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bool value = Mama.transfer( 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 50);
        assertEq(value, true);
    }

    function test_burn() public {
        MamaToken Mama = new MamaToken(2000, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bool value = Mama.burn(200);
        assertEq(value, true);
    }

    function test_burnFrom() public{
        MamaToken Mama = new MamaToken(2000, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bool value = Mama.burnFrom(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0);
        assertEq(value, true);
    }

    function test_getBalance() public {
        MamaToken Mama = new MamaToken(2000, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        uint256 value = Mama.getBalance(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        assertEq(value, 2000);
    }

    function test_transferFrom() public {
        MamaToken Mama = new MamaToken(2000, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bool value = Mama.transferFrom(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, 2);
        assertEq(value, true);
    }
}
