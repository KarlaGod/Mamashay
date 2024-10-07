import React from 'react'
import Image from 'next/image'
import { products } from '../data'
import Showcase from "../../modals/Showcase"

const FavouriteProducts = ({ modal, select, setSelect }) => {
    return (
        <div>
            <div className="flex py-2 overflow-x-scroll .no-scrollbar">
            {products.map((product, index) => {
              return (
                <div
                  key={index}
                  className="flex-none bg-fborder p-2 mx-1 rounded-lg w-1/2 h-1/2"
                >
                    {/* <Showcase showcase={products} /> */}
                  <div className="flex items-center mb-2">
                    <Image
                      src={product.profile}
                      alt="..."
                      width={15}
                      height={15}
                      className="rounded-full h-8 w-8"
                    />
                    <p className="text-sm font-semibold ml-2 text-primary">
                      {product.user}
                    </p>
                  </div>
                  <Image
                    src={product.img}
                    alt="..."
                    width={130}
                    height={130}
                    className="h-32 w-full"
                  />
                  <div>
                    <p className="text-xs font-bold mt-1 text-primary">
                      {product.food}
                    </p>
                    <div className="flex items-center mt-1">
                      <p className="text-[12px] pr-1 border-r mr-1 overflow-hidden">
                        {product.ingredients}
                      </p>
                      <p className="flex items-center text-[12px]">
                        <Image
                          src={product.star}
                          alt="..."
                          width={13}
                          height={13}
                          className="pr-1 h-4 w-4"
                        />{" "}
                        {product.rating}
                      </p>
                    </div>
                    <div className="flex items-center">
                      <div className="px-1 mr-2 text-[12px] my-2 font-semibol text-secondary bg-tertiary rounded-sm">
                        BONUS
                      </div>
                      <p className="text-[12px]">{product.bonus}</p>
                    </div>
                    <p className="text-sm font-semibold text-black">
                      N{product.price}.00
                    </p>
                    <button
                      className="text-center bg-tertiary w-full h-12 mt-2 text-secondary rounded-md"
                      onClick={() => {modal(true); setSelect(product)}}
                    >
                      Buy
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
    )
}

export default FavouriteProducts
