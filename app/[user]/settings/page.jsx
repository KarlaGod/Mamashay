"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import back from '@/public/homepage-img/back.svg'
import { navLinks } from '../data'
import name from '@/public/sign-up-img/greyname.svg'
import { usePathname } from 'next/navigation'

const Page = () => {
  const pathname = usePathname()
  const link = pathname === './settings'

  return (
    <main className='min-h-screen grid bg-secondary text-colort'>
      <div className='flex justify-between pt-5 bg-fborder h-[12%] w-screen fixed'>
        <h1 className='flex items-center text-primary text-xl font-semibold pl-2'><Link href=''><Image src={back} alt='...' width={25} height={25} className='pr-3' /></Link> Settings</h1>
        <div className='flex gap-2 p-3'>
          {
            navLinks.map((link, index) => {
              return(
                <div className='flex' key={index}>
                  <Link href={link.link} className='p-2 bg-sign rounded-full flex justify-center h-7 w-7'><Image src={link.icon} alt='...' width={15} height={15} /></Link><div className={`h-2 w-2 -ml-2 bg-yellow rounded-full ${link ? 'hidden' : null }`}></div>
                </div>
              )
            })
          }
        </div>
      </div>

      <div className='pt-20 px-3'>
        <p className='py-3 border-b'>Language</p>
        <p className='py-3 border-b'>Updates</p>
        <p className='py-3 border-b'>Terms & Conditions</p>
        <p className='py-3 border-b'>Privacy Policy</p>
        <p className='py-3 border-b'>Legal Info</p>
        <p className='py-3 border-b'>Rate Our App</p>
        <p className='py-3 border-b'>App Version - 1.0</p>
      </div>

      <div className='grid items-end justify-center text-center relative pb-5'>
        <Image src={name} alt='...' width={140} height={140} className='-mb-8 ml-3' />
        <div className='border-b w-fit px-5 text-xs'>
          <p className='w-fit px-1'>App Version - 1.0A</p>
          <p className='w-fit -mb-3 px-1 bg-secondary'>All rights reserved</p>
        </div>
      </div>
    </main>
  )
}

export default Page
