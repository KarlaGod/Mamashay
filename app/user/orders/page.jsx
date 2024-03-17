"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import back from '@/public/homepage-img/back.svg'
import { navLinks,orders } from '../data'

const page = () => {
  return (
    <main className='min-h-screen bg-secondary text-colort'>
      <div className='flex justify-between pt-5 bg-tertiary h-[12%] w-screen fixed'>
        <h1 className='flex items-center text-primary text-xl font-semibold pl-2'><Link href='./'><Image src={back} alt='...' width={25} height={25} className='pr-3' /></Link> Orders</h1>
        <div className='flex gap-2 p-3'>
          {
            navLinks.map((link) => {
              return(
                <div className='flex' key={1}>
                  <Link href={link.link} key={link.link} className='p-2 bg-colort rounded-full flex justify-center h-fit'><Image src={link.icon} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-2 bg-yellow rounded-full'></div>
                </div>
              )
            })
          }
        </div>
      </div>

      <div className='px-3 pt-20'>
          {
            orders.map((order) => {
              return(
                <div key={1} className='flex bg-black p-3 rounded-lg'>
                  <Image src={order.img} alt='...' />
                  <div>
                    <div className='flex items-center'>
                      <Image src={order.profile} alt='...' width={20} height={20} className='rounded-full' />
                      <p className='border-x text-xs font-semibold mx-2 px-2'>{order.user} Kitchen</p>
                      <p className='flex items-center text-sm'><Image src={order.star} alt='...' width={18} height={18} className='pr-1' /> {order.rating}</p>
                    </div>
                    <p className='text-sm font-bold mt-3'>{order.food}</p>
                    <div className='flex items-center'>
                      <div className='py-1 px-2 text-[10px] my-3 font-semibol text-secondary bg-tertiary rounded-md'>BONUS</div>
                      <p className='text-xs'>{order.bonus}</p>
                    </div>
                    <p className='text-s font-semibold text-tertiary'>N{order.price}.00</p>
                  </div>
                </div>
              )
            })
          }
      </div>
    </main>
  )
}

export default page
