"use client";
import React, { useEffect } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import profile from "@/public/homepage-img/profile.png";
import message from "@/public/homepage-img/message.svg";
import bell from "@/public/homepage-img/notification.svg";
import setting from "@/public/homepage-img/settings.svg";
import more from "@/public/homepage-img/more.svg";
import back from '@/public/homepage-img/back.svg'
import { ConnectButton } from '@rainbow-me/rainbowkit'
import { useAccount } from 'wagmi';
import { useRouter } from 'next/navigation';
import { usePathname } from 'next/navigation';

const Header = ({ visible }) => {
    const router = useRouter()
    // const { isConnected } = useAccount();
    const pathname = usePathname()
    const user = pathname === '/user'
    const chats = pathname === '/user/chats'
    const notification = pathname === '/user/notification'
    const settings = pathname === '/user/settings'
    const shop = pathname === '/user/shop'

    // useEffect(() => {
    //     if(!isConnected) {
    //         router.push('/signin');
    //     }
    // }, [isConnected, router]);

  return (
    <header className={`${visible ? "hidden" : "grid"} w-screen fixed top-0`}>
          <section
            className={`${user ? '' : 'py-1'} flex justify-between bg-fborder w-screen px-3`}
          >
            <div>
              <div className={`${user ? 'flex' : 'hidden'} items-center`} onClick={() => router.push("../user/profile")}>
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

              <h1 className={`${notification | settings | chats | shop ? 'flex' : 'hidden'} items-center text-primary text-xl font-semibold pt-5 pl-2`}>
                <div onClick={() => window.history.back()}>
                  <Image src={back} alt='...' width={25} height={25} className='pr-3' />
                </div>
                {notification ? 'Notifications' : chats ? 'Chats' : settings ? 'Settings' : shop ? 'Shop' : 'Nothing'}
              </h1>
            </div>

            <div className="flex gap-2 p-2 items-center mt-2">
              <Link
                href="../user/chats"
                className={`p-2 bg-sign rounded-full flex justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full`}
              >
                <Image src={message} alt="..." width={13} height={13} className="h-5 w-5" />
              </Link>
              
              <Link
                href="../user/notification"
                className={`p-2 bg-sign rounded-full flex justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full`}
              >
                <Image src={bell} alt="..." width={10} height={10} className="h-5 w-5" />
              </Link>
              
              <Link
                href="../user/settings"
                className={`${chats ? 'hidden' : 'flex'} p-2 bg-sign rounded-full justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full`}
              >
                <Image src={setting} alt="..." width={13} height={13} className="h-5 w-5" />
              </Link>

              <Link
                href="../user/chats"
                className={`${chats ? 'flex' : 'hidden'} p-2 bg-sign rounded-full justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full`}
              >
                <Image src={more} alt="..." width={13} height={13} className="h-5 w-5" />
              </Link>
            </div>
          </section>
          <div className={`${user ? 'flex' : 'hidden'} justify-end pe-5 py-5 text-secondary`}>
            {/* <div className={``}> */}
              <ConnectButton />
            {/* </div> */}
          </div>
        </header>
  )
}

export default Header
