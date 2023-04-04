import { Box } from "@mui/material";
import { useState } from "react";
import Image from "next/legacy/image";
import styles from './photos.module.css'

//This component will be receiving data from getstaticprops
export default function Photos({photo_data}) {
  const photos = photo_data.map((plant) => plant.plant_photos.map((y) => y.photo_name))[0]; // [0] extract photonames from [[]] object

  const [showImage, setShowImage] = useState({
    showImageNow: true,
    showImageId: null,
  });
  const [open, setOpen] = useState(0);

  //check if length of photos is more than one
  if (photos.length === 1) {
    return (
      <Box sx={{ marginTop: "1rem" ,marginLeft:2}}>
        {photo_data.map((specie) => (
          <Box key={specie.id}>
            {specie.plant_photos.map((photo) => (
              <Box key={photo.id}>
                <Image 
                  src={`/plants/${photo.photo_name}`}
                  alt="Picture of the plant"
                  width={500}
                  height={400}
                  layout="responsive"
                />
              </Box>
            ))}
          </Box>
        ))}
      </Box>
    );
  } else if (photos.length === 0) {
    return (
      <Box sx={{ marginTop: "1rem",marginLeft:2, paddingBottom:2}}>
        <Image 
          src="/plants/noImage.jpg"
          alt="No Image"
          width={500}
          height={400}
          layout="responsive"
        /> 
      </Box>
    );
  } else {
    const OpenImage = (open) => {
      if (open === photos.length - 1) {
        setOpen(0)
      } else {
        setOpen(open + 1)
      }
    };
    return (
      <Box sx={{ marginTop: "1rem" ,marginLeft:2,paddingBottom:2}}>
        <Image 
          src={`/plants/${photos[open]}`}
          alt="No Image"
          width={500}
          height={400}
          layout="responsive"
        />
        <span>{open + 1}/{photos.length}</span>
        <Box>
          <button 
            onClick={() => OpenImage(open)}
            className="ground" 
          >
            Next Image
          </button>
        </Box>
      </Box>
    );
  }
}
