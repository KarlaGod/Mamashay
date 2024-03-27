"use client"
import React, { Fragment, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { chat, products } from '../../data'
import More from '../../../modals/More'
import Options from '@/app/modals/Options'

const Page = () => {
    const [toggle, setToggle] = useState(true)
    const [toggle1, setToggle1] = useState(false)
    const [toggle2, setToggle2] = useState(false)
    
  return (
    <Fragment>
    <main className="min-h-screen bg-fborder text-colort chatbg">
      {
        chat.map((c, index) => {
            return(
                <div className='w-screen h-screen flex flex-col' key={index}>
                    {/* Header of the Page */}
                    <header className='grid px-3 z-10 bg-fborder'>
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
                                <Link href='#' className='p-1 border-2 border-primary bg-transparent rounded-full grid justify-center items-center h-7 w-7'><Image src={c.store} alt='...' width={13} height={13} /></Link>
                                <Link href='#' onClick={() => setToggle1(true)} className='p-1 border-2 border-primary bg-transparent rounded-full grid justify-center items-center h-7 w-7'><Image src={c.more} alt='...' width={3} height={3} /></Link>
                            </div>
                        </div>

                        <div className={`flex gap-2 py-5 overflow-x-scroll text-[8px] ${!toggle ? 'flex-wrap' : ''}`}>
                            <Link href='#' className='flex flex-none py-1 px-3 w-fit rounded-full bg-secondary gap-2'>
                                <Image src={c.calender} alt='...' width={10} height={10} />
                                <p className='border-l pl-2'>{c.address}</p>
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
                            <p className={`text-[9px] ${!toggle ? 'w-full' : 'w-4/5'}`}><span className='font-bold'>Desciption: </span>{c.description}</p>
                            <button onClick={() => setToggle(!toggle)} className={`${!toggle ? 'hidden' : 'flex'} gap-1 p-2 bg-tertiary items-center text-secondary h-7 rounded-full w-1/5`}>More <Image src={c.down} alt='...' width={10} height={10} className='animate-bounce' /></button>
                        </div>
                        <div className={`${toggle ? 'hidden' : 'grid pb-3'}`}>
                            <h1 className='flex items-center text-sm text-black font-semibold'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Other Products</h1>
                            <div className='flex gap-2 py-2 overflow-x-scroll'>
                            {
                                products.map((product, index) => {
                                return(
                                    <div className='flex flex-none bg-secondary mx-1 px-2 py-2 w-45 rounded-lg' key={index}>
                                        <Image src={product.img} alt='...' width={40} height={40} className='h-12 w-12 rounded-lg flex mr-2' />
                                        <div className='text-xs grid'>
                                            <p className='font-semibold text-black'>{product.user}</p>
                                            <p>{product.ingredients}</p>
                                            <div className='flex'>
                                                <Image src={product.star} alt='...' width={10} height={10} className='mr-1' />
                                                <p>{product.rating}</p>
                                            </div>
                                        </div>
                                    </div>
                                )
                                })
                            }
                            </div>
                            <div className='flex gap-2 pt-4 text-xs'>
                                <div href='#' className='flex flex-none items-center py-1 px-3 w-fit rounded-full bg-secondary gap-2'>
                                    <Image src={c.star} alt='...' width={10} height={10} />
                                    <p className='border-l pl-2'>See reviews</p>
                                </div>
                                <button onClick={() => setToggle(!toggle)} className='flex gap-1 p-2 bg-tertiary items-center text-secondary h-7 rounded-full w-fit'>Less <Image src={c.up} alt='...' width={10} height={10} className='animate-bounce' /></button>
                            </div>
                        </div>
                    </header>

                    <div className='overflow-y-scroll bg-tertiary pt-3 px-3'>
                        <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempora non cumque hic, ab fugit eligendi alias provident corporis rem eaque at quasi maiores ut earum culpa in laudantium nulla delectus, labore similique doloribus iste. Placeat animi quasi amet quia, sapiente earum dicta similique natus. Distinctio obcaecati quasi, iste culpa reiciendis dolorum magni, ut, officia aspernatur expedita sequi. Maiores rerum dolorem harum excepturi. Quam consequuntur veritatis libero blanditiis sequi labore quae aut ullam voluptate ex perspiciatis architecto dignissimos, eligendi natus est reiciendis cupiditate consectetur. Ab suscipit sint non velit at omnis perferendis est fugiat id eveniet unde explicabo amet qui, labore minus earum cum distinctio aliquid? Voluptatem, perspiciatis nemo molestias saepe aliquam sunt unde est! Quis, ullam sed, reprehenderit velit corrupti accusamus natus repellat necessitatibus enim dignissimos voluptatibus aperiam. Autem quae pariatur tempora voluptate distinctio eveniet officiis sed nostrum modi magni tempore ea accusamus, blanditiis unde fugit cum quas aliquam voluptatibus nobis nulla voluptatem quo praesentium eum repellendus. Dolore incidunt voluptatibus necessitatibus in maiores beatae molestias ducimus nemo quidem, repudiandae quibusdam dignissimos unde sunt, impedit aperiam, eos quia et? Similique, praesentium! Similique quia impedit laborum ex! Eius explicabo officia earum voluptates. Dolores voluptatibus nisi incidunt iste? Ab molestiae cupiditate numquam. Ut?</p>
                    </div>

                    <div className='bg-fborder absolute bottom-0 pt-4 pb-6 px-3 z-10 gap-2 flex items-center w-screen justify-between'>
                        <div className='flex justify-between bg-secondary p-1 rounded-full w-full'>
                            <div className='flex gap-2'>
                                <button className='bg-fborder rounded-full p-2' onClick={() => setToggle2(true)}><Image src={c.add_doc} alt='...' width={15} height={15} /></button>
                                <input type="text" placeholder='Type message here' className='outline-none w-full ' />
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
    <More isVisible = {toggle1} onClose = {() => setToggle1(false)} />
    <Options isVisible = {toggle2} onClose = {() => setToggle2(false)} />
    </Fragment>
  )
}

export default Page
