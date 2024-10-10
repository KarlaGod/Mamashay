"use client";
import React from "react";
import Link from "next/link";
import Image from "next/image";
import { navLinks } from "../data";
import back from "@/public/homepage-img/back.svg";
import plus from "@/public/homepage-img/addw.svg";
import { orders } from "../data";
import Header from "../components/Header";

const page = () => {
  return (
    <main className="min-h-screen bg2 text-colort bg-primary">
      <Header />

      <div className={`flex p-3 pt-32 gap-3`}>
        <button className="p-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
          Regulars
        </button>
        <button className="p-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
          Event Packages
        </button>
        <button className="p-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
          Special Packages
        </button>
      </div>

      <div className="overflow-y-scroll">
        <div className="px-3">
          <div className="w-full h-36 border bg-secondary grid place-items-center items-center justify-center rounded-lg">
            <div className="bg-tertiary w-fit h-fit grid items-end justify-center rounded-full p-1">
              <div className="bg-primary grid justify-center w-fit rounded-full p-1">
                <Image src={plus} alt="..." width={25} height={25} />
              </div>
            </div>
            <p className="grid items-start">Add Product</p>
          </div>
        </div>

        <div className="px-3 pt-3 pb-4">
          {orders.map((order, index) => {
            return (
              <div key={index} className="flex bg-fborder p-3 mb-2 rounded-lg">
                <Image src={order.img} alt="..." width={100} height={100} />
                <div className="ml-2">
                  <div className="flex items-center">
                    <Image
                      src={order.profile}
                      alt="..."
                      width={20}
                      height={20}
                      className="rounded-full"
                    />
                    <p className="border-x text-[8px] font-semibold mx-2 px-2">
                      {order.user}s Kitchen
                    </p>
                    <p className="flex items-center text-[10px]">
                      <Image
                        src={order.star}
                        alt="..."
                        width={13}
                        height={13}
                        className="pr-1"
                      />{" "}
                      {order.rating}
                    </p>
                  </div>
                  <p className="text-[10px] font-bold mt-2">{order.food}</p>
                  <div className="flex items-center">
                    <div className="px-1 mr-2 text-[8px] my-2 font-semibol text-secondary bg-tertiary rounded-sm">
                      BONUS
                    </div>
                    <p className="text-[8px]">{order.bonus}</p>
                  </div>
                  <p className="text-[10px] font-semibold text-tertiary">
                    N{order.price}.00
                  </p>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </main>
  );
};

export default page;
