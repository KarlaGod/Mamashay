"use client"
import React, { useState, useEffect } from 'react';

const ScreenSize = ({ children }) => {
    const [isMobile, setIsMobile] = useState(true);

    useEffect(() => {
        const handleResize = () => {
            setIsMobile(window.innerWidth <= 425);
        };
        
        handleResize(); // Check screen size initially
        window.addEventListener('resize', handleResize);

        return () => window.removeEventListener('resize', handleResize);
    }, []);

    if (!isMobile) {
        return (
            <main className='flex bg-primary min-h-screen w-screen justify-center items-center'>
                <p className='text-2xl text-center w-4/5'>We&apos;re Sorry, This page is not available to large screens, Please try using a mobile phone, or smaller screen</p>
            </main>
        );
    }

    return (
        <>
            {children}
        </>
    );
};

export default ScreenSize;
