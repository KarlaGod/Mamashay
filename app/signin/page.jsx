"use client"
import React, { useState, Fragment } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import name from '@/public/sign-up-img/circle-name.png'
import sprint from '../../public/sign-up-img/finger.svg'
import google from '@/public/sign-up-img/google+.svg'
import twitter from '@/public/sign-up-img/twitter.svg'
import Print from '../modals/Printsi'
import { useRouter } from 'next/navigation'
import { register } from '../user/data'

const Page = () => {
  const [showModal, setShowModal] = useState(false);

  const [signIn, setSignIn] = useState({username: '', password: ''});

  const router = useRouter();

  const handleInput = (e) => {
    const input = {...signIn, [e.target.name]: e.target.value.trim()};
    setSignIn(input);
  }

  const handleSubmit = (e) => {
    e.preventDefault();

    register.find((reg) => {
      if(reg.username === signIn.username && reg.password === signIn.password) {
        router.push('./user', { replace: true })
      } else {
        console.log('failed')
      }
    })
  }

  const geUser = async () => {
    const res = await fetch('url', {
      headers: {
        'Content-Type': 'application/json'
      }
    })

    if(!res.ok) {
      throw new Error(`Network response was not Okay`)
    }

    const data = res.json();
  }

  return (
    <Fragment>
      <main className='min-h-dvh flex flex-col items-center justify-center bg-secondary no-scrollbar'>
        <div className='rounded-full overflow-hidden'>
          <Image src={name} alt='...' width={150} height={150} className='h-full w-full p-2' />
        </div>

        <div className='border-b border-colort w-4/5'>
          <div className='flex gap-10 justify-center pt-5'>
              <Link href='../signin' className='font-bold text-primary border-b-2 pb-1 border-primary'>Sign In</Link>
              <Link href='../signup' className='font-bold text-colort'>Sign Up</Link>
          </div>
          <form action="" className='grid gap-5 py-10' method='POST'>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="username" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Username(blacdav)</label>
                  <input type="text" name="username" id="username" value={signIn.username} onChange={handleInput} className='border border-colort text-colort text-lg h-12 px-5 rounded-full' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Password</label>
                  <input type="text" name="password" id="password" value={signIn.password} onChange={handleInput} className='border border-colort text-colort text-lg h-12 px-5 rounded-full' />
              </div>
              <div className='flex gap-3'>
                  <button type="submit" onClick={handleSubmit} className='bg-tertiary py-2 px-5 w-4/5 md:w-full h-12 rounded-full'>Sign In</button>
                  <div className='bg-tertiary flex md:hidden justify-center items-center lg:hidden h-12 w-1/5 rounded-full' onClick={() => setShowModal(true)}><Image src={sprint} alt='...' width={10} height={10} className='h-12 w-12 p-2' /></div>
              </div>
          </form>
          <p className='text-primary text-xs font-bold bg-secondary w-fit px-1 -mb-2 mx-auto'>Sign in with</p>
        </div>
        <div className='flex gap-3 mt-5'>
          <div className='p-2 h-12 w-12 border border-colort rounded-full flex justify-center'><Image src={google} alt='...' width={20} height={20} /></div>
          <div className='p-2 h-12 w-12 border border-colort rounded-full flex justify-center'><Image src={twitter} alt='...' width={20} height={20} /></div>
 
        </div>
      </main>
      <Print isVisible = {showModal} onClose = {() => setShowModal(false)} />
    </Fragment>
  )
}

export default Page
