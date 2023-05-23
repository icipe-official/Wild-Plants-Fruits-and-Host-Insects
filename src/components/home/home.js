import Image from "next/image";
import Head from "next/head";
// import styles from './home.module.css'
import { Box, Container } from "@mui/material";

export default function HomePage() {
  const base_path = process.env.NEXT_BASE_PATH
  return (
    // ntitle of the loaded file to show on nav ar
    <Container style={{ marginTop: 60 }}>
      <Head>
        <title>
          Natural History Collection of Wild plants, fruits and insects
        </title>
        <meta name="description" content="home page" />
      </Head>
      <Box sx={{ marginTop: 5 }}>
        <Image
          //loader={myLoader}
<<<<<<< HEAD
          src={`${base_path}/home.jpg`}
=======
          src="/home.jpg"
>>>>>>> f9e842dc172b57df827eac0fe358d977e42d439c
          alt="Picture of the plant"
          height={400}
          width={500}
          layout="responsive"
          // objectFit="cover"
          objectPosition="center"
          // priority={true}
        />
      </Box>
    </Container>
  );
}
