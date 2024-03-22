"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import back from '@/public/homepage-img/back.svg'
import { navLinks, notifications } from '../data'

const page = () => {
  return (
    <main className='min-h-screen bg-secondary text-colort'>
      <div className='flex justify-between items-center pt-5 bg-tertiary h-[12%] w-screen fixed'>
        <h1 className='flex items-center text-primary text-xl font-semibold pl-2'><Link href='../'><Image src={back} alt='...' width={25} height={25} className='pr-3' /></Link> Notifications</h1>
        <div className='flex gap-2 p-3'>
          {
            navLinks.map((link, index) => {
              return(
                <div className='flex' key={index}>
                  <Link href={link.link} className='p-2 bg-colort rounded-full flex justify-center h-fit'><Image src={link.icon} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-2 bg-yellow rounded-full'></div>
                </div>
              )
            })
          }
        </div>
      </div>

      {/* Recent Notification */}
      <div className='px-3 pt-20 md:pt-28'>
        <h1 className='flex items-center text-sm font-bold my-2'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Recent Notifications</h1>
        <div>
          {
            notifications.map((notify, index) => {
              return(
                <div className='bg-black rounded-lg flex justify-between items-center p-3 my-1' key={index}>
                  <div className='flex'>
                  <p className='p-2 border bg-primary rounded-full flex justify-center h-fit w-fit mr-2'><Image src={notify.icon} alt='...' width={20} height={20} className='h-auto' /></p> 
                  <div>
                    <h1 className='text-sm'>{notify.title}</h1>
                    <p className='text-xs'>{notify.message}</p>
                  </div>
                  </div>
                  <div className='text-xs flex'><p>{notify.time}</p><p className='h-2 w-2 bg-tertiary rounded-full ml-1'></p></div>
               </div>
              )
            })
          }

          
        </div>
      </div>

      {/* Previous Notifications */}
      <div className='px-3 py-4'>
        <h1 className='flex items-center text-sm font-bold my-2'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Previous Notifications</h1>
        <div>
          {
            notifications.map((notify, index) => {
              return(
                <div className='bg-black rounded-lg flex justify-between items-center p-3 my-1' key={index}>
                  <div className='flex'>
                  <p className='p-2 border bg-primary rounded-full flex justify-center h-fit w-fit mr-2'><Image src={notify.icon} alt='...' width={20} height={20} className='h-auto' /></p> 
                  <div>
                    <h1 className='text-sm'>{notify.title}</h1>
                    <p className='text-xs'>{notify.message}</p>
                  </div>
                  </div>
                  <div className='text-xs flex'><p>{notify.time}</p><p className='h-2 w-2 bg-tertiary rounded-full ml-1'></p></div>
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
