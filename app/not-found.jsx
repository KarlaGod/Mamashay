import Link from 'next/link'
import React from 'react'

const NotFound = () => {
  return (
    <div className='h-screen w-screen bg-secondary text-primary flex gap-3 flex-col justify-center items-center'>
      <p className='text-4xl font-bold'>404</p>
      <p className='text-2xl'>Page Not Found</p>
      <Link href="/" className='text-blue-900'>click here to go to start</Link>
    </div>
  )
}

export default NotFound
