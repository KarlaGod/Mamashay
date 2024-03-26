import React from 'react'
import Image from 'next/image'
import attach from '../../public/homepage-img/add.svg'

const Options = ({isVisible, onClose}) => {
    if(!isVisible) return null;

    const handleClose = (event) => {
        if(event.target.id === "wrapper") onClose();
    }

    return (
        <div className='fixed inset-0 shadow-2xl flex text-xs text-colort justify-start items-end z-20' id="wrapper" onClick={handleClose}>
            <section className='w-[70%] h-[15%] py-2 px-5 bg-fborder flex items-center justify-center gap-5 rounded-2xl mb-20 ml-4'>
                <div className='grid place-items-center'>
                    <div className='mb-2 bg-colort rounded-full p-2'>
                        <Image src={attach} alt='...' width={25} height={25} />
                    </div>
                    <p>Attachment</p>
                </div>
                <div className='grid place-items-center'>
                    <div className='mb-2 bg-colort rounded-full p-2'>
                        <Image src={attach} alt='...' width={25} height={25} />
                    </div>
                    <p>Feedback</p>
                </div>
                <div className='grid place-items-center'>
                    <div className='mb-2 bg-colort rounded-full p-2'>
                        <Image src={attach} alt='...' width={25} height={25} />
                    </div>
                    <p>Invoice</p>
                </div>
            </section>
        </div>
    )
}

export default Options
