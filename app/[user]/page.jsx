"use client";
import React, { Fragment, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import profile from "@/public/homepage-img/profile.png";
import message from "@/public/homepage-img/message.svg";
import notification from "@/public/homepage-img/notification.svg";
import setting from "@/public/homepage-img/settings.svg";
import name from "@/public/sign-up-img/greyname.svg";
import filter from "@/public/homepage-img/filter.svg";
import searc from "@/public/homepage-img/search.svg";
import cart from "@/public/homepage-img/Cart.svg";
import food from "@/public/homepage-img/goatmeatsoup.png";
import arrow from "@/public/homepage-img/arrow.svg";
import join from "@/public/homepage-img/join.svg";
import { products, vendors } from "./data";
import Showcase from "../modals/Showcase";
import { useRouter } from "next/navigation";

const Page = () => {
  const [showModal, setShowModal] = useState(false);
  const [visible, setVisible] = useState(false);
  const [search, setSearch] = useState("");
  const [searchResult, setSearchResult] = useState(products);

  const router = useRouter();

  return (
    <Fragment>
      <main className="min-h-screen bg-secondary text-colort">
        {/* Header of the Page */}
        <header
          className={`${
            visible ? "hidden" : "flex"
          } justify-between bg-fborder h-[12%] w-screen px-3 pt-1 items-end fixed`}
        >
          <div
            className="flex items-center"
            onClick={() => router.push("../user/profile")}
          >
            <div className="p-3">
              <Image
                src={profile}
                alt="..."
                width={40}
                height={40}
                className="rounded-full h-14 w-14"
              />
            </div>
            <div className="after:content-[''] after:w-[.1rem] after:h-6 after:bg-colort after:absolute after:-mt-8 after:-ms-3 h-fit p-2">
              <h1 className="text-sm font-semibold">Emeka Jordan</h1>
              <p className="text-xs">User</p>
            </div>
          </div>
          <div className="flex gap-2 p-3">
            <Link
              href="../user/chats"
              className="p-2 bg-sign rounded-full flex justify-center items-center h-10 w-10 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-8 after:ml-6 after:rounded-full"
            >
              <Image src={message} alt="..." width={13} height={13} className="h-5 w-5" />
            </Link>
            
            <Link
              href="../user/notification"
              className="p-2 bg-sign rounded-full flex justify-center items-center h-10 w-10 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-8 after:ml-6 after:rounded-full"
            >
              <Image src={notification} alt="..." width={10} height={10} className="h-5 w-5" />
            </Link>
            
            <Link
              href="../user/settings"
              className="p-2 bg-sign rounded-full flex justify-center items-center h-10 w-10 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-8 after:ml-6 after:rounded-full"
            >
              <Image src={setting} alt="..." width={13} height={13} className="h-5 w-5" />
            </Link>
          </div>
        </header>

        {/* Logo Container */}
        <div
          className={`${
            visible ? "hidden" : "flex"
          } justify-center items-center pt-24 min-h-80`}
        >
          <Image
            src={name}
            alt="..."
            width={200}
            height={200}
            className="h-20 w-44 p-2"
          />
        </div>

        {/* Filter and Search */}
        <div
          className={`${visible ? "pt-10 bg-fborder" : ""}`}
          onClick={() => setVisible(true)}
        >
          <div className="flex p-3 gap-2">
            <div className="p-2 bg-primary rounded-full flex justify-center items-center w-14 h-11">
              <Image src={filter} alt="..." width={15} height={15} />
            </div>
            <input
              type="search"
              placeholder="Search for food or any organic product..."
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setSearchResult(
                  products.filter((product) =>
                    product.food
                      .toLowerCase()
                      .includes(search.toLowerCase().trim())
                  )
                );
              }}
              className={`p-2 w-full rounded-full outline-none ${
                visible ? "bg-secondary" : "bg-fborder"
              } text-colort text-xs`}
            />
            <div
              onClick={() => {
                setSearchResult(
                  products.filter((product) =>
                    product.food
                      .toLowerCase()
                      .includes(search.toLowerCase().trim())
                  )
                );
              }}
              className="p-2 bg-primary rounded-full flex justify-center items-center w-14 h-11"
            >
              <Image src={searc} alt="..." width={15} height={15} />
            </div>
          </div>
          <div className={`flex p-3 ${!visible ? "hidden" : ""} gap-3`}>
            <button className="h-12 px-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
              Regulars
            </button>
            <button className="h-12 px-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
              Event
            </button>
            <button onClick={() => setVisible(!visible)} className="h-12 px-2 border-2 border-tertiary outline-tertiary bg-secondary w-fit text-xs rounded-full">
              Special
            </button>
            <div onClick={()=> setVisible(false)} className="h-12 w-full text-xs flex items-center">
              <p className="w-full flex justify-end">k</p>
            </div>
          </div>
        </div>

        {/* Favourite Vendors */}
        <div
          className={`${!visible ? "p-3" : "hidden"}`}
          onClick={() => setVisible(false)}
        >
          <h1 className="flex items-center text-sm font-bold">
            <div className="h-2 w-2 bg-yellow rounded-full mr-1"></div>{" "}
            Favourite Vendors
          </h1>
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

          {/* Buttons for message and orders */}
          <div
            className={`${!visible ? "flex gap-3 pt-8" : "hidden"}`}
            onClick={() => setVisible(false)}
          >
            <Link
              href="../user/chats"
              className="flex px-5 py-2 justify-center items-center bg-fborder h-14 w-1/2 rounded-lg"
            >
              <Image src={message} alt="..." width={13} height={13} className="h-6 w-6" />
              <p className="border-l border-colort text-md text-primary ml-2 pl-2">
                Messages
              </p>
            </Link>
            <Link
              href="../user/orders"
              className="flex px-5 py-2 justify-center items-center bg-fborder h-14 w-1/2 rounded-lg"
            >
              <Image src={cart} alt="..." width={13} height={13} className="h-6 w-6" />
              <p className="border-l border-colort text-md text-primary ml-2 pl-2">
                Orders
              </p>
            </Link>
          </div>
        </div>

        {/* Favourite Products */}
        <div
          className={`${!visible ? "px-3 pt-4" : "hidden"}`}
          onClick={() => setVisible(false)}
        >
          <h1 className="flex items-center text-sm font-bold">
            <div className="h-2 w-2 bg-yellow rounded-full mr-1"></div>{" "}
            Favourite Products
          </h1>
          <div className="flex py-2 overflow-x-scroll .no-scrollbar">
            {products.map((product, index) => {
              return (
                <div
                  key={index}
                  className="flex-none bg-fborder p-2 mx-1 rounded-lg w-1/2 h-1/2"
                >
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
                      <p className="text-xs font-bol pr-1 border-r mr-1 overflow-hidden">
                        {product.ingredients}
                      </p>
                      <p className="flex items-center text-xs">
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
                      onClick={() => setShowModal(true)}
                    >
                      Buy
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* For You */}
        <div
          className={`${!visible ? "px-3 pt-8 pb-4" : "hidden"}`}
          onClick={() => setVisible(false)}
        >
          <h1 className="flex items-center text-sm font-bold">
            <div className="h-2 w-2 bg-yellow rounded-full mr-1"></div> For You
          </h1>
          <div className="grid grid-cols-2 mt-2 gap-2">
            <div className="grid gap-2 w-full">
              <div className="w-full bg-primary rounded-lg overflow-hidden">
                <Image
                  src={food}
                  alt="..."
                  width={140}
                  height={100}
                  className="w-full h-32"
                />
                <div className="px-2">
                  <div className="flex justify-between">
                    <h1 className="text-tertiary text-xs font-bold mt-4">
                      Explore
                    </h1>
                    <p className="bg-secondary p-1 flex justify-center items-center -mt-4 h-8 w-8 rounded-full">
                      <Image src={arrow} alt="..." width={15} height={5} />
                    </p>
                  </div>
                  <p className="text-secondary text-xs py-2">
                    View The Top Selling Products Now!
                  </p>
                </div>
              </div>

              <Link href="#" className="bg-fborder p-2 w-full rounded-lg">
                <p className="text-xs font-semibold text-primary mb-2">
                  Join Our Community
                </p>
                <Image src={join} alt="..." width={50} height={50} />
              </Link>
            </div>

            <div className="grid gap-y-2">
              <div className="h-full w-full bg-fborder rounded-lg overflow-hidden"></div>

              <div className="h-full w-full bg-primary rounded-lg"></div>
            </div>
          </div>
        </div>

        <div className={`${visible ? "" : "hidden"}`}>
          <div
            className={`${visible ? "px-3 py-4" : "hidden"}`}
            onClick={() => setVisible()}
          >
            {searchResult.map((order, index) => {
              return (
                <div
                  onClick={() => setShowModal(true)}
                  key={index}
                  className="flex bg-fborder p-3 mb-2 rounded-lg"
                >
                  <Image
                    src={order.img}
                    alt="..."
                    width={100}
                    height={100}
                    className="h-24 w-24"
                  />
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
      <Showcase isVisible={showModal} onClose={() => setShowModal(false)} />
    </Fragment>
  );
};

export default Page;
