import { Inter } from "next/font/google";
import "./globals.css";
import "@rainbow-me/rainbowkit/styles.css";
// import { GoogleOAuthProvider } from "@react-oauth/google";
import RainbowProvider from "./_auth/RainbowProviders"
// import GoogleProvider from "./auth/GoogleProviders"

const inter = Inter({ subsets: ["latin"] });
const Id = process.env.NEXT_PUBLIC_OAUTH_CLIENT_ID;

export const metadata = {
  title: "mamashay",
  description: "An Organic Food App",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <RainbowProvider>
          {/* <GoogleOAuthProvider clientId={Id}> */}
            {/* <GoogleProvider> */}
              { children }
            {/* </GoogleProvider> */}
          {/* </GoogleOAuthProvider> */}
        </RainbowProvider>
      </body>
    </html>
  );
}
