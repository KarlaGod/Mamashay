"use client"
import React from 'react'
import Image from 'next/image'
import Link from 'next/link';
import { showcase } from '../[user]/data';

const Page = ({isVisible, onClose}) => {

    if (!isVisible) return null;

    const handleClose = (event) => {
        if(event.target.id === "wrapper") onClose();
    }

  return ( 
    <div className='fixed inset-0 bg-black bg-opacity-25 backdrop-blur-sm flex text-xs text-colort justify-center items-end z-20' id="wrapper" onClick={handleClose}>
        <section className='w-[100%] h-[85%] py-5 px-5 bg-secondary grid rounded-t-3xl'>
            {
                showcase.map((show, index) => {
                    return(
                        <div className='overflow-y-scroll' key={index}>
                            <div className='flex justify-between mb-2'>
                                <div className='flex items-center'>
                                    <Image src={show.profile} alt='...' width={30} height={30} className='rounded-full' />
                                    <p className='font-bold border-l border-colort ml-2 pl-2'>{(show.user).slice(0,4)}'s Kitchen</p>
                                </div>
                                <div className='flex gap-2'>
                                    <div className='border-2 border-primary p-1 rounded-full'>
                                        <Image src={show.starg} alt='...' width={15} height={15} />
                                    </div>
                                    <div className='border-2 border-primary p-1 rounded-full'>
                                        <Image src={show.share} alt='...' width={15} height={15} />
                                    </div>
                                </div>
                            </div>
                            <Image src={show.img} alt='...' width={400} height={400} className='h-[40%] w-full' />

                            <div className='flex items-baseline justify-between'>
                                <div className='flex gap-2 items-baseline'>
                                    <p className='font-bold text-primary text-xl'>N{show.price}.00</p>
                                    <p className='line-through'>N{show.price}.00</p>
                                </div>
                                <div className='flex items-baseline gap-1'>
                                    <p>Rating: </p>
                                    <div className='flex'>
                                    <Image src={show.star} alt='...' width={12} height={12} />
                                    <Image src={show.star} alt='...' width={12} height={12} />
                                    <Image src={show.star} alt='...' width={12} height={12} />
                                    <Image src={show.star} alt='...' width={12} height={12} />
                                    <Image src={show.star} alt='...' width={12} height={12} />
                                    </div>
                                </div>
                            </div>

                            <p className='text-black font-bold mt-2'>{show.food}</p>

                            <div className='flex items-center my-2'>
                                <div className='px-1 mr-2 text-xs my-2 font-semibol text-secondary bg-tertiary rounded-sm'>BONUS</div>
                                <p className='text-xs'>{show.bonus}</p>
                            </div>

                            <div className='flex gap-2 overflow-x-scroll'>
                                <div className='flex flex-none p-2 w-fit rounded-full bg-primary gap-2'>
                                    <Image src={show.location} alt='...' width={10} height={10} />
                                    <p className='border-l border-colort pl-2'>{show.address}</p>
                                </div>
                                <Link href='tel:+2348077116265' className='flex flex-none p-2 w-fit rounded-full bg-primary gap-2'>
                                    <Image src={show.tel} alt='...' width={10} height={10} />
                                    <p className='border-l border-colort pl-2'>{show.teln}</p>
                                </Link>
                                <div className='flex flex-none p-2 w-fit rounded-full bg-primary gap-2'>
                                    <Image src={show.calender} alt='...' width={10} height={10} />
                                    <p className='border-l border-colort pl-2'>{show.address}</p>
                                </div>
                            </div>

                            <div className='flex gap-2 my-4'>
                                <button className='bg-tertiary p-2 rounded-xl w-1/5 flex justify-center items-center'><Image src={show.like} alt='...' width={20} height={20} /></button>
                                <button className='bg-tertiary text-secondary text-lg font-bold p-2 w-4/5 flex justify-center items-center rounded-xl'>Message</button>
                            </div>
                        </div>
                    )
                })
            }
        </section>
    </div>
  )
}

export default Page
