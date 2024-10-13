// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import {Ecommerce} from "./BukShop.sol";
import {IERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract MamashayFactory {
    
    address payable public owner;
    Ecommerce[] public ecomerceContract;
    IERC20 BorderlessToken;
    event EcomerceCreated(address indexed tokenContract ,address indexed owner);

    constructor(address _BorderlessToken) {
        owner = payable(msg.sender);
        BorderlessToken = IERC20(_BorderlessToken);
    }

    function createMamashay(address _borderlessToken) public payable returns (address) {
        Ecommerce new_Mamashay = new Ecommerce(_borderlessToken);
        ecomerceContract.push(new_Mamashay);
        emit EcomerceCreated(address(new_Mamashay), msg.sender);
        return address(new_Mamashay);
    }

    function PublishProduct(
        address VendorMarketplace,
        uint _id,
        string memory _name,
        string memory _vendorName,
        uint _price,
        string memory _Category
        ) public payable{

        PublishProduct(
        uint _id,
        string memory _name,
        string memory _vendorName,
        uint _price,
        string memory _Category
        )
          
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

    fallback() external payable { }
    receive() external payable { }
}