// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC165 } from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import { OptimismMintableERC20 } from "https://github.com/ethereum-optimism/optimism/blob/v1.1.4/packages/contracts-bedrock/src/universal/OptimismMintableERC20.sol";
// import "../node_modules/@openzeppelin/contracts/utils/SafeMath /SafeMath .sol";
import { ILegacyMintableERC20, IOptimismMintableERC20 } from "https://github.com/ethereum-optimism/optimism/blob/v1.1.4/packages/contracts-bedrock/src/universal/IOptimismMintableERC20.sol";
import { Semver } from "https://github.com/ethereum-optimism/optimism/blob/v1.1.4/packages/contracts-bedrock/src/universal/Semver.sol";
import "./safeMath.sol";

contract MamaToken is ERC20, Ownable(msg.sender) {
    
    using SafeMath for uint256;
    mapping (address => uint) _balances;
    event log(string message, address sender, address recipient, uint256 amount);
    address _contractOwner;
    /// @notice Address of the corresponding version of this token on the remote chain.
    address public immutable REMOTE_TOKEN;
    /// @notice Address of the StandardBridge on this network.
    address public immutable BRIDGE;
    /// @notice Emitted whenever tokens are minted for an account.
    /// @param account Address of the account tokens are being minted for.
    /// @param amount  Amount of tokens minted.
    event Mint(address indexed account, uint256 amount);

    /// @notice Emitted whenever tokens are burned from an account.
    /// @param account Address of the account tokens are being burned from.
    /// @param amount  Amount of tokens burned.
    event Burn(address indexed account, uint256 amount);
    
    
    receive() external payable {
        emit log("Amount received", msg.sender, address(this), msg.value);
        _transfer(address(this), _contractOwner, msg.value);
    }
    fallback() external payable {
        emit log("Amount received", msg.sender, address(this), msg.value);

    }

    modifier onlyBridge() {
        require(msg.sender == BRIDGE, "MamaToken: only bridge can mint and burn");
        _;
    }

    constructor(uint256 initialSupply, address _owner, address _bridge,address _remoteToken) ERC20("Mama", "MMA") {
        _mint(msg.sender, initialSupply);
        _balances[_owner] = initialSupply;
        _contractOwner = _owner;
        REMOTE_TOKEN = _remoteToken;
        BRIDGE = _bridge;
    }

    function remoteToken() public view returns (address) {
        return REMOTE_TOKEN;
    }

    /// @custom:legacy
    /// @notice Legacy getter for BRIDGE.
    function bridge() public view returns (address) {
        return BRIDGE;
    }
    
    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function supportsInterface(bytes4 _interfaceId) external pure virtual returns (bool) {
        bytes4 iface1 = type(IERC165).interfaceId;
        // Interface corresponding to the updated OptimismMintableERC20 (this contract).
        bytes4 iface2 = type(IOptimismMintableERC20).interfaceId;
        return _interfaceId == iface1 || _interfaceId == iface2;
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

    function burn(uint256 amount) public returns (bool value) {
        _burn(msg.sender, amount);
        value = true;
    }
    
    function burnFrom(address account, uint256 amount) public returns (bool value) {
        uint256 decreasedAllowance = allowance(account, msg.sender) - amount;
        _approve(account, msg.sender, decreasedAllowance);
        _burn(account, amount);
        value = true;
    }

    function getBalance(address _acct) public view returns (uint){
        return _balances[_acct];
    }

    /// @notice Allows the StandardBridge on this network to mint tokens.
    /// @param _to     Address to mint tokens to.
    /// @param _amount Amount of tokens to mint.
    function mint(
        address _to,
        uint256 _amount
    )
        external
        virtual
        onlyBridge
    {
        _mint(_to, _amount);
        emit Mint(_to, _amount);
    }

}
