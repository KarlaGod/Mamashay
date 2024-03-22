"use client"
import React, { Fragment, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import sprint from '@/public/sign-up-img/finger.svg'
import google from '@/public/sign-up-img/google+.svg'
import twitter from '@/public/sign-up-img/twitter.svg'
import Print from '../modals/Printsu'

const Page = () => {
  const [showModal, setShowModal] = useState(false);

  return (
    <Fragment>
      <main className='min-h-screen flex flex-col items-center justify-center bg-secondary'>
        <div className='border-b border-colort w-4/5'>
          <div className='flex gap-10 justify-center pt-10'>
              <Link href='../signin' className='font-bold text-colort'>Sign In</Link>
              <Link href='../signup' className='font-bold text-primary border-b-2 pb-1 border-primary'>Sign Up</Link>
          </div>
          <form action="" className='grid gap-5 py-10 relative'>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="username" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Username(blacdav)</label>
                  <input type="text" name="username" id="username" className='border border-colort p-2 rounded-full text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Phone Number</label>
                  <input type="tel" name="telephone" id="telephone" className='border border-colort p-2 rounded-full text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Email Address</label>
                  <input type="email" name="email" id="email" className='border border-colort p-2 rounded-full text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Password</label>
                  <input type="password" name="password" id="password" className='border border-colort p-2 rounded-full text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Confirm Password</label>
                  <input type="text" name="cpassword" id="cpassword" className='border border-colort p-2 rounded-full text-colort' />
              </div>
              <div className='flex gap-3'>
                  <button type="submit" className='bg-tertiary py-2 px-5 w-4/5 rounded-full'>Sign Up</button>
                  <div className='bg-tertiary flex lg:hidden rounded-full' onClick={() => setShowModal(true)}><Image src={sprint} alt='...' width={20} height={20} className='h-10 w-10 p-2' /></div>
              </div>
          </form>
          <p className='w-fit text-primary text-xs text-center font-bold -mb-2 bg-secondary px-1'>Sign in with</p>
        </div>
        <div className='flex gap-3 mt-5'>
          <div className='p-2 border border-colort rounded-full flex justify-center'><Image src={google} alt='...' width={20} height={20} /></div>
          <div className='p-2 border border-colort rounded-full flex justify-center'><Image src={twitter} alt='...' width={20} height={20} /></div>
        </div>
      </main>
      <Print isVisible = {showModal} onClose = {() => setShowModal(false)} />
    </Fragment>
  )
}

export default Page
