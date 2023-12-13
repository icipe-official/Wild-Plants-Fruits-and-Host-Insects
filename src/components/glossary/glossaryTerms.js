import {
  Button,
  Card,
  Container,
  experimentalStyled,
  Grid,
  IconButton,
  Typography,
  useMediaQuery,
} from "@mui/material";
import Glossary from "components/glossary/glossary";
import { Box } from "@mui/system";
import { makeStyles } from "@mui/styles";
import useSWR from "swr";
import DynamicValueCard from "components/plants/dynamicvaluecard";
import { type } from "os";
import Image from "next/legacy/image";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import Link from "next/link";
import PhotosComponent from "components/plants/photos/photosmain";
import { transcode } from "buffer";
const useStyles = makeStyles({
  root: {
    display: "flex",
    paddingTop: 4,
    // marginLeft: "1rem",
  },
  item: {
    margin: 0,
  },
  card: {
    width: "100%",
    height: 25,
  },
  // content: {
  //   paddingLeft: 20, // Add this line to add padding to the left of the content
  //   margin: -15,
  // },
  content: {
    // height: 150,
    overflowY: "scroll",
    width: "20%",
    border: "1px solid #ccc",
    color: "red",
    textAlign: "center",
    marginTop: 4,
    marginLeft: 3,
  },
  dynamicValue: {
    padding: "16px",
    fontSize: "24px",
  },
  dynamicValueSmallScreen: {
    fontSize: "16px",
    padding: "8px",
  },
});

