// component shared across all pages/wrap all pages
//import React from "react"; no need to inport in latest version of react
//this function is exported to layout.js componet
import Link from "next/link";
//import Head from "next/head";
// import styles from "./navbar.module.css"
export default function Nav() {
  return (
    <div className={styles.links}>
      <Link href="/">Home</Link>
      <Link href="/plants">Plants and Fruits Data</Link>
      <Link href="/multipleentry">Advanced Search</Link>
      <Link href="/insects">Insects reared from fruits</Link>
      <Link href="/glossary">Glossary</Link>
      {/* < Link href="/add">Add</Link> */}
    </div>
  );
}
