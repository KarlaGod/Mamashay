// mamashayFactoryScript.js
const { ethers } = require('ethers');
const { mintNFT } = require("./mintNFT.cjs");


// dotenv.config();

// Contract ABIs
const MAMASHAY_FACTORY_ABI = [
    {
        "type": "constructor",
        "inputs": [
            {
                "name": "_mamaToken",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "NFT",
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
        "name": "MamaNFT",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "contract IMMA"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "approveProduct",
        "inputs": [
            {
                "name": "vendorMarketplace",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "id",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "buyProduct",
        "inputs": [
            {
                "name": "vendorMarketplace",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "amount",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "bookID",
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
        "name": "checkBalance",
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
        "name": "checkEcommerceLength",
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
        "name": "createMamashay",
        "inputs": [
            {
                "name": "name",
                "type": "string",
                "internalType": "string"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "address"
            }
        ],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "deleteProduct",
        "inputs": [
            {
                "name": "vendorMarketplace",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "id",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "ecommerceContracts",
        "inputs": [
            {
                "name": "",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "contract Ecommerce"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "mamaToken",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "contract IMamaToken"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "nftNames",
        "inputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "address"
            }
        ],
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
        "name": "owner",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "address payable"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "publishProduct",
        "inputs": [
            {
                "name": "vendorMarketplace",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "id",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "name",
                "type": "string",
                "internalType": "string"
            },
            {
                "name": "vendorName",
                "type": "string",
                "internalType": "string"
            },
            {
                "name": "price",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "category",
                "type": "string",
                "internalType": "string"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "withdraw",
        "inputs": [],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "event",
        "name": "EcommerceCreated",
        "inputs": [
            {
                "name": "marketplaceAddress",
                "type": "address",
                "indexed": true,
                "internalType": "address"
            },
            {
                "name": "nftName",
                "type": "string",
                "indexed": false,
                "internalType": "string"
            },
            {
                "name": "owner",
                "type": "address",
                "indexed": true,
                "internalType": "address"
            }
        ],
        "anonymous": false
    }
];


const INFURA_PROJECT_ID = "62ec278d3eb941748d8503e6cadaf637";
const PRIVATE_KEY = "9f99ff0dedcbdbb98288753264e6c1d55011adb44b6d95bab080cd45ac2881f1";
const MAMA_TOKEN_ADDRESS = "0x0E1125f98347355D5Be192575f920Ba93237B365";
const MAMASHAY_FACTORY_ADDRESS = "0xe3877d4999f5493ed4da73cbcab88621f015c283";

const provider = new ethers.InfuraProvider('sepolia', INFURA_PROJECT_ID);
const signer = new ethers.Wallet(PRIVATE_KEY, provider);

// Contracts
const mamashayFactoryContract = new ethers.Contract(MAMASHAY_FACTORY_ADDRESS, MAMASHAY_FACTORY_ABI, signer);

// Utility functions
const mintTokens = async (receiver, value) => {
    try {
        const tx = await mamaTokenContract.mint(receiver, value);
        await tx.wait();
        console.log('Mint transaction:', tx);
    } catch (error) {
        console.error('Mint error:', error);
    }
};

const createMarketplace = async (name) => {
    try {
        mintNFT("0x2d122fEF1613e82C0C90f443b59E54468e16525C", "https://rose-cheap-minnow-324.mypinata.cloud/ipfs/QmcPqzeVCUN5svMFsVxorph9zTeQ9bbSktK5L8yPs2A3hT");
        const tx = await mamashayFactoryContract.createMamashay(name);
        const receipt = await tx.wait();
        
        console.log('Marketplace created at:', receipt);
    } catch (error) {
        console.error('Create marketplace error:', error);
    }
};

const publishProduct = async (marketplace, productId, productName, vendor, price, category) => {
    try {
        const tx = await mamashayFactoryContract.publishProduct(marketplace, productId, productName, vendor, price, category);
        await tx.wait();
        console.log('Product published:', tx);
    } catch (error) {
        console.error('Publish product error:', error);
    }
};

const approveProduct = async (marketplace, productId) => {
    try {
        const tx = await mamashayFactoryContract.approveProduct(marketplace, productId);
        await tx.wait();
        console.log('Product approved:', tx);
    } catch (error) {
        console.error('Approve product error:', error);
    }
};

const buyProduct = async (marketplace, price, productId) => {
    try {
        const tx = await mamashayFactoryContract.buyProduct(marketplace, price, productId);
        await tx.wait();
        console.log('Product purchased:', tx);
    } catch (error) {
        console.error('Buy product error:', error);
    }
};

const withdrawFunds = async () => {
    try {
        const tx = await mamashayFactoryContract.withdraw();
        await tx.wait();
        console.log('Funds withdrawn:', tx);
    } catch (error) {
        console.error('Withdraw error:', error);
    }
};

const checkEcommerceLength = async () => {
    try {
        const length = await mamashayFactoryContract.checkEcommerceLength();
        console.log('Ecommerce length:', length.toString());
        return length;
    } catch (error) {
        console.error('Check ecommerce length error:', error);
    }
};

const testMarketplaceCreation = async () => {
    const marketplaceAddress = await createMarketplace("SAGGIO");
    const expectedMarketplace = await mamashayFactoryContract.ecommerceContracts(0);
    console.log('Marketplace creation test:', expectedMarketplace === marketplaceAddress);
};

// Example usage
const main = async () => {
    const initialSupply = ethers.parseUnits('1000', 18);
   
    
    const marketplaceAddress = await createMarketplace("SAGGIO");
    
    await publishProduct("0xE3877d4999f5493ED4da73CBCaB88621F015c283", 1, "Test Product", "Vendor A", 100, "Category A");
    await approveProduct("0xE3877d4999f5493ED4da73CBCaB88621F015c283", 0);
    await buyProduct("0xE3877d4999f5493ED4da73CBCaB88621F015c283", 100, 0);
    await withdrawFunds();
    await checkEcommerceLength();
    await testMarketplaceCreation();
};

// Execute the main function
main().catch((error) => {
    console.error('Error executing script:', error);
});
