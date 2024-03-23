"use client"
import React, { Fragment, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { chat } from '../../data'


const Page = ({isVisible, onClose}) => {
    const toggleShow = (e) => {
        if(e.target.id === "wrapper") onClose();
        console.log('done')
    }

  return (
    <Fragment>
    <main className="min-h-screen bg-secondary text-colort">
      {
        chat.map((c, index) => {
            return(
                <div className='w-screen h-screen' key={index}>
                    {/* Header of the Page */}
                    <header className='grid px-3 bg-fborder'>
                        <div className='flex justify-between pt-5 items-center'>
                            <div className='flex items-center'>
                                <div className='flex gap-3 py-3'>
                                    <Image src={c.back} alt='...' width={15} height={15} className='' />
                                    <Image src={c.profile} alt='...' width={40} height={40} className='rounded-full' />
                                </div>
                                <div className='border-l-2 h-fit pl-2 ml-3'>
                                    <h1 className='text-sm font-semibold'>{(c.user).slice(0,4)} Kitchen</h1>
                                    <p className='text-xs text-tertiary'>{c.status}</p>
                                </div>
                            </div>
                            <div className='flex gap-2'>
                                <Link href='#' className='p-1 border border-primary bg-transparent rounded-full grid justify-center items-center h-7 w-7'><Image src={c.store} alt='...' width={13} height={13} /></Link>
                                <Link href='#' className='p-1 border border-primary bg-transparent rounded-full grid justify-center items-center h-7 w-7'><Image src={c.more} alt='...' width={3} height={3} /></Link>
                            </div>
                        </div>

                        <div className='flex gap-2 py-5 overflow-x-scroll text-xs'>
                            <Link href='#' className='flex flex-none py-1 px-3 w-fit rounded-full bg-secondary gap-2'>
                                <Image src={c.calender} alt='...' width={10} height={10} />
                                <p className='border-l pl-2'>{}</p>
                            </Link>
                            <Link href='tel:+2348077116265' className='flex flex-none py-1 px-3 w-fit rounded-full bg-secondary gap-2'>
                                <Image src={c.tel} alt='...' width={10} height={10} />
                                <p className='border-l pl-2'>{c.teln}</p>
                            </Link>
                            <Link href='#' className='flex flex-none py-1 px-3 w-fit rounded-full bg-secondary gap-2'>
                                <Image src={c.location} alt='...' width={10} height={10} />
                                <p className='border-l pl-2'>{c.address}</p>
                            </Link>
                        </div>

                        <div className='text-xs flex justify-between items-center pb-3 gap-3'>
                            <p className='w-4/5'><span className='font-bold'>Desciption: </span>{c.description}</p>
                            <button id='wrapper' onClick={toggleShow} className='flex gap-1 p-2 bg-tertiary items-center text-secondary h-7 rounded-full w-1/5'>More <Image src={c.down} alt='...' width={10} height={10} className='animate-bounce' /></button>
                        </div>
                        <div>
                            
                        </div>
                    </header>

                    <div className='bg-fborder absolute bottom-0 pt-4 pb-6 px-3 gap-2 flex items-center w-screen justify-between'>
                        <div className='flex justify-between bg-secondary p-1 rounded-full w-full'>
                            <div className='flex gap-2'>
                                <button className='bg-fborder rounded-full p-2'><Image src={c.add_doc} alt='...' width={15} height={15} /></button>
                                <input type="text" placeholder='Type message here' className='border-none' />
                            </div>
                            <Image src={c.placeholderimg} alt='...' width={20} height={15} className='mr-3' />
                        </div>
                        <div className='bg-tertiary p-2 rounded-full flex items-center justify-center'><Image src={c.send} alt='...' width={20} height={20} /></div>
                    </div>
                </div>
            )
        })
      }
    </main>
    {/* <Showcase isVisible = {showModal} onClose = {() => setShowModal(false)} /> */}
    </Fragment>
  )
}

export default Page
