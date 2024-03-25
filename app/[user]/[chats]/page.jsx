"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import back from '@/public/homepage-img/back.svg'
import { chats, navLinks2 } from '../data'
import { usePathname } from 'next/navigation'
import search from '@/public/homepage-img/search2.svg'
import { useRouter } from 'next/navigation'
// import { useRouter } from 'next/router'

const Page = () => {
  const pathname = usePathname();
  const path = pathname === '@/app/modals/Showcase'

  const router = useRouter()

  return (
    <main className='min-h-screen bg-secondary text-colort'>
      <div className='bg-fborder pb-3 fixed'>
        <div className='flex justify-between items-center pt-5 pb-3 h-[12%] w-screen'>
          <h1 className='flex items-center text-primary text-xl font-semibold pl-2'><Link href='../'><Image src={back} alt='...' width={25} height={25} className='pr-3' /></Link> Chats</h1>
          <div className='flex gap-2 p-3'>
            {
              navLinks2.map((link, index) => {
                return(
                  <div className='flex' key={index}>
                    <Link href={link.link} className='p-2 bg-sign rounded-full flex justify-center h-7 w-7'><Image src={link.icon} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-2 bg-yellow rounded-full'></div>
                  </div>
                )
              })
            }
          </div>
        </div>
        <div className='bg-secondary p-2 mx-2 flex rounded-full text-xs items-center text-colort'>
          <Image src={search} alt='...' width={15} height={15} className='mx-3 stroke-[#999999]' />
          <input type="search" name="search" id="search" placeholder='Search any message here' className='outline-none w-full' />
        </div>
      </div>

      {/* Chat Lists */}
      <div className='px-3 pt-32 pb-4 md:pt-28'>
        <div>
          {
            chats.map((chat, index) => {
              return(
                <div className='rounded-lg flex justify-between items-center pt-3 my-1' onClick={() => router.push('/user/chats/chat')} key={index}>
                  <div className='flex'>
                    <p className='rounded-full flex justify-center h-fit w-fit mr-2'><Image src={chat.icon} alt='...' width={40} height={40} className='rounded-full' /></p> 
                    <div className='flex justify-between items-center border-b pb-3'>
                        <div className='mr-2'>
                            <h1 className='text-sm text-black font-semibold'>{chat.title}</h1>
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

export default Page
