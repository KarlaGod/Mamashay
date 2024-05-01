// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/utils/math/Math.sol";

contract MamaToken is ERC20, Ownable(msg.sender) {
    
    using Math for uint256;
    mapping (address => uint) _balances;
    event log(string message, address sender, address recipient, uint256 amount);
    address _contractOwner;
    
    receive() external payable {
        emit log("Amount received", msg.sender, address(this), msg.value);
        _transfer(address(this), _contractOwner, msg.value);
    }
    fallback() external payable {
        emit log("Amount received", msg.sender, address(this), msg.value);

    }

    constructor(uint256 initialSupply, address _owner) ERC20("Mama", "MMA") {
        _mint(msg.sender, initialSupply);
        _balances[msg.sender] = initialSupply;
        _contractOwner = _owner;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        _transfer(from, to, amount);
        uint256 currentAllowance = allowance(from, msg.sender);
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        uint256 newAllowance = currentAllowance - amount;
        _approve(from, msg.sender, newAllowance);
        return true;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function burnFrom(address account, uint256 amount) public {
        uint256 currentAllowance = allowance(account, msg.sender);
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        uint256 decreasedAllowance = currentAllowance - amount;
        _approve(account, msg.sender, decreasedAllowance);
        _burn(account, amount);
    }

    function getBalance(address _acct) public view returns (uint){
        return _balances[_acct];
    }
}
