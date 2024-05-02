"use client"
import React, { useState } from 'react'

const Messages = () => {
    const [send, setSend] = useState([])
    const sent = message => {
        setSend([...send, { input: send }])
        
        console.log(send)
    }
  return (
    <div>
      <p className="w-full h-fit bg-slate-500 p-2 text-xs break-words text-wrap rounded-lg">
        befibvei
        </p>
        <p className="w-full h-fit mt-8 bg-slate-500 p-2 text-xs break-words text-wrap rounded-lg">
        {send.input}
      </p>
    </div>
  )
}

export default Messages
