import React from 'react'
import Image from 'next/image'
import share from '@/public/homepage-img/share2.svg'
import profile from '@/public/homepage-img/img-placeholder.svg'
import block from '@/public/homepage-img/block.svg'
import del from '@/public/homepage-img/delete.svg'

const More = ({isVisible, onClose}) => {
    if(!isVisible) return null;

    const handleClose = (event) => {
        if(event.target.id === "wrapper") onClose();
    }

    return (
        <div className='fixed shadow-2xl inset-0 flex text-xs text-colort justify-end items-start z-20' id="wrapper" onClick={handleClose}>
            <section className='w-[50%] h-[35%] py-2 px-5 bg-white grid rounded-2xl mt-7 mr-2'>
                <div className='flex gap-2 items-center py-1 border-b'>
                    <Image src={share} alt='...' width={15} height={15} />
                    <p>Share</p>
                </div>
                <div className='flex gap-2 items-center py-1 border-b'>
                    <Image src={profile} alt='...' width={15} height={15} />
                    <p>Vendor Profile</p>
                </div>
                <div className='flex gap-2 items-center py-1 border-b'>
                    <Image src={block} alt='...' width={15} height={15} />
                    <p>Block Vendor</p>
                </div>
                <div className='flex gap-2 items-center py-1'>
                    <Image src={del} alt='...' width={15} height={15} />
                    <p>Delete Chat</p>
                </div>
            </section>
        </div>
    )
}

export default More
