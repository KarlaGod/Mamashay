"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import profile from '@/public/homepage-img/profile.png'
import message from '@/public/homepage-img/message.svg'
import notification from '@/public/homepage-img/notification.svg'
import setting from '@/public/homepage-img/settings.svg'
import name from '@/public/sign-up-img/greyname.svg'
import filter from '@/public/homepage-img/filter.svg'
import search from '@/public/homepage-img/search.svg'
import cart from '@/public/homepage-img/cart.svg'
import { vendors } from './data'

const page = () => {
  return (
    <main className="min-h-screen bg-secondary text-colort">
      <header className='flex justify-between bg-tertiary h-[12%] w-screen px-3 pt-5 items-end fixed'>
        <div className='flex items-center'>
            <div className='p-3'>
                <Image src={profile} alt='...' width={40} height={40} className='rounded-full' />
            </div>
            <div className='border-l border-colort h-fit p-2'>
                <h1 className='text-sm font-semibold'>Emeka Jordan</h1>
                <p className='text-xs'>User</p>
            </div>
        </div>
        <div className='flex gap-2 p-3'>
            <Link href='../user' className='p-2 border bg-colort rounded-full flex justify-center h-fit'><Image src={message} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-5 bg-yellow rounded-full'></div>
            <Link href='../user/notification' className='p-2 border bg-colort rounded-full flex justify-center h-fit'><Image src={notification} alt='...' width={10} height={10} /></Link><div className='h-2 w-2 -ml-5 bg-yellow rounded-full'></div>
            <Link href='../user/settings' className='p-2 border bg-colort rounded-full flex justify-center h-fit'><Image src={setting} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-5 bg-yellow rounded-full'></div>
        </div>
      </header>

      <div className='flex justify-center items-center pt-24 min-h-56'>
          <Image src={name} alt='...' width={200} height={200} className='h-20 w-44 p-2' />
      </div>

      <div className='flex p-3 gap-2'>
        <div className='p-2 bg-primary rounded-full flex justify-center w-fit'><Image src={filter} alt='...' width={15} height={15} /></div>
        <input type="text" placeholder='Search for food or any organic product...' className='p-2 w-full rounded-full text-colort text-xs' />
        <div className='p-2 bg-primary rounded-full flex justify-center w-fit'><Image src={search} alt='...' width={15} height={15} /></div>
      </div>

      <div className='p-3'>
        <h1 className='flex items-center text-sm font-bold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Favourite Vendors</h1>
        <div className='flex py-2 overflow-x-scroll'>
          {
            vendors.map((vendor) => {
              return(
                <div className='bg-tertiary mx-1 px-2 py-3 grid justify-center text-center rounded-lg' key={vendor.name}>
                  <Image src={vendor.profile} alt='...' width={40} height={40} className='rounded-full flex justify-center' />
                  <p className='text-xs mt-2'>{vendor.name}</p>
                </div>
              )
            })
          }
        </div>
        <div className='flex gap-3 pt-8'>
          <button className='flex px-5 py-2 items-center bg-black w-1/2 rounded-lg'><Image src={message} alt='...' width={13} height={13} /><p className='border-l border-colort text-sm text-primary ml-2 pl-2'>Messages</p></button>
          <Link href='../user/orders' className='flex px-5 py-2 items-center bg-black w-1/2 rounded-lg'><Image src={cart} alt='...' width={13} height={13} /><p className='border-l border-colort text-sm text-primary ml-2 pl-2'>Orders</p></Link>
        </div>
      </div>

      <div className='px-3 pt-4'>
        <h1 className='flex items-center text-sm font-bold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Favourite Products</h1>
        <div className='flex py-2 overflow-x-scroll'>
          {
            vendors.map((vendor) => {
              return(
                <div className='bg-tertiary mx-1 px-2 py-3 grid justify-center text-center rounded-lg' key={vendor.name}>
                  <Image src={vendor.profile} alt='...' width={40} height={40} className='rounded-full flex justify-center' />
                  <p className='text-xs mt-2'>{vendor.name}</p>
                </div>
              )
            })
          }
        </div>
      </div>

      <div className='px-3 pt-8'>
        <h1 className='flex items-center text-sm font-bold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> For You</h1>
        <div className='flex py-2 overflow-x-scroll'>
          {
            vendors.map((vendor) => {
              return(
                <div className='bg-tertiary mx-1 px-2 py-3 grid justify-center text-center rounded-lg' key={vendor.name}>
                  <Image src={vendor.profile} alt='...' width={40} height={40} className='rounded-full flex justify-center' />
                  <p className='text-xs mt-2'>{vendor.name}</p>
                </div>
              )
            })
          }
        </div>
      </div>
    </main>
  )
}

export default page
