import { Box, Button } from "@mui/material";
import { useState } from "react";
import Image from "next/legacy/image";
import Router from "next/router";

//This component will be receiving data from getstaticprops
export default function InsectPhotos({ photos_data }) {
  const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";
  const photos = photos_data.map((insect) =>
    insect.insect_photos.map((y) => y.photo_id)
  )[0]; // [0] extract photonames from [[]] object
  const [showImage, setShowImage] = useState({
    showImageNow: true,
    showImageId: null,
  });
  const [open, setOpen] = useState(0);
  console.log("photos");

  console.log(photos);
  // console.log(photo_id.map())
  //check if length of photos is more than one
  if (photos.length === 1) {
    return (
      <Box sx={{ marginTop: 8, marginLeft: 2 }}>
        {photos_data.map((specie) => (
          <Box key={specie.id}>
            <Box key={specie.id}>
              <Image
                src={`${base_path}/insects/${photos[0]}.jpg`}
                alt="Picture of the insect"
                width={500}
                height={400}
                //   layout="responsive"
              />
            </Box>
          </Box>
        ))}
      </Box>
    );
  } else if (photos.length === 0) {
    return (
      <Box sx={{ marginTop: 8, marginLeft: 2, paddingBottom: 2 }}>
        <Image
          src={`${base_path}/noImage.jpg`}
          alt="No Image"
          width={500}
          height={400}
          //   layout="responsive"
        />
      </Box>
    );
  } else {
    const OpenImage = (open) => {
      if (open === photos.length - 1) {
        setOpen(0);
      } else {
        setOpen(open + 1);
      }
    };
    return (
      <Box sx={{ marginTop: 8, marginLeft: 2, paddingBottom: 2 }}>
        <Image
          src={`${base_path}/insects/${photos[open]}.jpg`}
          alt="No Image"
          width={500}
          height={400}
          //   layout="responsive"
        />
        <span>
          {open + 1}/{photos.length}
        </span>
        <Box>
          <button onClick={() => OpenImage(open)} className="ground">
            Next Image
          </button>
        </Box>
    
      </Box>
    );
  }
}
