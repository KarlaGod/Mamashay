"use client";
import React, { useEffect } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import profile from "@/public/homepage-img/profile.png";
import message from "@/public/homepage-img/message.svg";
import notification from "@/public/homepage-img/notification.svg";
import setting from "@/public/homepage-img/settings.svg";
import { ConnectButton } from '@rainbow-me/rainbowkit'
import { useAccount } from 'wagmi';
import { useRouter } from 'next/navigation';

const Header = ({ visible }) => {
    const router = useRouter()
    const { address, isConnected } = useAccount()

    useEffect(() => {
        if(!isConnected) {
            router.push('/signin');
        }
    }, [isConnected, router]);

  return (
    <header className={`${visible ? "hidden" : "grid"} h-[16%] w-screen fixed top-0`}>
          <section
            className={`flex justify-between bg-fborder w-screen px-3`}
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
            <div className="flex gap-2 p-2 items-center mt-2">
              <Link
                href="../user/chats"
                className="p-2 bg-sign rounded-full flex justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full"
              >
                <Image src={message} alt="..." width={13} height={13} className="h-5 w-5" />
              </Link>
              
              <Link
                href="../user/notification"
                className="p-2 bg-sign rounded-full flex justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full"
              >
                <Image src={notification} alt="..." width={10} height={10} className="h-5 w-5" />
              </Link>
              
              <Link
                href="../user/settings"
                className="p-2 bg-sign rounded-full flex justify-center items-center h-8 w-8 after:h-2 after:w-2 after:absolute after:bg-yellow after:-mt-5 after:ml-6 after:rounded-full"
              >
                <Image src={setting} alt="..." width={13} height={13} className="h-5 w-5" />
              </Link>
            </div>
          </section>
          <div className="flex justify-end pe-5 py-5 text-secondary">
            <ConnectButton />
          </div>
        </header>
  )
}

export default Header
