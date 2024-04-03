"use client"
import React from "react"
import Link from "next/link"
import Image from "next/image"
import { chat, navLinks } from "../data"
import back from "@/public/homepage-img/back.svg"
import profile from "@/public/homepage-img/profile.png"
import food from "@/public/homepage-img/goatmeatsoup.png"
import arrow from "@/public/homepage-img/arrow.svg"
import join from "@/public/homepage-img/join.svg"
import bell from "@/public/homepage-img/bell.svg"
import scan from "@/public/homepage-img/scan.svg"
import shop from "@/public/homepage-img/store.svg"
import profile2 from "@/public/homepage-img/profilew.svg"
import heart from "@/public/homepage-img/heart.svg"
import notify from "@/public/homepage-img/notify.svg"
import setting from "@/public/homepage-img/settingw.svg"
import cart from "@/public/homepage-img/cartw.svg"
import location from "@/public/homepage-img/locationw.svg"
import reviews from "@/public/homepage-img/reviews.svg"
import order_man from "@/public/homepage-img/order.svg"
import help from "@/public/homepage-img/help.svg"
import faq from "@/public/homepage-img/faq.svg"
import suggest from "@/public/homepage-img/suggest.svg"
import contact from "@/public/homepage-img/contacts.svg"

const page = () => {
  return (
    <main className="min-h-screen pb-1 bg2 bg-secondary text-colort">
      <div className="pb-5 bg-primary h-32 grid items-center fixed">
        <div className="flex justify-between items-center pt-5 pb-3 h-[12%] w-screen">
          <div
            onClick={() => window.history.back()}
            className="flex w-8 h-8 p-1 place-items-center bg-fborder rounded-full ml-3"
          >
            <Image
              src={back}
              alt="..."
              width={25}
              height={25}
              className="h-7 w-7 p-1"
            />
          </div>
          <div className="flex gap-2 p-3">
            {navLinks.map((link, index) => {
              return (
                <div className="flex" key={index}>
                  <Link
                    href={link.link}
                    className="p-2 bg-fborder rounded-full flex justify-center h-7 w-7"
                  >
                    <Image src={link.icon} alt="..." width={13} height={13} />
                  </Link>
                  <div className="h-2 w-2 -ml-2 bg-yellow rounded-full"></div>
                </div>
              );
            })}
          </div>
        </div>

        <div className="flex px-3 justify-between">
          <div className="grid items-center w-full">
            <div className="flex justify-between w-full items-baseline h-fit -mt-2 z-10">
              <div className="rounded-full bg-secondary p-1">
                <Image
                  src={profile}
                  alt="..."
                  width={40}
                  height={40}
                  className="rounded-full h-24 w-24"
                />
              </div>
              <button className="py-2 px-5 bg-tertiary h-10 rounded-full text-secondary w-fit">Edit Profile</button>
            </div>
            <div className="grid">
              <h1 className="text-lg font-semibold">Blac Kitchen</h1>
              <p className="text-sm text-tertiary">Online</p>
            </div>
            <div className="hidden">
              <h1 className="text-lg font-semibold">Emeka Jordan</h1>
              <p className="text-sm text-tertiary">User</p>
            </div>
          </div>
          
        </div>
      </div>

      <div className={`px-3 pt-64 pb-4`}>
        <div>
          {chat.map((c, index) => {
            return (
              <div key={index}>
                <div className="text-xs flex justify-between items-center pb-3 gap-3">
                  <p className="text-xs w-full">
                    <span className="font-bold">Desciption: </span>
                    {c.description}
                  </p>
                </div>

                <div className="grid gap-2 text-xs">
                  <Link
                    href="tel:+2348077116265"
                    className="flex rounded-ful gap-2"
                  >
                    <Image src={c.tel} alt="..." width={10} height={10} />
                    <p className="border-l pl-2">{c.teln}</p>
                  </Link>
                  <Link
                    href="#"
                    className="flex rounded-ful gap-2"
                  >
                    <Image src={c.location} alt="..." width={10} height={10} />
                    <p className="border-l pl-2">{c.address}</p>
                  </Link>
                  <Link
                    href="#"
                    className="flex rounded-ful gap-2"
                  >
                    <Image src={c.calender} alt="..." width={10} height={10} />
                    <p className="border-l pl-2">Available: {c.address}</p>
                  </Link>
                </div>
              </div>
            );
          })}
        </div>

        <div className="w-full flex gap-2 mt-3 h-36 border bg-fborder place-items-center items-center justify-center rounded-lg">
          <Image src={scan} alt="..." width={25} height={25} />
          <p className="grid items-start text-secondary text-xs">Upload business banner here</p>
        </div>

        <div className="hidden gap-2 w-full">
          <Link href="#" className="bg-fborder p-2 w-full rounded-lg">
            <p className="text-xs font-semibold text-primary mb-2 w-4/5">
              Check Our What is Going On In Our Community
            </p>
            <div className="flex justify-between -mt-10">
              <Image
                src={join}
                alt="..."
                width={50}
                height={50}
                className="h-10 w-10 mt-8"
              />
              <Image
                src={bell}
                alt="..."
                width={50}
                height={50}
                className="h-24 w-24 -mt-2"
              />
            </div>
          </Link>

          <div className="w-full bg-primary rounded-lg overflow-hidden">
            <Image
              src={food}
              alt="..."
              width={140}
              height={100}
              className="w-full h-20"
            />
            <div className="px-2">
              <div className="flex justify-between my-2">
                <h1 className="text-tertiary text-xs font-bold">Explore</h1>
                <p className="bg-secondary p-1 flex justify-center items-center -mt-6 h-8 w-8 rounded-full">
                  <Image src={arrow} alt="..." width={15} height={5} />
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="px-3">
        <button className="w-full hidden rounded-lg p-2 text-primary font-bold bg-fborder">
          Become A Vendor
        </button>
        <button className="w-full flex justify-center items-center gap-2 rounded-lg p-2 bg-fborder">
          <Image
            src={shop}
            alt="..."
            height={10}
            width={10}
            className="h-4 w-4"
          />
          <p className="text-primary text-center font-bold">Shop</p>
        </button>
      </div>

      {/* My Account */}
      <div className="p-3 m-3 rounded-lg bg-fborder">
        <h1 className="text-sm font-bold">My Account</h1>
        <div className="grid grid-cols-4 justify-between pt-5">
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={profile2}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Personnal Data</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={heart}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Favourite</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={notify}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Notification Settings</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={setting}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>App Settings</p>
          </div>
        </div>
      </div>

      {/* Orders */}
      <div className="p-3 mx-3 rounded-lg bg-fborder">
        <h1 className="text-sm font-bold">Orders</h1>
        <div className="grid grid-cols-4 justify-between pt-5">
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={cart}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>My Orders</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={location}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Delivery Address</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={reviews}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>My Reveiws</p>
          </div>
          <div className="hidden place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={order_man}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Order Manager</p>
          </div>
        </div>
      </div>

      {/* Service */}
      <div className="p-3 m-3 mb-8 rounded-lg bg-fborder">
        <h1 className="text-sm font-bold">Services</h1>
        <div className="grid grid-cols-4 justify-between pt-5">
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={help}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Help Center</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={faq}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>FAQ</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={suggest}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Suggestions</p>
          </div>
          <div className="grid place-items-center text-center text-xs w-20 items-baseline">
            <p>
              <Image
                src={contact}
                alt="..."
                width={10}
                height={10}
                className="mb-2 h-12 w-12 bg-primary p-3 rounded-full"
              />
            </p>
            <p>Contacts</p>
          </div>
        </div>
      </div>
    </main>
  );
};

export default page;
