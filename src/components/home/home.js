import { useState, useEffect } from "react";
import Head from "next/head";
import { Box, Container } from "@mui/material";

export default function HomePage() {
  const [imageLoaded, setImageLoaded] = useState(false);

  useEffect(() => {
    const img = new Image();
    img.src = "/home.jpg";
    img.onload = () => {
      setImageLoaded(true);
    };
  }, []);

  return (
    <>
      <Head>
        <title>
          Natural History Collection of Wild plants, fruits and insects
        </title>
        <meta name="description" content="home page" />
      </Head>
      <Box
        sx={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          height: "100%",
          marginTop: 9,
        }}
      >
        <img
          src="/home.jpg"
          alt="Picture of the plant"
          style={{
            display: "block",
            width: "100%",
            height: "auto",
          }}
          onLoad={() => {
            setImageLoaded(true);
          }}
        />
        {imageLoaded && <Container>{/* Content of the homepage */}</Container>}
      </Box>
    </>
  );
}
