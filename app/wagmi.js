import { getDefaultConfig } from '@rainbow-me/rainbowkit';
import { arbitrum, base, mainnet, optimism, polygon, sepolia } from 'viem/chains';

export const config = getDefaultConfig({
    appName: 'Mamashay',
    projectId: '',
    chains: [mainnet, arbitrum, base, optimism, polygon, sepolia, ...(process.env.NEXT_PUBLIC_TESTNESTS === 'true' ? [sepolia] : []),],
    ssr: true,
});
