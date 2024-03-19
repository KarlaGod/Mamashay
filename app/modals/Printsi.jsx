"use client"
import React from 'react'
import Image from 'next/image'
import printf from '@/public/sign-up-img/print.svg'

const Print = ({isVisible, onClose}) => {

    if (!isVisible) return null;

    const handleClose = (event) => {
        if(event.target.id === "wrapper") onClose();
    }
  return (
    <div className='fixed inset-0 bg-black bg-opacity-25 backdrop-blur-sm flex text-xs text-colort justify-center items-end z-20' id="wrapper" onClick={handleClose}>
        <section className='w-[90%] h-[35%] py-5 px-5 bg-white flex flex-col justify-center items-center rounded-3xl mb-8'>
            <h1 className='font-bold'>Biometrics</h1>
            <Image src={printf} alt='...' width={40} height={40} className='my-8' />
            <p className='text-center w-[80%]'>Place your finger on the fingerprint scanner</p>
        </section>
    </div>
  )
}

export default Print
