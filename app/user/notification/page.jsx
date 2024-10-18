"use client"
import React from 'react'
import Image from 'next/image'
import { notifications } from '../data'
import Header from '../components/Header'

const page = () => {
  return (
    <main className='min-h-screen bg-secondary text-colort'> 
      {/* Recent Notification */}
      <div className='px-3 pt-16 md:pt-28'>
        <h1 className='flex items-center text-sm font-bold my-2'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Recent Notifications</h1>
        <div>
          {
            notifications.map((notify, index) => {
              return(
                <div className='bg-fborder rounded-lg flex justify-between items-center p-3 my-1' key={index}>
                  <div className='flex'>
                  <p className='p-2 border bg-primary rounded-full flex justify-center items-center h-10 w-10 mr-2'><Image src={notify.icon} alt='...' width={20} height={20} className='h-5 w-5' /></p> 
                  <div>
                    <h1 className='text-sm font-semibold'>{notify.title}</h1>
                    <p className='text-xs'>{notify.message}</p>
                  </div>
                  </div>
                  <div className='text-xs grid place-items-end'><p>{notify.time}</p><p className='h-2 w-2 bg-tertiary rounded-full ml-1'></p></div>
               </div>
              )
            })
          }
        </div>
      </div>

      {/* Previous Notifications */}
      <div className='px-3 py-4'>
        <h1 className='flex items-center text-sm font-bold my-2'><div className='h-2 w-2 bg-yellow rounded-full mr-1'></div> Previous Notifications</h1>
        <div>
          {
            notifications.map((notify, index) => {
              return(
                <div className='flex justify-between items-center p-3 my-1' key={index}>
                  <div className='flex'>
                  <p className='p-2 border bg-primary rounded-full flex justify-center items-center h-10 w-10 mr-2'><Image src={notify.icon} alt='...' width={20} height={20} className='h-5 w-5' /></p> 
                  <div>
                    <h1 className='text-sm font-semibold'>{notify.title}</h1>
                    <p className='text-xs'>{notify.message}</p>
                  </div>
                  </div>
                  <div className='text-xs grid place-items-end'><p>{notify.time}</p><p className='h-2 w-2 bg-tertiary rounded-full ml-1'></p></div>
               </div>
              )
            })
          }

          
        </div>
      </div>
    </main>
  )
}

export default page
