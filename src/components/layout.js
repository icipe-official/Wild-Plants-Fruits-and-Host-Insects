// component shared across all pages/wrap all pages
import React from "react";
import Navbar from "../components/navbar/navbar";
//import Head from "next/head";
import NavbarMUI from "./navbarMUI";
import Footer from "components/footer/footer";
import Header from "components/header/header";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";

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
