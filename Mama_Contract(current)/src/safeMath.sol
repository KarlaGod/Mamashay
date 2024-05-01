// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Library for safe mathematical operations.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with overflow protection.
     *
     * _Available since v3.4._
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with overflow protection.
     *
     * _Available since v3.4._
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with overflow protection.
     *
     * _Available since v3.4._
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the division of two unsigned integers, with division by zero protection.
     *
     * _Available since v3.4._
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with division by zero protection.
     *
     * _Available since v3.4._
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

/**
 * @title MathOperations
 * @dev Contract demonstrating the use of SafeMath library.
 */
contract MathOperations {
    using SafeMath for uint256;

    uint256 public result;

    /**
     * @dev Adds two numbers safely.
     */
    function add(uint256 a, uint256 b) public {
        result = a.add(b);
    }

    /**
     * @dev Subtracts two numbers safely.
     */
    function sub(uint256 a, uint256 b) public {
        result = a.sub(b);
    }

    /**
     * @dev Multiplies two numbers safely.
     */
    function mul(uint256 a, uint256 b) public {
        result = a.mul(b);
    }

    /**
     * @dev Divides two numbers safely.
     */
    function div(uint256 a, uint256 b) public {
        result = a.div(b);
    }

    /**
     * @dev Takes the remainder of dividing two numbers safely.
     */
    function mod(uint256 a, uint256 b) public {
        result = a.mod(b);
    }
}
