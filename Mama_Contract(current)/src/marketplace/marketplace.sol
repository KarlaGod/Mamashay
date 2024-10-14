// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {MMA} from "../NFT.sol";
import {IMamaToken} from "../interfaces/IMamaToken.sol";

contract Ecommerce {
    IMamaToken public MMA; // Make MMA public to allow visibility
    address public Owner;
    
    // Event for buying products
    event ProductPurchase(address indexed purchaser, uint indexed amount, uint indexed price, uint index);
    // Event for approving products
    event productApproval(address indexed approver, uint indexed amount, uint indexed price);
    // Event for publishing products
    event productPublished(address indexed approver, uint indexed amount, uint indexed price);
    // Event for deleting products
    event productDelete(address indexed seller, uint indexed amount, uint indexed price);
    // Event for marking purchase as completed
    event Completed(address indexed purchaser, uint indexed amount, uint indexed price, uint index);
    
    struct Product {
        uint id; 
        string name; 
        uint price; 
        string vendorName;
        string Category;
        State ProductState;
    }

    enum State {
        approved,
        pending,
        disapproved
    }

    Product[] public products;
    Product[] public purchasedProducts;

    constructor(address _ERC20_Contract) {
        MMA = IMamaToken(_ERC20_Contract);
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == Owner, "Only Admin can call this function");
        _;
    }

    // Function for publishing products
    function PublishProduct(
        uint _id,
        string memory _name,
        string memory _vendorName,
        uint _price,
        string memory _Category
    ) public payable {
        Product memory book = Product({
            id: _id,
            name: _name,
            price: _price,
            vendorName: _vendorName,
            Category: _Category,
            ProductState: State.pending
        });
        products.push(book);
        emit productPublished(msg.sender, _price, book.id);
    }

    // Function for approving products
    function ApproveProduct(uint _id) public onlyOwner {
        Product storage book = products[_id];
        require(book.ProductState == State.pending || book.ProductState == State.disapproved, "Product is already approved");
        book.ProductState = State.approved;
        emit productApproval(msg.sender, book.price, book.id);
    }

    // Function for buying products
    function buyProduct(uint _amount, uint bookID) public payable returns (bool) {
        require(_amount >= products[bookID].price, "Insufficient funds");
        require(products[bookID].ProductState == State.approved, "Product is not approved");
        MMA.approve(address(this), _amount);
        MMA.transferFrom(msg.sender, address(this), _amount);
        purchasedProducts.push(products[bookID]);
        emit ProductPurchase(msg.sender, _amount, products[bookID].price, products[bookID].id);
        return true;
    }

    // Function for deleting products
    function DeleteProduct(uint _id) public onlyOwner {
        require(_id < products.length, "Product ID is invalid");
        products[_id] = products[products.length - 1]; 
        products.pop();
        emit productDelete(msg.sender, products[_id].price, products[_id].id);
    }

    // Function to withdraw all tokens in the contract
    function Withdraw() public onlyOwner {
        MMA.transfer(msg.sender, MMA.balanceOf(address(this)));
        emit Completed(msg.sender, MMA.balanceOf(address(this)), MMA.balanceOf(address(this)), MMA.balanceOf(address(this)));
    }

    function CheckBalance() public view returns (uint) {
        return MMA.balanceOf(msg.sender);
    }

    function CheckProductLength() public view returns (uint) {
        return products.length;
    }

    // New function to return the name of the minted NFT
    function getNFTName() public view returns (string memory) {
        return MMA.name();
    }
}
