"use client"
import React from 'react'
import Image from 'next/image'
import name from '@/public/sign-up-img/greyname.svg'
import { usePathname } from 'next/navigation'
import Header from '../components/Header'

const Page = () => {
  const pathname = usePathname()
  const link = pathname === './settings'

  return (
    <main className='min-h-screen grid bg-secondary text-colort'>
      <Header />

      <div className='pt-20 px-3'>
        <p className='py-3 border-b'>Language</p>
        <p className='py-3 border-b'>Updates</p>
        <p className='py-3 border-b'>Terms & Conditions</p>
        <p className='py-3 border-b'>Privacy Policy</p>
        <p className='py-3 border-b'>Legal Info</p>
        <p className='py-3 border-b'>Rate Our App</p>
        <p className='py-3 border-b'>App Version - 1.0</p>
      </div>

      <div className='grid items-end w-full justify-center text-center fixed bottom-10'>
        <Image src={name} alt='...' width={140} height={140} className='ml-2' />
        <div className='border-b w-full px-5 text-xs'>
          <p className='w-fit px-1'>App Version - 1.0A</p>
          <p className='w-fit -mb-3 px-1 bg-secondary'>All rights reserved</p>
        </div>
      </div>
    </main>
  )
}

export default Page
