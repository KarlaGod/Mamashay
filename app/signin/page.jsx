"use client"
import React, { useState, Fragment } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import name from '@/public/sign-up-img/greyname.svg'
// import circle from '@/public/sign-up-img/circle.png'
// import sprint from '@/public/sign-up-img/finger.svg'
import sprint from '../../public/sign-up-img/finger.svg'
import google from '@/public/sign-up-img/google+.svg'
import twitter from '@/public/sign-up-img/twitter.svg'
import Print from '../modals/Printsi'
import { useRouter } from 'next/navigation'
import { register } from '../[user]/data'

const Page = () => {
  const [showModal, setShowModal] = useState(false);

  const [signin, setSignin] = useState({username: '', password: ''});

  const router = useRouter();

  return (
    <Fragment>
      <main className='min-h-screen flex flex-col items-center justify-center bg-secondary'>
        <div className='circle rounded-full overflow-hidden'>
          <Image src={name} alt='...' width={200} height={200} className='h-20 w-36 p-2' />
          {/* <Image src={circle} alt='...'  /> */}
        </div>

        <div className='border-b border-colort w-4/5'>
          <div className='flex gap-10 justify-center pt-10'>
              <Link href='../signin' className='font-bold text-primary border-b-2 pb-1 border-primary'>Sign In</Link>
              <Link href='../signup' className='font-bold text-colort'>Sign Up</Link>
          </div>
          <form action="" className='grid gap-5 py-10' method='POST'>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="username" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Username(blacdav)</label>
                  <input type="text" name="username" id="username" value={signin.username} onChange={(e) => setSignin({...signin, username: e.target.value.trim()})} className='border border-colort text-colort text-lg h-12 px-5 rounded-full' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Password</label>
                  <input type="text" name="password" id="password" value={signin.password} onChange={(e) => setSignin({...signin, password: e.target.value.trim()})} className='border border-colort text-colort text-lg h-12 px-5 rounded-full' />
              </div>
              <div className='flex gap-3'>
                  <button type="submit" onClick={(e) => {e.preventDefault(); register.find((reg) => { reg.username === signin.username && reg.password === signin.password ? router.push('./user', { replace: true }) : console.log('failed') }); }} className='bg-tertiary py-2 px-5 w-4/5 md:w-full h-12 rounded-full'>Sign In</button>
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
