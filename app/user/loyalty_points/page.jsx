import React from 'react'
import Header from "../components/Header"
import Image from 'next/image'
import gift from '@/public/homepage-img/gift.png'

const Page = () => {
  return (
    <article>
      <Header />
      <section className='pt-24 bg-fborder px-5 h-screen'>
        <p className='text-xs'>Total Points</p>
        <p className='text-3xl text-primary font-bold'>2000</p>

        <div className='mt-5 pb-5'>
          <div className='flex items-center bg-secondary p-3 rounded-md'>
            <div>
              <p className='font-bold'>+250 Points</p>
              <p className='text-xs w-4/5'>You have earned points from completing an order.</p>
            </div>
            <button className='flex gap-1 bg-tertiary px-2 py-1 rounded-full w-1/5 items-center'>
              <p className='border-e border-fborder font-bold pe-1 text-fborder text-xs'>Claim</p>
              <Image src={gift} alt='gift' width={20} height={20} />
            </button>
          </div>
        </div>
      </section>
    </article>
  )
}

export default Page
