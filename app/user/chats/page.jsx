"use client"
import React from 'react'
import Image from 'next/image'
import { chats, navLinks2 } from '../data'
import search from '@/public/homepage-img/search2.svg'

const Page = () => {
  return (
    <section className='bg-secondary text-colort pt-16'>
      <div className='bg-fborder pb-3 w-full'>
        <div className='bg-secondary pt-2 p-2 mx-2 flex rounded-full text-xs items-center text-colort'>
          <Image src={search} alt='...' width={15} height={15} className='mx-3 stroke-[#999999]' />
          <input type="search" name="search" id="search" placeholder='Search any message here' className='outline-none w-full bg-secondary' />
        </div>
      </div>

      {/* Chat Lists */}
      <div className='px-3 py-4 md:pt-28'>
        <div>
          {
            chats.map((chat, index) => {
              return(
                <div className='rounded-lg flex justify-between items-center pt-3 my-1' onClick={() => router.push('/user/chats/chat')} key={index}>
                  <div className='flex w-full justify-between'>
                    <p className='rounded-full flex justify-center h-fit w-fit mr-2'><Image src={chat.icon} alt='...' width={40} height={40} className='rounded-full' /></p> 
                    <div className='flex justify-between w-full items-center border-b pb-3'>
                        <div className='mr-2'>
                            <h1 className='text-sm text-black font-semibold'>{chat.title}</h1>
                            <p className='text-xs'>{chat.message}</p>
                        </div>
                        <div className='text-xs grid place-items-end'><p>{chat.time}</p><p className='h-4 w-4 bg-yellow text-xs text-center text-secondary rounded-full ml-1'>1</p></div>
                    </div>
                  </div>
               </div>
              )
            })
          }
        </div>
      </div>
    </section>
  )
}

export default Page
