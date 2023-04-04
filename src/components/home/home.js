import Image from 'next/image'
import Head from 'next/head'
import styles from './home.module.css'
import { Box } from '@mui/material'

export default function HomePage(){
    return (
      // ntitle of the loaded file to show on nav ar
      <Box className={styles.title}>
      
        <Head>
          <title> Natural History Collection of Wild plants, fruits and insects</title>
        <meta name="description" content='Created by Bonface'/>
        </Head>
        <div className={styles.Img}>
        <Image 
        //loader={myLoader}
        src="/plants/0011.jpg"
        alt="Picture of the plant"
        width={500}
        height={400}
      />
      </div>
      </Box>
    )
  }
