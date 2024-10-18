import Header from "./components/Header";
import ScreenSize from "./screenSize";

export const metadata = {
  title: "mamashay",
  description: "An Organic Food App",
};

export default function RootLayout({  children, visible  }) {
  return (
      <ScreenSize>
        <main className='min-h-screen bg-secondary text-colort'>
          <Header visible={visible} />
          { children }
        </main>
      </ScreenSize>
  );
}
