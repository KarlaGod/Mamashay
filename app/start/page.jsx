"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import name from '@/public/sign-up-img/greyname.svg'

const start = () => {
  return (
    <main className='min-h-screen grid items-center justify-center bg2'>
        <div>
          <Image src={name} alt='...' width={250} height={250} className='h-20 w-60' />
        </div>
        <div className='flex justify-center'>
          <Link href='../signin' className='py-2 px-5 bg-tertiary rounded-full'>Get Started</Link>
        </div>
    </main>
  )
}

export default start
