// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import {MamashayFactory} from "../src/marketplace/contractFactory.sol";
import {Ecommerce} from "../src/marketplace/marketplace.sol";
import {MamaToken} from "../src/ERC20Mama.sol";
import {Vm} from "forge-std/Vm.sol";

contract MamashayFactoryTest is Test {
    MamashayFactory factory;
    MamaToken mamaToken;

    address owner = address(1);
    address user = address(2);
    
    // Constants for the tests
    uint256 initialSupply = 1000 * 10 ** 18;

    function setUp() public {
        // Initialize MamaToken with initial supply and owner's address
        mamaToken = new MamaToken(initialSupply, owner); 
        // Mint some tokens to the user for testing
        mamaToken.transfer(user, initialSupply / 2); // Give user half of the initial supply
        // Initialize factory
        factory = new MamashayFactory(address(mamaToken)); 
    }

    function testCreateMamashay() public {
        // Call createMamashay and ensure it matches the expected behavior
        address marketplace = factory.createMamashay(); 

        // Assert that the marketplace address is valid
        assertNotEq(marketplace, address(0), "Marketplace address should not be zero");
        assertEq(address(factory.ecommerceContracts(0)), marketplace, "Marketplace address does not match"); // Ensure correct access
    }

    function testPublishProduct() public {
        // Create a marketplace first
        address marketplace = factory.createMamashay(); // Ensure correct creation

        // Act
        vm.prank(user); // Simulate user calling the function
        factory.publishProduct(marketplace, 1, "Test Product", "Vendor A", 100, "Category A");
    }

    function testApproveProduct() public {
        // Create a marketplace first
        address marketplace = factory.createMamashay();

        // Publish a product
        vm.prank(user);
        factory.publishProduct(marketplace, 1, "Test Product", "Vendor A", 100, "Category A");

        // Act
        vm.prank(user); // Approving by the user
        factory.approveProduct(marketplace, 0);
    }

    function testBuyProduct() public {
    // Create a marketplace first
    address marketplace = factory.createMamashay();

    // Publish a product
    vm.prank(user);
    factory.publishProduct(marketplace, 1, "Test Product", "Vendor A", 10, "Category A");

    // Approve the product
    vm.prank(user);
    factory.approveProduct(marketplace, 0);
    
    // Check user balance before purchase
    uint256 userBalanceBefore = mamaToken.balanceOf(user);
    require(userBalanceBefore >= 10, "User does not have enough tokens to buy the product");

    // User approves the factory to spend tokens
    vm.startPrank(user);
    mamaToken.approve(address(factory), 10); // Approve the factory to spend tokens
    
    // User buys the product
    bool purchaseSuccess = factory.buyProduct(marketplace, 100, 0);
    assertTrue(purchaseSuccess, "Product purchase should succeed");

    // Assert the user's balance after purchase
    uint256 userBalanceAfter = mamaToken.balanceOf(user);
    assertEq(userBalanceAfter, userBalanceBefore - 100, "User's balance should decrease by the product price");
    
    // Check if the factory received the tokens
    uint256 factoryBalance = mamaToken.balanceOf(address(factory));
    assertEq(factoryBalance, 100, "Factory should have received the product price in tokens");
}



    function testWithdraw() public {
    // Create a marketplace first
    address marketplace = factory.createMamashay();

    // Publish a product
    vm.prank(user);
    factory.publishProduct(marketplace, 1, "Test Product", "Vendor A", 100, "Category A");

    // Approve the product
    vm.prank(user);
    factory.approveProduct(marketplace, 0);
    
    // User starts buying the product
    vm.startPrank(user); 
    mamaToken.approve(address(factory), 100); // User approves the factory to spend tokens
    bool purchaseSuccess = factory.buyProduct(marketplace, 100, 0); // User buys the product
    assertTrue(purchaseSuccess, "Product purchase should succeed"); // Assert purchase success

    // Store the initial balance of the owner before withdrawal
    uint256 initialOwnerBalance = mamaToken.balanceOf(owner);
    
    // Act - Owner withdraws funds from the factory
    vm.startPrank(owner);
    factory.withdraw();

    // Assert - Check if the owner's balance increased correctly
    uint256 newOwnerBalance = mamaToken.balanceOf(owner);
    
    // Check that the owner's balance has increased by the expected amount
    assertEq(newOwnerBalance, 993000000000000000000000, "Owner's balance should be increased by the withdrawn amount");
}

    function testCheckEcommerceLength() public {
        // Act
        uint256 length = factory.checkEcommerceLength();

        // Assert
        assertEq(length, 0, "Ecommerce length should be 0 after creating a marketplace");
    }

    function testMarketplaceCreation() public {
        // Your setup code to create the marketplace
        address marketplace = factory.createMamashay();
        
        // Verify the created contract
        assertEq(address(factory.ecommerceContracts(0)), marketplace, "Marketplace address does not match"); // Ensure correct access
    }
}
