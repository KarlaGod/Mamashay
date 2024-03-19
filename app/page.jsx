"use client"
import Image from "next/image";
import name from '../public/sign-up-img/whitename.svg'
import { useRouter } from "next/navigation";

export default function Home() {
  const router = useRouter()
  
  return (
    <main className={`flex min-h-screen items-center justify-center bg-primary bg`} onClick={() => router.push('./start')}>
      <div>
        <Image src={name} alt='...' width={250} height={250} className="h-20 w-60" />
      </div>
    </main>
  );
}
