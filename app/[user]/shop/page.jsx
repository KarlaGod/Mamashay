"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { navLinks } from '../data'
import back from '@/public/homepage-img/back.svg'
import plus from '@/public/homepage-img/add.svg'

const page = () => {
  return (
    <main className="min-h-screen bg2 text-colort bg-primary">
      <div className='pb-3 fixed'>
        <div className='flex justify-between items-center pt-5 pb-3 h-[12%] w-screen'>
          <h1><div onClick={() => window.history.back()} className='flex items-center justify-center w-fit p-1 place-items-center bg-fborder rounded-full ml-3'><Image src={back} alt='...' width={25} height={25} className='pr-3' /></div></h1>
          <div className='flex gap-2 p-3'>
            {
              navLinks.map((link, index) => {
                return(
                  <div className='flex' key={index}>
                    <Link href={link.link} className='p-2 bg-fborder rounded-full flex justify-center h-7 w-7'><Image src={link.icon} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-2 bg-yellow rounded-full'></div>
                  </div>
                )
              })
            }
          </div>
        </div>
      </div>

      <div className={`flex p-3 pt-32 gap-3`}>
        <button className="p-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
          Regulars
        </button>
        <button className="p-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
          Event Packages
        </button>
        <button className="p-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
          Special Packages
        </button>
      </div>

      <div className="w-full h-36">
        <div className='bg-tertiary w-fit rounded-full p-1'>
          <div className='bg-tertiary w-fit rounded-full p-1'>
            <Image src={plus} alt='...' width={25} height={25} />
          </div>
        </div>
        <p>Add Product</p>
      </div>
    </main>
  )
}

export default page
