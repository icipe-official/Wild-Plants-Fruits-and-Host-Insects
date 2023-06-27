// component shared across all pages/wrap all pages
import React from 'react';
// import Head from "next/head";
import Footer from 'components/footer/footer';
import Header from 'components/header/header';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import NavbarMUI from './navbarMUI';
import Navbar from './navbar/navbar';

const queryClient = new QueryClient();

export default function layout({ children }) {
  return (
    <>
      {/* <QueryClientProvider client={queryClient}> */}
      {/* <Header /> */}
      <NavbarMUI />
      <main>{children}</main>
      <Footer />
      {/* </QueryClientProvider> */}
    </>
  );
}
