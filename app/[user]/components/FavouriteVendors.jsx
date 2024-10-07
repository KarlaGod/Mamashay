import React from 'react'
import Image from "next/image"
import { vendors } from "../data"

const FavouriteVendors = () => {
  return (
    <div>
      <div className="flex py-2 overflow-x-scroll .no-scrollbar">
        {vendors.map((vendor, index) => {
            return (
            <div
                className="flex-none bg-fborder place-items-center mx-1 px-2 py-3 h-32 w-24 grid rounded-lg"
                key={index}
            >
                <Image
                src={vendor.profile}
                alt="..."
                width={40}
                height={40}
                className="rounded-full flex justify-center w-16 h-16"
                />
                <p className="text-xs mt-2">{vendor.name}</p>
            </div>
            );
        })}
        </div>
    </div>
  )
}

export default FavouriteVendors
