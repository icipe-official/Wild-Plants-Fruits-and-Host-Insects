import { useState, useEffect } from "react";
import Head from "next/head";
import { Box, Container } from "@mui/material";

export default function HomePage() {
  const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";
  const [imageLoaded, setImageLoaded] = useState(false);

  useEffect(() => {
    const img = new Image();
    img.src = `${base_path}/newest_home.png`;
    img.onload = () => {
      setImageLoaded(true);
    };
  }, []);

  return (
    <Box>
      <Head>
        <title>Wild Fruits and Host Insects of Kenya</title>
        <meta name="description" content="home page" />
      </Head>
      <Box
        sx={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          height: "100%",
          // marginTop: 9,
        }}
      >
        <img
          src={`${base_path}/newest_home.png`}
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
    </Box>
  );
}
