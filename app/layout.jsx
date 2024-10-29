import { Inter } from "next/font/google";
import "./globals.css";
import "@rainbow-me/rainbowkit/styles.css";
import RainbowProvider from "./providers/RainbowProviders"
// import { SessionProvider } from "./providers/Providers";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "mamashay",
  description: "An Organic Food App",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <RainbowProvider>
          {/* <SessionProvider> */}
            { children }
          {/* </SessionProvider> */}
        </RainbowProvider>
      </body>
    </html>
  );
}
