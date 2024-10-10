// import { Inter } from "next/font/google";

import Header from "./components/Header";

export const metadata = {
  title: "mamashay",
  description: "An Organic Food App",
};

export default function RootLayout({ children }) {
  return (
      <div className=''>
        <Header />
        {children}
      </div>
  );
}
