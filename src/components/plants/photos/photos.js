import { Box } from "@mui/material";
import { useState, useEffect } from "react";
// import Image from "next/legacy/image";
import Image from "next/image";

import styles from "./photos.module.css";
import { useRouter } from "next/router";
import useSWR from "swr";
//This component will be receiving data from getstaticprops
export default function Photos({ photo_data }) {
  const [photoData, setphotoData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);

  // console.log("photos");
  // console.log(photos);
  const [showImage, setShowImage] = useState({
    showImageNow: true,
    showImageId: null,
  });
  const [open, setOpen] = useState(0);

  const router = useRouter();
  const species = router.query.speciesName;
  console.log("species");
  console.log(species);
  // useEffect(() => {
  //   fetch(`/api/plantsPage/${species}`)
  //     .then((res) => res.json())
  //     .then(
  //       (result) => {
  //         setLoaded(true);
  //         setphotoData(result);
  //       },
  //       (error) => {
  //         setLoaded(true);
  //         setError(error);
  //       }
  //     );
  // }, []);
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data, error } = useSWR(`/api/plantsPage/${species}`, fetcher);

  // fetch(`/api/plantsPage/${species}`)
  // if (error) return <div>Failed to load</div>;
  // if (!data) return <div>Loading...</div>;
  console.log(" photo");
  //acces data only if it has more than one element in the array
  if (data && data.length > 0) {
    console.log("photosss");

    console.log(data);
    const photos = data
      .map((plant) => plant.plant_photos)[0]
      .map((p) => p.photo_name);
    console.log(photos);
    // const photos = ["90"];
    //tract photonames from [[]] object
    // const photos = photoData.map((photo) => photo.plant_photos[0]);

    //check if length of photos is more than one
    if (photos.length === 1) {
      return (
        <Box sx={{ marginTop: "1rem", marginLeft: 2 }}>
          {photos.map((specie) => (
            <Box key={specie.id}>
              {specie.map((photo) => (
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
        <Box sx={{ marginTop: "1rem", marginLeft: 2, paddingBottom: 2 }}>
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
          setOpen(0);
        } else {
          setOpen(open + 1);
        }
      };
      return (
        <Box sx={{ marginTop: "1rem", marginLeft: 2, paddingBottom: 2 }}>
          <Image
            src={`/plants/${photos[open]}`}
            alt="No Image"
            width={500}
            height={400}
            layout="responsive"
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
}
