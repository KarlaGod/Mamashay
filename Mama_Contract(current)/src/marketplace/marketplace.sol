// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import {IERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import {MAMA}  "../NFT.sol";

contract Ecommerce {

    IERC20 MMA;
    address Owner;
    
    //event for buying book
    event ProductPurchase(address indexed  purchaser, uint indexed amount, uint indexed  price, uint index);
    //event for approving book
    event productApproval(address indexed  approver, uint indexed amount, uint indexed price);
    //event for publishing book
    event productPublished(address indexed  approver, uint indexed amount, uint indexed price);
    //event for deleting book
    event productDelete(address indexed   seller, uint indexed amount, uint indexed price);
    //event for marking purchase as completed
    event Completed(address indexed purchaser, uint indexed amount, uint indexed price, uint index);
    
    struct Product{
        uint id; 
        string name; 
        uint price; 
        string vendorName;
        string Category;
        State ProductState;
    }

    enum State{
        approved,
        pending,
        disapproved
    }

    Product[] public products;
    Product[] public purchasedProducts;

    constructor(address _ERC20_Contract) {
        MMA = IERC20(_ERC20_Contract);
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == Owner, "Only Admin can call this function");
        _;
    }

    
    //function for publishing products
    function PublishProduct(
        uint _id,
        string memory _name,
        string memory _vendorName,
        uint _price,
        string memory _Category
        ) public payable{
          Product memory book = Product({
            id : _id,
            name : _name,
            price : _price,
            vendorName : _vendorName,
            Category : _Category,
            ProductState: State.pending
          });
          products.push(book);
          emit productPublished(msg.sender, _price, book.id);
    }
    //function for approving products
    function ApproveProduct(uint _id) public onlyOwner{
        Product storage book = products[_id];
        require(book.ProductState == State.pending || book.ProductState == State.disapproved, "Product is already approved");
        book.ProductState = State.approved;
        emit productApproval(msg.sender, book.price, book.id);
    }

    // function for buying products
    function buyProduct(uint _amount, uint bookID) public payable returns (bool){
        require(_amount >= products[bookID].price, "Insufficient funds");
        require(products[bookID].ProductState == State.approved, "Product is not approved");
        MMA.approve(address(this), _amount);
        MMA.transferFrom(msg.sender, address(this), _amount);
        purchasedProducts.push(products[bookID]);
        emit ProductPurchase(msg.sender, _amount, products[bookID].price, products[bookID].id);
        return true;
    }
    
    //function for deleting products
    function DeleteProduct(uint _id) public onlyOwner {
        require(_id < products.length, "Product ID is invalid");
        products[_id] = products[products.length - 1]; 
        products.pop();
        emit productDelete(msg.sender, products[_id].price, products[_id].id);
    }

    //function to withdraw all token in the contract
    function Withdraw() public onlyOwner{
        MMA.transfer(msg.sender, MMA.balanceOf(address(this)));
        emit Completed(msg.sender, MMA.balanceOf(address(this)), MMA.balanceOf(address(this)), MMA.balanceOf(address(this)));
    }

    function CheckBalance() public view returns (uint){
        return MMA.balanceOf(msg.sender);
    }

    function CheckProductLength() public view returns (uint){
        return products.length;
    }

}