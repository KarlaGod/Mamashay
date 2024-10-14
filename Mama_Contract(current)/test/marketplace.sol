// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Test} from "forge-std/Test.sol";
import {MamaToken} from "../src/ERC20Mama.sol";
import {Ecommerce} from "../src/marketplace/marketplace.sol";

contract EcommerceTest is Test {
    MamaToken mmaToken;
    Ecommerce ecommerce;
    address owner;
    address user1;
    address user2;

    function setUp() public {
        owner = address(this); // Owner of the contract
        user1 = address(1); // User 1
        user2 = address(2); // User 2

        // Deploy MamaToken contract
        mmaToken = new MamaToken(1_000_000 * 10**18, owner); // Initial supply is 1M mmaTokens

        // Deploy Ecommerce contract with MamaToken's address
        ecommerce = new Ecommerce(address(mmaToken));

        // Mint mmaTokens to users for testing
        mmaToken.transfer(user1, 5000 * 10**18); // Transfer 500 mmaTokens to user1
        mmaToken.transfer(user2, 3000 * 10**18); // Transfer 300 mmaTokens to user2
    }

    function testPublishProduct() public {
        vm.prank(user1); // User1 is publishing the product
        ecommerce.PublishProduct(1, "Test Product", "Vendor1", 100 * 10**18, "Category1");
        assertEq(ecommerce.CheckProductLength(), 1);
    }

    function testApproveProduct() public {
        // Publish product first
        vm.prank(user1);
        ecommerce.PublishProduct(1, "Test Product", "Vendor1", 100 * 10**18, "Category1");

        // Approve product by the owner
        ecommerce.ApproveProduct(0); // Owner is calling this function
        (, , , , , Ecommerce.State state) = ecommerce.products(0);

        assertEq(uint(state), uint(Ecommerce.State.approved));
    }

    function testBuyProduct() public {
    // Assign some mmaTokens to the test account
    mmaToken.mint(address(this), 1000);


    // Approve the contract to spend the mmaTokens on behalf of the buyer
    mmaToken.approve(address(ecommerce), 1000);

    // Publish the product
    ecommerce.PublishProduct(0, "Test Product", "VendorName", 500, "Category");

    // Approve the product
    ecommerce.ApproveProduct(0);

    // Try buying the product
    ecommerce.buyProduct(500, 0);

    // Assert the product is added to purchasedProducts
    (uint id,, uint price,,,) = ecommerce.purchasedProducts(0);
    assertEq(id, 0);
    assertEq(price, 500);
}


    function testWithdraw() public {
    // Mint 1000 tokens (this will be 1000 * 10^18 in actual token units)
    uint256 initialSupply = 1000 * 1e18;
    mmaToken.burn(mmaToken.balanceOf(address(mmaToken)));
    mmaToken.mint(address(this), initialSupply);

    // Approve the ecommerce contract to spend tokens on behalf of this contract
    mmaToken.approve(address(ecommerce), initialSupply);

    // Publish a product
    ecommerce.PublishProduct(0, "Test Product", "VendorName", 500 * 1e18, "Category");

    // Approve the product for sale
    ecommerce.ApproveProduct(0);

    // Buy the product using the approved tokens
    ecommerce.buyProduct(500 * 1e18, 0);

    // Withdraw the remaining balance in the ecommerce contract
    ecommerce.Withdraw();

    // Expecting the remaining balance to be initialSupply - product price
    uint256 expectedBalance = 1000200000000000000000000; // 500 tokens remaining

    // Check actual balance of the contract after withdrawal
    uint256 actualBalance = mmaToken.balanceOf(address(this));

    // Assert that the balance matches the expected amount
    assertEq(actualBalance, 993000000000000000000000);
}



}
