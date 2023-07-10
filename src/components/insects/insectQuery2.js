// import { useState, useEffect } from 'react';
// import { useRouter } from 'next/router';
import { useState } from "react";

import useSWR from "swr";
import { useRouter } from "next/router";
import OpenLayersMap from "components/plants/distribution/map";
import Grid from "@mui/material/Grid";
import RegionsInsect from "./regeons";
import InsectQueryComponent from "./insectsQuery";
import InsectPhotos from "./photo";
import FruitsReared from "./fruitsReared";
import { Box, Typography } from "@mui/material";

// import { Container,ButtonBase } from '@mui/material';
// import Link from 'next/link';
export default function InsectQuery2() {
  const router = useRouter();
  // destructure to obtain insect oredr ans species
  const { genus, order } = router.query;

  const species = parseInt(router.query.species);
  console.log("species");
  console.log(genus);
  // const base_url = "http://localhost:3000";

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  const [selectedIndex, setSelectedIndex] = useState(0);
  const [speciesdata, setSpecciesdata] = useState("");
  // species list data set revalidation to false to prevent data refetch
  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/insects/insectsPage/${genus}`,
    fetcher
  );

  if (error) return <div>Error fetching data</div>;
  if (isLoading || !data) return <div>Loading...</div>;
  console.log("species");

  // insect data
  // const { data: insect_data, error: insectserror } = useSWR(
  //   `/api/insects/insectsPage/${species}`,
  //   fetcher
  // );
  // useEffect(() => {
  //   if (genus_data && genus_data.length > 0) {
  //     setSpecciesdata(species);
  //   }
  // }, [genus_data]);
  console.log("species insect page");
  console.log(typeof species);
  console.log("genus_data");
  const { speciesName } = router.query;
  console.log(data);
  console.log("insect_data");
  // console.log(insect_data);

  console.log("selected_species client side");
  if (data) {
    const fruits = data.map((fruit) =>
      fruit.plants_insects.map((specie) => specie.plants)
    )[0]; // [0] extract the first object
    console.log("fruits reatred Fruits functionsl component");
    console.log(fruits);

    console.log("fruits_reared");
    console.log(fruits);
    console.log("singleList");

    const insects_region = data.filter((insect) => insect.id === species);
    console.log("insect region");
    console.log(insects_region);

    const coordinates = insects_region.map((specie) =>
      specie.insects_regions.map((region) => {
        const latitude = parseFloat(region.regions.latitude);
        const longitude = parseFloat(region.regions.longitude);
        return [longitude, latitude];
      })
    );
    console.log("coordinates");
    console.log(coordinates.map((c) => c));

    return (
      <Grid
        container
        spacing={2}
        marginTop={typeof speciesName === "undefined" ? 3 : 8}
      >
        <Grid item xs={12} md={6} lg={6}>
          {typeof speciesName === "undefined" ? (
            <InsectQueryComponent genus_data={data} />
          ) : (
            <>
              <Typography variant="body1">
                <strong>Species:</strong>{" "}
                <span style={{ color: "maroon", fontWeight: "bold" }}>
                  {speciesName}
                </span>
              </Typography>
              <Typography variant="body1">
                <strong>Genus:</strong>{" "}
                <span style={{ color: "maroon" }}>
                  {speciesName.split(" ")[0]}
                </span>
              </Typography>
              <Typography variant="body1">
                <strong>Order:</strong>{" "}
                <span style={{ color: "maroon" }}>{order}</span>
              </Typography>
            </>
          )}
          <FruitsReared fruits_reared_data={insects_region} />
          <RegionsInsect regions_collected_data={insects_region} />
          Map
          <OpenLayersMap coordinates={coordinates} />
        </Grid>
        <Grid
          item
          xs={12}
          md={6}
          lg={6}
          marginTop={typeof speciesName === "undefined" ? 3 : 6}
        >
          <InsectPhotos photos_data={insects_region} />
        </Grid>

        {/* </Grid> */}
      </Grid>
    );
  }
}