export default function GlossaryAll() {
  const classes = useStyles();
  const fetcher = (url) => fetch(url).then((r) => r.json());
  //image list

  // const baseUrl = "http://localhost:3000"; // set the base URL here

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  //   const router = useRouter();
  //   const species = router.query.species;
  //   ////console.log(species);
  // const { data, error, isLoading } = usePlantFeatures(species);
  // const { data, error, isLoading } = useSWR(
  //   `${baseUrl}/api/multipleEntry/allmultipleQuery`,
  //   fetcher
  // );

  const {
    data: glossary,
    error: fruit_typerror,
    isLoading: fruit_isloading,
  } = useSWR(`${base_url}/api/glossary/glossary`, fetcher);

  const router = useRouter();
  const [showPhotos, setShowPhotos] = useState(false);
  const [selectedType, setSelectedType] = useState(null);
  const [selectedTerm, setSelectedTerm] = useState(false);
  const [uniqueIndex, setuniqueIndex] = useState(0);
  // state of selcted plant and glossary details
  const [selectedIndex, setSelectedIndex] = useState(0);

  // const [query, setQuery] = useState({ fruit_types: "" });
  const [filterdspecies, setFiltrerdsepcies] = useState(null);
  const glossaryTerm = router.query;

  const handleItemClick = (specie, index) => {
    setSelectedIndex(index);

    setuniqueIndex(index);
  };

  const handleDoubleClick = (specie, index) => {
    // const url = `/plants/${specie.id}`;
    // setSelectedIndex(index);
    router.push(`/plants/${specie.plants_photos.plant_id}`);
  };

  //handle on click event of the image
  function handleClick(type, index) {
    setSelectedTerm(true);
    if (type?.glossary_term) {
      // Update the selected index
      // setSelectedIndex(clickedSpeciesIndex);
      setSelectedType(type);
      setShowPhotos(true);
      setSelectedTerm(true);
      setSelectedIndex(index ? index : 0);
      setuniqueIndex(index ? index : 0);
    }
    // console.log("type");
    // console.log(type);
    // setuniqueIndex(index ? index : 0);
  }

  useEffect(() => {
    if (glossaryTerm) {
      // setShowPhotos(true);
      console.log("glossaryTerm5");
      // console.log("glossaryTerm5");

      const value = Object.values(glossaryTerm)[0];
      // console.log(value.charAt(0).toUpperCase() + value.slice(1));
      const filteredItems = glossary?.filter((item) =>
        item.glossary_term.includes(
          value.charAt(0).toUpperCase() + value.slice(1)
        )
      );
      console.log("glossary");
      console.log(filteredItems);
      if (typeof filteredItems !== null) {
        handleClick(filteredItems);
      }
    }
  }, [glossary, glossaryTerm]);

  const isSmallScreen = useMediaQuery(`(max-width: 1282px)`);
  // console.log(query);
  function handleClose() {
    setSelectedType(null);
    setShowPhotos(false);
  }

  if (fruit_typerror)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: isSmallScreen ? "100%" : "50%",
          paddingLeft: isSmallScreen ? 0 : "10%", // Adjust the left margin for large screens
          paddingRight: isSmallScreen ? 0 : "10%", // Adjust the right margin for large screens
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
      </Container>
    );

  if (fruit_isloading)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
        {/* Footer goes here */}
      </Container>
    );

  if (glossary) {
    console.log("glossaryTerm22");
    console.log("glossaryTerm22");
    console.log(glossaryTerm);

    // console.log(glossary.glossary_examples);

    if (selectedTerm !== null) {
      // Create a set to store unique plant IDs
      const uniquePlantIds = new Set();

      // Create an array to store unique species
      var uniqueSpecies = [];

      // Iterate through each glossary term in the data
      selectedType?.glossary_examples.forEach((glossaryTerm) => {
        console.log("glossaryTerm");

        console.log(glossaryTerm);
        // Check if 'glossaryTerm.glossary_examples' is an array

        // Iterate through each example in the array
        selectedType.glossary_examples.forEach((example) => {
          console.log("example");

          console.log(example);
          // Check if the plant ID is not in the set, then add it
          if (!uniquePlantIds.has(example.plants_photos.plant_id)) {
            uniquePlantIds.add(example.plants_photos.plant_id);

            // Add the unique species to the array
            uniqueSpecies.push(example.plants_photos);
            console.log("uniqueSpecies", uniqueSpecies);
          }
        });
      });
      const photos_data = selectedType?.glossary_examples?.filter(
        (plant) =>
          plant?.plants_photos?.plant_id ===
          uniqueSpecies[selectedIndex]?.plant_id
      );
      console.log("photos_data");

      console.log(uniqueIndex);

      const transformedData = [
        {
          // setShowPhotos(true);

          plants_photos: photos_data?.map((item) => ({
            photo_name: item.photo_name,
            plants: Object.values(item.plants_photos).map((plant) => ({
              plant_id: plant.plant_id,
            })),
          })),
        },
      ];

      console.log("transformedData");

      console.log(selectedIndex);

      // console.log("uniqueSpecies");

      // console.log(uniqueSpecies);
      // console.log("selectedType");

      // console.log(selectedType);

      return (
        <Container>
          {/* filter only terms with description*/}
          <Box sx={{ fontWeight: "bold", marginTop: 9 }}>Alphabetical</Box>
          {glossary
            .filter((t) => Boolean(t.glossary_description))
            .map((type, index) => (
              <Grid container alignItems="center">
                <Grid item xs={true}>
                  <div className={classes.dynamicValueCard}>
                    <DynamicValueCard
                      key={type.id} // Add a unique key prop
                      value={
                        type.glossary_term.replace(/_/g, " ") +
                        " (" +
                        type.glossary_type.replace(/_/g, " ") +
                        "): " +
                        type.glossary_description
                      }
                    />
                    {/* </Box> */}
                  </div>
                </Grid>
                <Grid item>
                  <Button
                    sx={{ textDecoration: "none" }}
                    onClick={() => handleClick(type)}
                    color="success"
                  >
                    Images
                  </Button>
                </Grid>
              </Grid>
            ))}
          {/* </Box> */}

          {showPhotos && (
            <Box
              sx={{
                position: "fixed",
                top: "40%",
                left: "40%",
                transform: "translate(-40%, -50%)",
                backgroundColor: "lightgrey",
                padding: "1rem",
                maxHeight: "80%",
                maxWidth: "100%", // Adjusted maxWidth to occupy around 3/4 of the screen
                overflowY: "auto",
                marginTop: 10,
              }}
            >
              {/* <IconButton onClick={handleClose} sx={{ position: "absolute", top: 0, right: 0 }}>
        <CloseIcon/>
      </IconButton>
            <Button sx={{ color: "green" }} onClick={handleClose}>
            
              Close
            </Button> */}
              <Button
                type="button"
                class="close"
                aria-label="Close"
                onClick={handleClose}
              >
                <span aria-hidden="true">&times;</span>
              </Button>
              <Box sx={{ marginLeft: 0 }}>
                <Box sx={{ color: "red" }}> {selectedType?.glossary_term} </Box>
                <Box> {selectedType?.glossary_description}</Box>
                <Box>
                  <Box>
                    <Box>
                      {/* <Image
                      src={`/plants/${selectedType.photo_id}`}
                      alt="Picture of the plant"
                      width={300}
                      height={200}
                      layout="responsive"
                    /> */}
                      <PhotosComponent
                        photos_data={transformedData}
                        selectedIndex={0}
                      />
                    </Box>
                  </Box>
                </Box>

                <Box sx={{ fontWeight: "bold" }}> Examples </Box>
                <Box>
                  {" "}
                  {uniqueSpecies.map((specie, index) => (
                    <Box
                      key={index}
                      sx={{
                        backgroundColor:
                          index === 0 && selectedIndex !== 0
                            ? "inherit"
                            : selectedIndex === index
                            ? "gray"
                            : "inherit",
                        color: selectedIndex === index ? "white" : "black",
                        cursor: "pointer",
                      }}
                      onClick={() => handleItemClick(specie, index)}
                      onDoubleClick={() => handleDoubleClick(specie, index)}
                    >
                      {specie.plants.plant_genera.genus_name +
                        " " +
                        specie.plants.species_name}
                    </Box>
                  ))}
                  <Box>
                    {/* {species.plant_genera.genus_name} {species.species_name} */}
                  </Box>
                </Box>
              </Box>
            </Box>
          )}
        </Container>
      );
    }
  }
}
