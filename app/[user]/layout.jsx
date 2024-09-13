import { Inter } from "next/font/google";
// import "../globals.css";

// const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "mamashay",
  description: "An Organic Food App",
};

export default function RootLayout({ children }) {
  return (
    // <html lang="en">
      <div className=''>{children}</div>
    // </html>
  );
}
