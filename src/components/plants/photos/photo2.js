import { Box } from "@mui/material";
import { useState, useEffect } from "react";
import styles from "./photos.module.css";
import { useRouter } from "next/router";
import useSWR from "swr";
import PhotosComponent from "./photosmain";
//This component will be receiving data from getstaticprops
export default function Photostrial({ photos_data }) {
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

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error } = useSWR(`${base_url}/api/plantsPage/${species}`, fetcher);

  // fetch(`/api/plantsPage/${species}`)
  // if (error) return <div>Failed to load</div>;
  // if (!data) return <div>Loading...</div>;
  console.log(" photo");
  //acces data only if it has more than one element in the array
  if (data && data.length > 0) {
    console.log("photosss");
    // console.log(data);
    // const photos = data
    //   .map((plant) => plant.plant_photos)[0]
    //   .map((p) => p.photo_name);
    // console.log(photos);
    // const photos = ["90"];
    //tract photonames from [[]] object
    // const photos = photoData.map((photo) => photo.plant_photos[0]);

    //check if length of photos is more than one
    return <PhotosComponent photos_data={data} />;
  }
}
