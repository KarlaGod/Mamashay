"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import back from '@/public/homepage-img/back.svg'
import { chats, navLinks, notifications } from '../data'

const page = () => {
  return (
    <main className='min-h-screen bg-secondary text-colort'>
      <div className='flex justify-between items-center pt-5 bg-tertiary h-[12%] w-screen fixed'>
        <h1 className='flex items-center text-primary text-xl font-semibold pl-2'><Link href='../'><Image src={back} alt='...' width={25} height={25} className='pr-3' /></Link> Chats</h1>
        <div className='flex gap-2 p-3'>
          {
            navLinks.map((link) => {
              return(
                <div className='flex' key={link.link}>
                  <Link href={link.link} className='p-2 bg-colort rounded-full flex justify-center h-fit'><Image src={link.icon} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-2 bg-yellow rounded-full'></div>
                </div>
              )
            })
          }
        </div>
      </div>

      {/* Recent Notification */}
      <div className='px-3 pt-20 pb-4 md:pt-28'>
        {/* <h1 className='flex items-center text-sm font-bold my-2'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Recent Notifications</h1> */}
        <div>
          {
            chats.map((chat) => {
              return(
                <div className='rounded-lg flex justify-between items-center pt-3 my-1' key={1}>
                  <div className='flex'>
                    <p className='rounded-full flex justify-center h-fit w-fit mr-2'><Image src={chat.icon} alt='...' width={40} height={40} className='rounded-full' /></p> 
                    <div className='flex justify-between items-center border-b pb-3'>
                        <div className='mr-2'>
                            <h1 className='text-sm'>{chat.title}</h1>
                            <p className='text-xs'>{chat.message}</p>
                        </div>
                        <div className='text-xs flex'><p>{chat.time}</p><p className='h-4 w-4 bg-yellow text-xs text-center text-secondary rounded-full ml-1'>1</p></div>
                    </div>
                  </div>
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
