import { Box } from "@mui/material";
import { useState, useEffect } from "react";
// import Image from "next/legacy/image";
import Image from "next/image";

import styles from "./photos.module.css";
import { useRouter } from "next/router";
import useSWR from "swr";
//This component will be receiving data from getstaticprops
export default function PhotosComponent({ photos_data, selectedIndex }) {
  const [photoData, setphotoData] = useState([]);
  const [loaded, setLoaded] = useState(false);

  //control next and previous image
  const [currentImage, setCurrentImage] = useState(0);

  // const [error, setError] = useState(null);

  // console.log("photos");
  // console.log(photos);
  const [showImage, setShowImage] = useState({
    showImageNow: true,
    showImageId: null,
  });
  const [open, setOpen] = useState(0);

  //manfe view of image on exapnde state
  const [isExpanded, setIsExpanded] = useState(false);
  const toggleExpandImage = () => {
    setIsExpanded(!isExpanded);
  };
  console.log(" photo");
  console.log(photos_data);
  if (photos_data) {
    const photos = photos_data
      .map((plant) => plant.plants_photos)
      [selectedIndex].map((p) => p.photo_name);
    console.log(photos);
    //check if length of photos is more than one
    if (photos.length === 1) {
      return (
        <Box sx={{ marginTop: "1rem", marginLeft: 0 }}>
          {photos.map((specie) => (
            <Box key={specie.id}>
              <Image
                src={`/plants/${specie}`}
                alt="Picture of the plant"
                width={500}
                height={400}
                layout="responsive"
              />
            </Box>
          ))}
        </Box>
      );
    } else if (photos.length === 0) {
      return (
        <Box sx={{ marginTop: "1rem", paddingBottom: 2 }}>
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
      const previousImage = () => {
        setCurrentImage(
          currentImage === 0 ? photos.length - 1 : currentImage - 1
        );
      };

      const nextImage = () => {
        setCurrentImage(
          currentImage === photos.length - 1 ? 0 : currentImage + 1
        );
      };
      const OpenImage = (open) => {
        if (open === photos.length - 1) {
          setOpen(0);
        } else {
          setOpen(open + 1);
        }
      };
      return (
        <Box sx={{ marginTop: "1rem", paddingBottom: 2 }}>
          <Image
            src={`/plants/${photos[currentImage]}`}
            alt="No Image"
            width={500}
            height={400}
            layout="responsive"
          />
          <span>
            {currentImage + 1}/{photos.length}
          </span>
          <Box>
            <button onClick={previousImage} className="ground">
              &lt;
            </button>
            <button onClick={nextImage} className="ground">
              &gt;
            </button>
          </Box>
        </Box>
      );
    }
  }
}