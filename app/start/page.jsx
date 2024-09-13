"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import name from '@/public/sign-up-img/greyname.svg'
import { useRouter } from 'next/navigation'

const Start = () => {
  const router = useRouter()

  return (
    <main className='min-h-screen grid items-center justify-center bg2'>
        <div>
          <Image src={name} alt='...' width={250} height={250} className='h-20 w-60' />
        </div>
        <div className='flex justify-center'>
          <button onClick={() => router.push('../signin')} className='h-12 w-4/5 bg-tertiary rounded-full'>Get Started</button>
        </div>
    </main>
  )
}

export default Start
