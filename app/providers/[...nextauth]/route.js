import NextAuth from 'next-auth/next'
import GoogleProvider from "next-auth/providers/google"

// const handler = NextAuth({
//     providers: [
//         GoogleProvider({
//           clientId: process.env.NEXT_PUBLIC_OAUTH_CLIENT_ID,
//           clientSecret: process.env.NEXT_PUBLIC_OAUTH_CLIENT_SECRET,
//         }),
//       ],
// })

// export {
//     handler as GET,
//     handler as POST
// };

// pages/api/auth/[...nextauth].ts


export const authOptions = {
  providers: [
    GoogleProvider({
      clientId: process.env.NEXT_PUBLIC_OAUTH_CLIENT_ID,
      clientSecret: process.env.NEXT_PUBLIC_OAUTH_CLIENT_SECRET,
    }),
  ],
  // Add custom options as needed
  secret: process.env.NEXT_PUBLIC_NEXTAUTH_SECRET,
};

// export default NextAuth(authOptions);
