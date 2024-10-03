"use client"
import React, { Fragment, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import sprint from '@/public/sign-up-img/finger.svg'
import google from '@/public/sign-up-img/google+.svg'
import twitter from '@/public/sign-up-img/twitter.svg'
import Print from '../modals/Printsu'
import { useRouter } from 'next/navigation'

const Page = () => {
  const [showModal, setShowModal] = useState(false);

  const [signUp, setSignUp] = useState({username: '', telephone: '', email: '', password: '', cpassword: ''});

  const router = useRouter();

  const handleInput = (e) => {
    const input = {...signUp, [e.target.name]: e.target.value};
    setSignUp(input);
  }

  const validateInput = () => {
    const err = {};

    if(signUp.username === '') {
      err.name = 'Username must not be blank'
    } else if(signUp.username < 6 || signUp.username > 12){
      err.name = 'Username must be 6 - 12 character'
    }

    if(signUp.telephone === '') {
      err.telephone = 'Please enter your Phone number'
    } else if(signUp.telephone < 11 || signUp.telephone > 11) {
      err.telephone = 'Phone Number must be 11 digits'
    }
  }

  const handleSubmit = () => {
    //
  }

  return (
    <Fragment>
      <main className='min-h-screen flex flex-col items-center justify-center bg-secondary'>
        <div className='border-b border-colort w-4/5'>
          <div className='flex gap-10 justify-center pt-10'>
              <Link href='../signin' className='font-bold text-colort'>Sign In</Link>
              <Link href='../signUp' className='font-bold text-primary border-b-2 pb-1 border-primary'>Sign Up</Link>
          </div>
          <form action="" className='grid gap-5 py-10 relative'>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="username" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Username(blacdav)</label>
                  <input type="text" name="username" id="username" value={signUp.username} onChange={(e) => setSignup({...signUp, username: e.target.value.trim()})} className='border border-colort px-5 h-12 rounded-full text-lg text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Phone Number</label>
                  <input type="tel" name="telephone" id="telephone" value={signUp.telephone} onChange={(e) => setSignup({...signUp, telephone: e.target.value.trim()})} className='border border-colort px-5 h-12 rounded-full text-lg text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Email Address</label>
                  <input type="email" name="email" id="email" value={signUp.email} onChange={(e) => setSignup({...signUp, email: e.target.value.trim()})} className='border border-colort px-5 h-12 rounded-full text-lg text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Password</label>
                  <input type="password" name="password" id="password" value={signUp.password} onChange={(e) => setSignup({...signUp, password: e.target.value.trim()})} className='border border-colort px-5 h-12 rounded-full text-lg text-colort' />
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Confirm Password</label>
                  <input type="password" name="cpassword" id="cpassword" value={signUp.cpassword} onChange={(e) => setSignup({...signUp, cpassword: e.target.value.trim()})} className='border border-colort px-5 h-12 rounded-full text-lg text-colort' />
              </div>
              <div className='flex gap-3'>
                  <button type="submit" onClick={(e) => {e.preventDefault(); console.log(signUp); router.push('../signin')}} className='bg-tertiary py-2 px-5 w-4/5 md:w-full h-12 rounded-full'>Sign Up</button>
                  <div className='bg-tertiary w-1/5 h-12 flex md:hidden justify-center items-center lg:hidden rounded-full' onClick={() => setShowModal(true)}><Image src={sprint} alt='...' width={20} height={20} className='h-12 w-12 p-2' /></div>
              </div>
          </form>
          <p className='w-fit text-primary text-xs text-center font-bold -mb-2 bg-secondary px-1 mx-auto'>Sign in with</p>
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
