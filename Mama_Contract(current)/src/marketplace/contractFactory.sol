// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Ecommerce} from "./marketplace.sol";
import {IMamaToken} from "../interfaces/IMamaToken.sol";

contract MamashayFactory {
    
    // State variables
    address payable public owner;
    Ecommerce[] public ecommerceContracts; // Array of Ecommerce contracts
    IMamaToken public mamaToken; // Reference to MamaToken contract

    // Mapping to store the names of NFTs minted by each Ecommerce contract
    mapping(address => string) public nftNames; // Mapping from contract address to NFT name

    // Event for when a new Ecommerce marketplace is created
    event EcommerceCreated(address indexed marketplaceAddress, string nftName, address indexed owner);

    // Constructor to initialize the factory with a MamaToken
    constructor(address _mamaToken) {
        owner = payable(msg.sender);
        mamaToken = IMamaToken(_mamaToken); // Initialize with MamaToken
    }

    // -------------------------------
    // Function to create a new Ecommerce marketplace
    // -------------------------------
    function createMamashay() public returns (address) {
        Ecommerce newMarketplace = new Ecommerce(address(mamaToken));
        ecommerceContracts.push(newMarketplace);
        
        // Ensure getNFTName() is valid before setting it
        string memory nftName = newMarketplace.getNFTName();
        require(bytes(nftName).length > 0, "Invalid NFT name");
        nftNames[address(newMarketplace)] = nftName;

        emit EcommerceCreated(address(newMarketplace), nftName, msg.sender);
        return address(newMarketplace);
    }

    // -------------------------------
    // Product Management Functions
    // -------------------------------
    
    // Function to publish a product in a specified vendor's marketplace
    function publishProduct(
        address vendorMarketplace,
        uint256 id,
        string memory name,
        string memory vendorName,
        uint256 price,
        string memory category
    ) public {
        require(vendorMarketplace != address(0), "Invalid marketplace address");
        require(ecommerceContracts.length > 0, "No Ecommerce contracts created"); // Check if the marketplace exists
        Ecommerce(vendorMarketplace).PublishProduct(id, name, vendorName, price, category);
    }

    // Function to approve a product in a specified vendor's marketplace
    function approveProduct(address vendorMarketplace, uint256 id) public {
        require(vendorMarketplace != address(0), "Invalid marketplace address");
        require(ecommerceContracts.length > 0, "No Ecommerce contracts created"); // Check if the marketplace exists
        Ecommerce(vendorMarketplace).ApproveProduct(id);
    }

    // Function to buy a product from a specified vendor's marketplace
    function buyProduct(
        address vendorMarketplace,
        uint256 amount,
        uint256 bookID
    ) public returns (bool) {
        require(vendorMarketplace != address(0), "Invalid marketplace address");
        require(ecommerceContracts.length > 0, "No Ecommerce contracts created"); // Check if the marketplace exists
        return Ecommerce(vendorMarketplace).buyProduct(amount, bookID);
    }

    // Function to delete a product in a specified vendor's marketplace
    function deleteProduct(address vendorMarketplace, uint256 id) public {
        require(vendorMarketplace != address(0), "Invalid marketplace address");
        require(ecommerceContracts.length > 0, "No Ecommerce contracts created"); // Check if the marketplace exists
        Ecommerce(vendorMarketplace).DeleteProduct(id);
    }

    // -------------------------------
    // Token Management Functions
    // -------------------------------
    
    // Function to withdraw all tokens from the contract
    function withdraw() public {
        uint256 balance = mamaToken.balanceOf(address(this));
        require(balance > 0, "No tokens to withdraw");
        mamaToken.transfer(msg.sender, balance);
    }

    // Function to check the balance of the sender
    function checkBalance() public view returns (uint256) {
        return mamaToken.balanceOf(msg.sender);
    }

    // -------------------------------
    // Utility Functions
    // -------------------------------

    // Function to check the total number of Ecommerce contracts created
    function checkEcommerceLength() public view returns (uint256) {
        return ecommerceContracts.length;
    }

    // -------------------------------
    // Fallback Functions
    // -------------------------------

    // Fallback function to accept Ether
    fallback() external payable {}

    // Receive function to accept Ether
    receive() external payable {}
}
