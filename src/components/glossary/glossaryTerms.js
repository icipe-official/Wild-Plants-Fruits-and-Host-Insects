import {
  Button,
  Card,
  Container,
  experimentalStyled,
  Grid,
  IconButton,
  Typography,
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
  //set query parameters
  const [query, setQuery] = useState({
    shrub_climbings: [],
    plant_spines: [],
    plant_latex: [],
    fruit_types: [],
    fruit_colors: [],
    fruit_sizes: [],
    fruit_shapes: [],
    leaf_types: [],
    leaf_margins: [],
    leaf_arrangements: [],
  });
  // state of selcted plant and glossary details
  const [selectedIndex, setSelectedIndex] = useState(0);

  // const baseUrl = "http://localhost:3000"; // set the base URL here

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  //   const router = useRouter();
  //   const species = router.query.species;
  //   console.log(species);
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

  const { data: example, error: specieserror1 } = useSWR(
    // pass the json stringified query
    `${base_url}/api/multipleEntry/multipleentry?filters=${JSON.stringify(
      query
    )}`,
    fetcher
  );
  // if (fruit_typerror) return <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
  // if (fruit_isloading) return <Box sx={{ marginTop: 6 }}> Loading...</Box>;
  // const [showPhotos, setShowPhotos] = useState(false);
  // const [selectedType, setSelectedType] = useState(null);
  // const router = useRouter();

  // // const [example, setExample] = useState(null);

  // // function handleClick(type) {
  // //   setSelectedType(type);
  // //   setShowPhotos(true);
  // //   setQuery((prevQueryInfo) => ({
  // //     ...prevQueryInfo,
  // //     fruit_types: type.type_of_fruit,
  // //   })); //setting state in dictionary
  // //   console.log("query");
  // //   console.log(query);
  // // }
  // //handle click of the plant
  // function handleClick(type) {
  //   const term = router.query.glossary_term;
  //   setSelectedType(type);
  //   console.log("type");

  //   console.log(type);
  //   setShowPhotos(true);
  //   setQuery((prevQueryInfo) => ({
  //     ...prevQueryInfo,
  //     fruit_types: type.type_of_fruit,
  //   }));
  //   console.log("example");

  //   console.log(example);
  // }

  // useEffect(() => {
  //   console.log("query: ", JSON.stringify(query));
  // }, [query]);

  const router = useRouter();
  const [showPhotos, setShowPhotos] = useState(false);
  const [selectedType, setSelectedType] = useState(null);
  const [selectedTerm, setSelectedTerm] = useState(false);
  // const [query, setQuery] = useState({ fruit_types: "" });
  const [filterdspecies, setFiltrerdsepcies] = useState(null);
  const glossaryTerm = router.query.glossary_term;

  //handle cancel
  function cancel() {
    //states for query
    // setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_types: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_latex: [] })); //setting state in dictionary
    // setQuery(prevQueryInfo => ({...prevQueryInfo,plant_thorns:[]})) //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_colors: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_shapes: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_sizes: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_types: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_types: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_margins: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_arrangements: [] }));
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, shrub_climbings: [] }));
  }
  const handleItemClick = (specie, index) => {
    setSelectedIndex(index);
  };
  //handle on click event of the image
  function handleClick(type) {
    if (type.glossary_term) {
      console.log("type on click");
      console.log(type);
      console.log(showPhotos);
      console.log("example");

      console.log(example);

      setSelectedType(type);
      setShowPhotos(true);
      setSelectedTerm(true);
      setQuery((prevQueryInfo) => ({
        ...prevQueryInfo,
        [type.glossary_type + "s"]: type?.glossary_term.toLowerCase(),
      }));
      //empty the query
    }
  }
  useEffect(() => {
    if (glossary && glossaryTerm) {
      const filteredType = glossary.find(
        (type) =>
          type.glossary_term.toLowerCase() === glossaryTerm.toLowerCase()
      );
      if (filteredType) {
        handleClick(filteredType);
        cancel();
      }
    }
  }, [glossary, glossaryTerm]);
  // useEffect(() => {
  //   if (glossary) {
  //     const filteredGlossary = glossary.filter(
  //       (g) => g.glossary_type === glossaryTerm
  //     );

  //     if (filteredGlossary) {
  //       handleClick(filteredGlossary);
  //       console.log("showPhotos");
  //       console.log(showPhotos);
  //     }
  //     if (selectedType && example && glossary && filterdspecies) {
  //       const glossaryPhotoIds = selectedType.photo_id;
  //       console.log("glossaryPhotoIds");

  //       console.log(glossaryPhotoIds);
  //       const filteredSpeciesList = example.filter((species) => {
  //         const photoIds = species.plants_photos.map((photo) => photo.id);
  //         return photoIds.every((id) => glossaryPhotoIds.includes(id));
  //       });
  //       console.log("filteredSpeciesList");
  //       setFiltrerdsepcies(filteredSpeciesList);

  //       console.log(filteredSpeciesList);
  //     }
  //   }
  // }, [glossary]);
  // );

  function handleClose() {
    setSelectedType(null);
    setShowPhotos(false);
  }

  if (glossary && example) {
    console.log("glossary");
    console.log(glossary);
    console.log(glossary);

    // console.log("example");

    // console.log(example);

    // console.log(
    //   fruit_type.fruit_types
    //     .filter((t) => Boolean(t.fruit_type_description))
    //     .map((t) => t.fruit_type_description)

    // const photos = example;
    console.log("example");
    // get plant species with photos
    const filtered_examples = example.filter((specie) => {
      console.log(" of the example");

      // console.log(specie);
      if (specie.plants_photos.length > 0) {
        return specie;
      }
    });
    console.log("example");

    console.log(example.map((sp) => sp.plants_photos).length > 0);

    console.log("filtered_examples");

    console.log(filtered_examples);
    console.log("photos");
    console.log(filtered_examples.map((photo) => photo.plants_photos));
    // \\use the selected index status to get the specific photls
    const photos = filtered_examples.map((photo) => photo.plants_photos)[
      selectedIndex
    ];
    console.log("individual photos");

    console.log(photos);
    //handle clicking of example species

    return (
      <Container>
        {/* filter only terms with description*/}
        <Box sx={{ fontWeight: "bold", marginTop: 9 }}>Alphabetical</Box>
        {glossary
          .filter((t) => Boolean(t.glossary_description))
          .map((type) => (
            //   <Grid container alignItems="center">
            //     <Grid item xs={true}>
            //       <DynamicValueCard
            //         value={
            //           type.type_of_fruit +
            //           " (fruit type): " +
            //           type.fruit_type_description
            //         }
            //       />
            //     </Grid>
            //     <Grid item>
            //       <Button onClick={() => handleClick(type)}>Photos</Button>
            //     </Grid>
            //   </Grid>
            <Grid container alignItems="center">
              <Grid item xs={true}>
                <div className={classes.dynamicValueCard}>
                  <DynamicValueCard
                    value={
                      type.glossary_term +
                      " (" +
                      type.glossary_type +
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

        {showPhotos && selectedType && example && (
          <Box
            sx={{
              position: "fixed",
              top: "40%",
              left: "40%",
              transform: "translate(-40%, -50%)",
              backgroundColor: "lightgrey",
              padding: "1rem",
              maxHeight: "60vh",
              maxWidth: "30%",
              overflowY: "auto",
              marginTop: 2,
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
              <Box sx={{ color: "red" }}> {selectedType.glossary_term}</Box>
              <Box> {selectedType.glossary_description}</Box>
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
                      photos_data={filtered_examples}
                      selectedIndex={selectedIndex}
                    />
                  </Box>
                </Box>
              </Box>

              <Box sx={{ fontWeight: "bold" }}> Examples </Box>
              <Box>
                {" "}
                {filtered_examples.map((specie, index) => (
                  <Box
                    sx={{
                      backgroundColor:
                        index === 0 && selectedIndex !== 0
                          ? "inherit"
                          : selectedIndex === index
                          ? "gray"
                          : "inherit",
                      color: selectedIndex === index ? "white" : "black",
                    }}
                    onClick={() => handleItemClick(specie, index)}
                  >
                    {/* <Link
                      key={specie.id}
                      href="/plants/[species]"
                      as={`/plants/${specie.id}`}
                      passHref
                      // href={`/plants/${specie.species_name}`}
                      style={{ textDecoration: "none", color: "black" }}
                    > */}
                    {specie.plant_genera.genus_name + " " + specie.species_name}
                    {/* </Link> */}
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
    // // console.log(data);
    // console.log("data.fruit_types.map(type)=>type.fruit_types_glossary");
    // const photos = data.fruit_types.map((type) =>
    //   type.fruit_types_glossary.map((photo) => photo.photo_id)
    // );
    // console.log("photos");

    // console.log(photos);
    // return (
    //   <Container sx={{ marginBottom: 2, marginTop: 7 }}>
    //     <Box sx={{ fontWeight: "bold" }}>Alphabetical</Box>
    //     {data.fruit_types.map((type) => (
    //       <Box sx={{ display: "flex" }}>
    //         <DynamicValueCard
    //           value={
    //             type.type_of_fruit +
    //             " (fruit type): " +
    //             type.fruit_type_description
    //           }
    //         />
    //         <Box>{handleClick(type)}</Box>
    //       </Box>
    //     ))}
    //   </Container>
    // );
  }
}
