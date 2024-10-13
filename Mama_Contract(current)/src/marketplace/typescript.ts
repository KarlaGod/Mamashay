import { ethers } from 'ethers';
import MMAContract from './artifacts/contracts/MMA.sol/MMA.json';

// Replace this with your contract address
const contractAddress = "YOUR_CONTRACT_ADDRESS_HERE";

async function connectWallet(): Promise<ethers.providers.JsonRpcSigner> {
    if (window.ethereum) {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        return provider.getSigner();
    } else {
        throw new Error("No crypto wallet found. Please install it.");
    }
}

async function mintNFT(tokenURI: string): Promise<void> {
    try {
        const signer = await connectWallet();
        const contract = new ethers.Contract(contractAddress, MMAContract.abi, signer);
        const tx = await contract.mintNFT(tokenURI);
        await tx.wait();
        console.log("NFT Minted successfully!");
    } catch (error) {
        console.error("Error minting NFT:", error);
    }
}

mintNFT('https://your-metadata-url.com/metadata.json');
