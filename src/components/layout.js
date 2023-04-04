// component shared across all pages/wrap all pages
import React from "react";
import Navbar from "../components/navbar/navbar";
//import Head from "next/head";
import NavbarMUI from "./navbarMUI";
import Footer from 'components/footer/footer'
import Header from 'components/header/header'
export default function layout({ children }){
    return(
            <>
            <Header/>
            <NavbarMUI/>
            <main>{children}</main>
            <Footer/>      
            </>

    )
}