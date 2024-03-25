"use client"
import React from 'react'
import Link from 'next/link'
import Image from 'next/image'
import back from '@/public/homepage-img/back.svg'
import { navLinks, orders } from '../data'

const page = () => {
  return (
    <main className='min-h-screen bg-secondary text-colort'>
      <div className='flex justify-between pt-5 bg-fborder h-[12%] w-screen fixed'>
        <h1 className='flex items-center text-primary text-xl font-semibold pl-2'><Link href='./'><Image src={back} alt='...' width={25} height={25} className='pr-3' /></Link> Orders</h1>
        <div className='flex gap-2 p-3'>
          {
            navLinks.map((link, index) => {
              return(
                <div className='flex' key={index}>
                  <Link href={link.link} className='p-2 border-2 border-primary bg-sign rounded-full flex justify-center h-8 w-8'><Image src={link.icon} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-2 bg-yellow rounded-full'></div>
                </div>
              )
            })
          }
        </div>
      </div>

      <div className='px-3 pt-20 pb-4'>
          {
            orders.map((order, index) => {
              return(
                <div key={index} className='flex bg-fborder p-3 mb-2 rounded-lg'>
                  <Image src={order.img} alt='...' width={100} height={100} />
                  <div className='ml-2'>
                    <div className='flex items-center'>
                      <Image src={order.profile} alt='...' width={20} height={20} className='rounded-full' />
                      <p className='border-x text-[8px] font-semibold mx-2 px-2'>{order.user}s Kitchen</p>
                      <p className='flex items-center text-[10px]'><Image src={order.star} alt='...' width={13} height={13} className='pr-1' /> {order.rating}</p>
                    </div>
                    <p className='text-[10px] font-bold mt-2'>{order.food}</p>
                    <div className='flex items-center'>
                      <div className='px-1 mr-2 text-[8px] my-2 font-semibol text-secondary bg-tertiary rounded-sm'>BONUS</div>
                      <p className='text-[8px]'>{order.bonus}</p>
                    </div>
                    <p className='text-[10px] font-semibold text-tertiary'>N{order.price}.00</p>
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
