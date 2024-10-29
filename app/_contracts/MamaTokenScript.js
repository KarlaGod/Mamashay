// mamaTokenScript.js

import { ethers } from 'ethers';
// import dotenv from 'dotenv';

// dotenv.config();

//contract's ABI
const MAMA_TOKEN_ABI = [
    {
        "type": "constructor",
        "inputs": [
            {
                "name": "initialSupply",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "_owner",
                "type": "address",
                "internalType": "address"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "fallback",
        "stateMutability": "payable"
    },
    {
        "type": "receive",
        "stateMutability": "payable"
    },
    {
        "type": "function",
        "name": "allowance",
        "inputs": [
            {
                "name": "owner",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "spender",
                "type": "address",
                "internalType": "address"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "approve",
        "inputs": [
            {
                "name": "spender",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "amount",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "balanceOf",
        "inputs": [
            {
                "name": "account",
                "type": "address",
                "internalType": "address"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "burn",
        "inputs": [
            {
                "name": "amount",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "value",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "burnFrom",
        "inputs": [
            {
                "name": "account",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "amount",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "value",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "decimals",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "uint8",
                "internalType": "uint8"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "decreaseAllowance",
        "inputs": [
            {
                "name": "spender",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "subtractedValue",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "getBalance",
        "inputs": [
            {
                "name": "_acct",
                "type": "address",
                "internalType": "address"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "increaseAllowance",
        "inputs": [
            {
                "name": "spender",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "addedValue",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "mint",
        "inputs": [
            {
                "name": "reciever",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "value",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [],
        "stateMutability": "payable"
    },
    {
        "type": "function",
        "name": "name",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "string",
                "internalType": "string"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "symbol",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "string",
                "internalType": "string"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "totalSupply",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "transfer",
        "inputs": [
            {
                "name": "to",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "amount",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "transferFrom",
        "inputs": [
            {
                "name": "from",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "to",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "amount",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "event",
        "name": "Approval",
        "inputs": [
            {
                "name": "owner",
                "type": "address",
                "indexed": true,
                "internalType": "address"
            },
            {
                "name": "spender",
                "type": "address",
                "indexed": true,
                "internalType": "address"
            },
            {
                "name": "value",
                "type": "uint256",
                "indexed": false,
                "internalType": "uint256"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "Transfer",
        "inputs": [
            {
                "name": "from",
                "type": "address",
                "indexed": true,
                "internalType": "address"
            },
            {
                "name": "to",
                "type": "address",
                "indexed": true,
                "internalType": "address"
            },
            {
                "name": "value",
                "type": "uint256",
                "indexed": false,
                "internalType": "uint256"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "log",
        "inputs": [
            {
                "name": "message",
                "type": "string",
                "indexed": false,
                "internalType": "string"
            },
            {
                "name": "sender",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            },
            {
                "name": "recipient",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            },
            {
                "name": "amount",
                "type": "uint256",
                "indexed": false,
                "internalType": "uint256"
            }
        ],
        "anonymous": false
    }
];
const INFURA_PROJECT_ID = "62ec278d3eb941748d8503e6cadaf637";
const PRIVATE_KEY = "";
const MAMA_TOKEN_ADDRESS = "0x0E1125f98347355D5Be192575f920Ba93237B365";
const provider = new ethers.InfuraProvider('sepolia', INFURA_PROJECT_ID);
const signer = new ethers.Wallet(PRIVATE_KEY, provider);
const contract = new ethers.Contract(MAMA_TOKEN_ADDRESS, MAMA_TOKEN_ABI, signer);

// Utility functions
const mintTokens = async (receiver, value) => {
    try {
        const tx = await contract.mint(receiver, value, { value: ethers.parseEther("0") });
        await tx.wait();
        console.log('Mint transaction:', tx);
    } catch (error) {
        console.error('Mint error:', error);
    }
};

const transferTokens = async (to, amount) => {
    try {
        const tx = await contract.transfer(to, ethers.parseUnits(amount.toString(), 18));
        await tx.wait();
        console.log('Transfer transaction:', tx);
    } catch (error) {
        console.error('Transfer error:', error);
    }
};

const transferFromTokens = async (from, to, amount) => {
    try {
        const tx = await contract.transferFrom(from, to, ethers.parseUnits(amount.toString(), 18));
        await tx.wait();
        console.log('TransferFrom transaction:', tx);
    } catch (error) {
        console.error('TransferFrom error:', error);
    }
};

const burnTokens = async (amount) => {
    try {
        const tx = await contract.burn(ethers.parseUnits(amount.toString(), 18));
        await tx.wait();
        console.log('Burn transaction:', tx);
    } catch (error) {
        console.error('Burn error:', error);
    }
};

const burnFromTokens = async (account, amount) => {
    try {
        const tx = await contract.burnFrom(account, ethers.parseUnits(amount.toString(), 18));
        await tx.wait();
        console.log('BurnFrom transaction:', tx);
    } catch (error) {
        console.error('BurnFrom error:', error);
    }
};

const getBalance = async (account) => {
    try {
        const balance = await contract.getBalance(account);
        console.log('Balance of account:', balance.toString());
    } catch (error) {
        console.error('GetBalance error:', error);
    }
};

// Example usage: 
const main = async () => {
    await mintTokens('0x2d122fEF1613e82C0C90f443b59E54468e16525C', ethers.parseUnits('1000', 18));
    await burnTokens(5);
    await burnFromTokens('0x2d122fEF1613e82C0C90f443b59E54468e16525C', 5);
    await getBalance('0x2d122fEF1613e82C0C90f443b59E54468e16525C');
    await transferTokens('0x2d122fEF1613e82C0C90f443b59E54468e16525C', 100);
    await transferFromTokens('0x2d122fEF1613e82C0C90f443b59E54468e16525C', '0x5b9a38e7eF990dA90404d24e0909c22bc25724EE', 10);
};

// Executing the main function
main().catch((error) => {
    console.error('Error executing script:', error);
});
