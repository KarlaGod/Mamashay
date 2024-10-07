// import { Inter } from "next/font/google";

export const metadata = {
  title: "mamashay",
  description: "An Organic Food App",
};

export default function RootLayout({ children }) {
  return (
      <div className=''>
        {children}
      </div>
  );
}
