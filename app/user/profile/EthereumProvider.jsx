import { useEffect, useState } from 'react';
import { ethers } from 'ethers';

const useEthereumProvider = () => {
  const [provider, setProvider] = useState(null);

  useEffect(() => {
    if (typeof window !== 'undefined' && window.ethereum) {
      const ethersProvider = new ethers.providers.Web3Provider(window.ethereum);
      setProvider(ethersProvider);
    } else {
      console.error("Ethereum provider not found. Please install a wallet like MetaMask.");
    }
  }, []);

  return provider;
};

export default useEthereumProvider;
