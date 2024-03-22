"use client"
import React, { Fragment, useState } from 'react'
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
import food from '@/public/homepage-img/goatmeatsoup.png'
import arrow from '@/public/homepage-img/arrow.svg'
import join from '@/public/homepage-img/join.svg'
import { products, vendors } from './data'
import Showcase from '../modals/Showcase'

const Page = () => {
  const [showModal, setShowModal] = useState(false);

  return (
    <Fragment>
    <main className="min-h-screen bg-secondary text-colort">
      {/* Header of the Page */}
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
            <Link href='../user/chats' className='p-2 border bg-colort rounded-full flex justify-center h-fit'><Image src={message} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-5 bg-yellow rounded-full'></div>
            <Link href='../user/notification' className='p-2 border bg-colort rounded-full flex justify-center h-fit'><Image src={notification} alt='...' width={10} height={10} /></Link><div className='h-2 w-2 -ml-5 bg-yellow rounded-full'></div>
            <Link href='../user/settings' className='p-2 border bg-colort rounded-full flex justify-center h-fit'><Image src={setting} alt='...' width={13} height={13} /></Link><div className='h-2 w-2 -ml-5 bg-yellow rounded-full'></div>
        </div>
      </header>

      {/* Logo Container */}
      <div className='flex justify-center items-center pt-24 min-h-56'>
          <Image src={name} alt='...' width={200} height={200} className='h-20 w-44 p-2' />
      </div>

      {/* Filter and Search */}
      <div className='flex p-3 gap-2'>
        <div className='p-2 bg-primary rounded-full flex justify-center w-fit'><Image src={filter} alt='...' width={15} height={15} /></div>
        <input type="text" placeholder='Search for food or any organic product...' className='p-2 w-full rounded-full text-colort text-xs' />
        <div className='p-2 bg-primary rounded-full flex justify-center w-fit'><Image src={search} alt='...' width={15} height={15} /></div>
      </div>

      {/* Favourite Vendors */}
      <div className='p-3'>
        <h1 className='flex items-center text-sm font-bold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Favourite Vendors</h1>
        <div className='flex py-2 overflow-x-scroll'>
          {
            vendors.map((vendor, index) => {
              return(
                <div className='flex-none bg-tertiary mx-1 px-2 py-3 w-16 grid justify-center text-center rounded-lg' key={index}>
                  <Image src={vendor.profile} alt='...' width={40} height={40} className='rounded-full flex justify-center' />
                  <p className='text-xs mt-2'>{vendor.name}</p>
                </div>
              )
            })
          }
        </div>

        {/* Buttons for message and orders */}
        <div className='flex gap-3 pt-8'>
          <Link href='../user/chats' className='flex px-5 py-2 items-center bg-black w-1/2 rounded-lg'><Image src={message} alt='...' width={13} height={13} /><p className='border-l border-colort text-sm text-primary ml-2 pl-2'>Messages</p></Link>
          <Link href='../user/orders' className='flex px-5 py-2 items-center bg-black w-1/2 rounded-lg'><Image src={cart} alt='...' width={13} height={13} /><p className='border-l border-colort text-sm text-primary ml-2 pl-2'>Orders</p></Link>
        </div>
      </div>

      {/* Favourite Products */}
      <div className='px-3 pt-4'>
        <h1 className='flex items-center text-sm font-bold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Favourite Products</h1>
        <div className='flex py-2 overflow-x-scroll'>
          {
            products.map((product, index) => {
              return(
                <div key={index} className='flex-none bg-black p-2 mx-1 rounded-lg w-[130px]'>
                  <div className='flex items-center mb-2'>
                    <Image src={product.profile} alt='...' width={15} height={15} className='rounded-full' />
                    <p className='text-[10px] font-semibold ml-2'>{product.user}</p>
                  </div>
                  <Image src={product.img} alt='...' width={130} height={130} />
                  <div>
                    <p className='text-[10px] font-bold mt-1'>{product.food}</p>
                    <div className='flex items-center mt-1'>
                      <p className='text-[8px] font-bold pr-1 border-r mr-1 overflow-hidden'>{product.ingredients}</p>
                      <p className='flex items-center text-[8px]'><Image src={product.star} alt='...' width={13} height={13} className='pr-1' /> {product.rating}</p>
                    </div>
                    <div className='flex items-center'>
                      <div className='px-1 mr-2 text-[8px] my-2 font-semibol text-secondary bg-tertiary rounded-sm'>BONUS</div>
                      <p className='text-[8px]'>{product.bonus}</p>
                    </div>
                    <p className='text-[10px] font-semibold text-tertiary'>N{product.price}.00</p>
                    <button className='text-center bg-tertiary w-full py-1 mt-2 text-secondary rounded-md' onClick={() => setShowModal(true)}>Buy</button>
                  </div>
                </div>
              )
            })
          }
        </div>
      </div>

      {/* For You */}
      <div className='px-3 pt-8 pb-4'>
        <h1 className='flex items-center text-sm font-bold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> For You</h1>
        <div>
          <div className='w-[140px] py-2'>
            <Image src={food} alt='...' width={140} height={100} />
            <div className='bg-primary -mt-2 px-2 rounded-b-lg'>
              <div className='flex justify-between'>
                <h1 className='text-tertiary text-xs font-bold mt-4'>Explore</h1>
                <p className='bg-secondary p-3 justify-center items-center -mt-4 rounded-full'><Image src={arrow} alt='...' width={15} height={5} /></p>
              </div>
              <p className='text-secondary text-xs py-2'>View The Top Selling Products Now!</p>
            </div>
          </div>
          <div className='bg-primary p-2 w-[140px] rounded-lg'>
            <p className='text-xs'>Join Our Community</p>
            <Image src={join} alt='...' width={50} height={50} />
          </div>
        </div>
      </div>
    </main>
    <Showcase isVisible = {showModal} onClose = {() => setShowModal(false)} />
    </Fragment>
  )
}

export default Page
