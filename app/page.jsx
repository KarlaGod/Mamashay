"use client"
import Image from "next/image";
import name from '../public/sign-up-img/whitename.svg'
import { useRouter } from "next/navigation";
import { useEffect } from "react";

export default function Home() {
  const router = useRouter()

  useEffect(() => {
    const timer = setTimeout(() => {
      router.push('./start')
    }, 1000)
  }, [router])
  
  return (
    <main className={`flex min-h-screen items-center justify-center bg-primary bg`}>
      <div>
        <Image src={name} alt='...' width={250} height={250} className="h-20 w-60" />
      </div>
    </main>
  );
}
