"use client"
import React, { Fragment, useState, useEffect } from 'react'
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
  const [error, setError] = useState({});

  const router = useRouter();

  const handleInput = (e) => {
    const input = {...signUp, [e.target.name]: e.target.value.trim()};
    setSignUp(input);
  }

  const validateInput = (signUp) => {
    const err = {};

    if(signUp.username === '') {
      err.username = 'Username must not be blank'
    } else if(signUp.username.length < 6 || signUp.username.length > 12){
      err.username = 'Username must be 6 - 12 character'
    }

    if(signUp.telephone === '') {
      err.telephone = 'Please enter your Phone number'
    } else if(signUp.telephone.length < 11 || signUp.telephone.length > 11) {
      err.telephone = 'Phone Number must be 11 digits'
    }

    if(signUp.email === '') {
      err.email = 'Please enter your email'
    } else if(!signUp.email.includes('@') && !signUp.email.includes('.')) {
      err.email = 'Email pattern is not correct'
    }

    if(signUp.password === '') {
      err.password = 'Please enter your password'
    } else if(signUp.password.length < 4 || signUp.password.length > 8) {
      err.password = 'Password must be 4 - 8 characters'
    }

    if(signUp.cpassword === '') {
      err.cpassword = 'Please confirm your password'
    } else if(signUp.cpassword !== signUp.password) {
      err.cpassword = 'Passwod Mismatch'
    }

    console.log(signUp)

    return err;
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(signUp);

    if(Object.keys(validateInput(signUp)).length === 0) {
      // postFormData();
      router.push('../signin');
    }
  }

  const postFormData = async () => {
    try {
      const res = await fetch('url', {
        method: 'POST',
        body: JSON.stringify(signUp),
        headers: {
          'Content-Type': 'application/json',
        },
      });
      const data = await res.json();
      console.log(data);
    } catch(error) {
      console.error(`Network Error`)
    }
  }

  useEffect(() => {
    setError(validateInput(signUp));
  }, [signUp]);

  return (
    <Fragment>
      <main className='min-h-dvh flex flex-col items-center justify-center bg-secondary'>
        <div className='border-b border-colort w-4/5'>
          <div className='flex gap-10 justify-center'>
              <Link href='../signin' className='font-bold text-colort'>Sign In</Link>
              <Link href='../signUp' className='font-bold text-primary border-b-2 pb-1 border-primary'>Sign Up</Link>
          </div>
          <form action="" className='grid gap-3 py-5 relative'>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="username" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Username(blacdav)</label>
                  <input type="text" name="username" id="username" value={signUp.username} onChange={handleInput} className={`border ${error.username ? 'border-red-600' : 'border-colort'} outline-none px-5 h-12 rounded-full text-lg text-colort`} />
                  <small className="text-red-600 ml-4">{error.username}</small>
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Phone Number</label>
                  <input type="tel" name="telephone" id="telephone" value={signUp.telephone} onChange={handleInput} className={`border ${error.telephone ? 'border-red-600' : 'border-colort'} outline-none px-5 h-12 rounded-full text-lg text-colort`} />
                  <small className="text-red-600 ml-4">{error.telephone}</small>
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Email Address</label>
                  <input type="email" name="email" id="email" value={signUp.email} onChange={handleInput} className={`border ${error.email ? 'border-red-600' : 'border-colort'} outline-none px-5 h-12 rounded-full text-lg text-colort`} />
                  <small className="text-red-600 ml-4">{error.email}</small>
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Password</label>
                  <input type="password" name="password" id="password" value={signUp.password} onChange={handleInput} className={`border ${error.password ? 'border-red-600' : 'border-colort'} outline-none px-5 h-12 rounded-full text-lg text-colort`} />
                  <small className="text-red-600 ml-4">{error.password}</small>
              </div>
              <div className='flex flex-col text-xs'>
                  <label htmlFor="password" className='text-colort -mb-2 ml-4 z-10 bg-secondary w-fit px-1'>Confirm Password</label>
                  <input type="password" name="cpassword" id="cpassword" value={signUp.cpassword} onChange={handleInput} className={`border ${error.cpassword ? 'border-red-600' : 'border-colort'} outline-none px-5 h-12 rounded-full text-lg text-colort`} />
                  <small className="text-red-600 ml-4">{error.cpassword}</small>
              </div>
              <div className='flex gap-3'>
                  <button type="submit" onClick={handleSubmit} className='bg-tertiary py-2 px-5 w-4/5 md:w-full h-12 rounded-full'>Sign Up</button>
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
