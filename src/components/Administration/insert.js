import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import axios from "axios";
import useSWR from "swr";
import { useState, useEffect } from "react";
import { Autocomplete, IconButton } from "@mui/material";
import Accordion from "@mui/material/Accordion";
import AccordionSummary from "@mui/material/AccordionSummary";
import AccordionDetails from "@mui/material/AccordionDetails";
import Typography from "@mui/material/Typography";
import { makeStyles } from "@mui/styles";
import { ArrowDropDown } from "@mui/icons-material";
const useStyles = makeStyles((theme) => ({
  container: {
    display: "flex",
    alignItems: "center",
    "&:hover $arrowIcon": {
      transform: "translateX(5px)",
    },
  },
  arrowIcon: {
    marginLeft: theme.spacing(1),
    color: "maroon",
    transition: "transform 0.2s",
  },
}));

const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
export default function InsertForm() {
  const classes = useStyles();
  const fetcher = (url) => fetch(url).then((r) => r.json());
  const [imageFiles, setImageFiles] = useState([]);
  const [speciesName, setSpeciesName] = useState("");
  const [maxLatitude, setMaxLatitude] = useState("");
  const [genusName, setGenusName] = useState("");
  const [familyName, setFamilyName] = useState("");
  const [minLatitude, setMinLatitude] = useState("");
  const [plantDescription, setPlantDescription] = useState("");
  const [leafType, setLeafType] = useState("");
  const [Latex, setLatex] = useState([]);
  const [plantphoto, setPlantphoto] = useState([]);

  const [fruitType, setFruitType] = useState([]);
  const [fruitShape, setFruitShape] = useState([]);

  const [fruitColor, setFruitColor] = useState([]);
  const [fruitSize, setFruitSize] = useState([]);
  const [leafMargin, setLeafMargin] = useState([]);
  const [thornsSpines, setThornsSpines] = useState([]);
  const [leafArrangement, setLeafArrangement] = useState([]);
  const [shrubClimbing, setShrubclimbing] = useState([]);
  const [password, setPassword] = useState("");
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const secretPassword = process.env.PASSWORD;
  //conrol the sections of data input

  const [plantDetailsExpanded, setPlantDetailsExpanded] = useState(true);
  const [fruitsInfoExpanded, setFruitsInfoExpanded] = useState(false);
  const [leafInfoExpanded, setLeafInfoExpanded] = useState(false);
  const [selectedImage, setSelectedImage] = useState(null);
  const { data: speciesData, error: speciesError } = useSWR(
    `${base_url}/api/plants/species`,
    fetcher
  );
  const { data: plantFeaturesData, error: plantFeaturesError } = useSWR(
    `${base_url}/api/multipleEntry/allmultipleQuery`,
    fetcher
  );
  const Latexes =
    plantFeaturesData?.latex?.map((item) => item.latex_description) || [];
  console.log("shrubClimbings");

  const shrubClimbings =
    plantFeaturesData?.shrub_climbings?.map((item) => item.tree_type) || [];
  console.log("shrubClimbings");

  console.log(shrubClimbings);
  const fruitTypes =
    plantFeaturesData?.fruit_types?.map((item) => item.type_of_fruit) || [];
  const fruitShapes =
    plantFeaturesData?.fruit_shapes?.map((item) => item.shape) || [];
  const fruitSizes =
    plantFeaturesData?.fruit_sizes?.map((item) => item.size) || [];
  const leafTypes = ["Simple", "Compound"];
  const fruitColors =
    plantFeaturesData?.fruit_colors?.map((item) => item.color) || [];
  console.log(fruitColors);

  const leafMargins =
    plantFeaturesData?.leaf_margins?.map((item) => item.type_of_leaf_margin) ||
    [];
  const thornsSpinesOptions =
    plantFeaturesData?.spines?.map((item) => item.thorns_spines) || [];
  const leafArrangementsOptions =
    plantFeaturesData?.leaf_arrangements?.map((item) => item.arrangement) || [];

  const [families, setFamilies] = useState([]);
  const [genusList, setGenusList] = useState([]);

  //hnadle cases of inserting the data if not exits
  const checkIfDataExists = () => {
    // Check if the data exists in the options (lists)
    const fieldsToCheck = [
      { name: "family", value: familyName, options: families },
      { name: "genus", value: genusName, options: genusList },
      { name: "color", value: fruitColor, options: fruitColors },
      { name: "leaf type", value: leafType, options: leafTypes },
      // Add more fields to check as needed
    ];

    const missingFields = fieldsToCheck.filter(
      (field) => field.value && !field.options.includes(field.value)
    );

    if (missingFields.length > 0) {
      const missingFieldNames = missingFields.map((field) => field.name);
      const confirmed = window.confirm(
        `The following fields are not in the options: ${missingFieldNames.join(
          ", "
        )}. Do you want to insert them anyway?`
      );

      return confirmed;
    }

    return true;
  };
  const [message, setMessage] = useState("");
  const [showMessage, setShowMessage] = useState(false);
  const [dataExists, setDataExists] = useState(false);
  useEffect(() => {
    if (speciesData) {
      if (speciesData.length > 0) {
        const firstSpecies = speciesData[0];
        setFamilyName(firstSpecies.plant_genera.plant_families.family_name);
        setGenusName(firstSpecies.plant_genera.genus_name);

        const familyNames = speciesData.map(
          (species) => species.plant_genera.plant_families.family_name
        );
        const uniqueFamilies = [...new Set(familyNames)];
        setFamilies(uniqueFamilies);

        const genusNames = speciesData.map(
          (species) => species.plant_genera.genus_name
        );
        const uniqueGenus = [...new Set(genusNames)];
        setGenusList(uniqueGenus);
      }
    }
  }, [speciesData]);

  // const fetcher = async (url) => {
  //   try {
  //     const response = await axios.get(url);
  //     return response.data;
  //   } catch (error) {
  //     throw error;
  //   }
  // };
  const [image, setImage] = useState(null);
  const [createObjectURL, setCreateObjectURL] = useState(null);

  const uploadToClient = (event) => {
    if (event.target.files && event.target.files[0]) {
      const i = event.target.files[0];

      setImage(i);
      setCreateObjectURL(URL.createObjectURL(i));
    }
  };

  // const uploadToServer = async (event) => {
  //   const body = new FormData();
  //   // console.log("file", image)
  //   body.append("file", image);
  //   const response = await fetch("/api/plants/upload", {
  //     method: "POST",
  //     body,
  //   });
  // };
  const uploadToServer = async (event) => {
    const body = new FormData();
    for (const imageFile of imageFiles) {
      body.append("images", imageFile);
    }
    body.append("plantphoto", JSON.stringify(plantphoto)); // Convert the array to a JSON string

    const response = await fetch("/api/plants/upload", {
      method: "POST",
      body,
    });
  };
  const handleSubmit = async (event) => {
    event.preventDefault();
    // Create a FormData object
    const formData = new FormData();
    for (const imageFile of imageFiles) {
      formData.append("images", imageFile);
    }
    console.log("formData");

    console.log(formData);

    // if (!isLoggedIn) {
    //   console.log("Please log in first");
    //   return;
    // }

    // / Convert maxLatitude and minLatitude to numbers (if not empty strings)
    const maxLat = maxLatitude === "" ? null : parseInt(maxLatitude);
    const minLat = minLatitude === "" ? null : parseInt(minLatitude);

    const data = {
      species_name: speciesName,
      max_latitude: maxLat,
      min_latitude: minLat,
      plant_description: plantDescription,
      genus_name: genusName,
      family_name: familyName,
      latex: Latex,
      tree_type: shrubClimbing,
      leaf_type: leafType,
      shape: fruitShape,
      type_of_fruit: fruitType,
      color: fruitColor,
      size: fruitSize,
      type_of_leaf_margin: leafMargin,
      thorns_spines: thornsSpines,
      arrangement: leafArrangement,
      photo_name: selectedImage ? selectedImage.name : "", // Add this field
    };

    console.log(data);
    setSpeciesName("");
    setMaxLatitude("");
    setGenusName("");
    setFamilyName("");
    setMinLatitude("");
    setPlantDescription("");
    setLeafType("");
    setFruitColor([]);
    setFruitSize([]);
    setLeafMargin([]);
    setThornsSpines([]);
    setLatex([]);
    setShrubclimbing([]);
    setFruitType([]);
    setFruitShape([]);
    setLeafArrangement([]);

    try {
      const response = await axios.post("/api/plants/insert", data);
      // Upload images directly to the image upload API endpoint using axios
      // const response2 = await axios.post("/api/plants/upload", formData);

      // setShowMessage("Data inserted successfully");
      // console.log(response2);
      // setShowMessage("Data does inserted successfully") // const response2 = await axios.post("/api/plants/upload", formData);

      // setShowMessage("Data inserted successfully");
      // console.log(response2);
      // setShowMessage("Data does inserted successfully");;
      let imageUploadResponse = null;

      if (selectedImage) {
        const imageFormData = new FormData();
        imageFormData.append("file", selectedImage);

        imageUploadResponse = await fetch("/api/plants/upload", {
          method: "POST",
          body: imageFormData,
        });
      }

      setShowMessage("Data inserted successfully");
    } catch (error) {
      console.error(error);
    }
  };
  // const families = ['Family 1', 'Family 2', 'Family 3']; // Your options array
  // const [familyName, setFamilyName] = useState('');
  const handleInputChange = (event, value) => {
    setFamilyName(value);
    if (value && !families.includes(value)) {
      setShowMessage("Data does not exist. Do you want to add it?");
    } else {
      setShowMessage("");
    }
  };
  const handleBlur = () => {
    if (familyName && !families.includes(familyName)) {
      setShowMessage("Data does not exist. Do you want to add it?");
    } else {
      setShowMessage("");
    }
  };
  const handleImageSelection = (event) => {
    const selectedFile = event.target.files[0];
    setSelectedImage(selectedFile);
  };

  const isValueValid = familyName && !families.includes(familyName);
  return (
    <Container sx={{ marginTop: 9 }}>
      <Box sx={{ fontWeight: "bold" }}>Insert Data</Box>
      <form onSubmit={handleSubmit}>
        {/* Plant Info Section */}
        <Accordion
          expanded={plantDetailsExpanded}
          onChassnge={() => setPlantDetailsExpanded(!plantDetailsExpanded)}
        >
          <AccordionSummary>
            {/* <div className={classes.container}> */}
            <Typography color="maroon">Add Plant Data</Typography>
            <IconButton className={classes.arrowIcon}>
              <ArrowDropDown />
            </IconButton>
            {/* </div> */}
            {/* <Typography color="maroon">Add Plant Data</Typography> */}
          </AccordionSummary>
          <AccordionDetails>
            <TextField
              label="Species"
              value={speciesName}
              onChange={(e) => setSpeciesName(e.target.value)}
              fullWidth
              margin="normal"
            />
            <Autocomplete
              options={families}
              value={familyName}
              onInputChange={handleInputChange}
              onBlur={handleBlur} // Use onBlur event instead of onChange
              onChange={(event, value) => setFamilyName(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Family Name"
                  fullWidth
                  margin="normal"
                />
              )}
            />{" "}
            {message && <p>{message}</p>}
            <Autocomplete
              options={genusList}
              value={genusName}
              onChange={(event, value) => setGenusName(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Genus Name"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <TextField
              label="Max Elevation"
              value={maxLatitude}
              onChange={(e) => setMaxLatitude(e.target.value)}
              fullWidth
              margin="normal"
            />
            <TextField
              label="Min Elevation"
              value={minLatitude}
              onChange={(e) => setMinLatitude(e.target.value)}
              fullWidth
              margin="normal"
            />
            <TextField
              label="Plant Description"
              value={plantDescription}
              onChange={(e) => setPlantDescription(e.target.value)}
              fullWidth
              margin="normal"
            />
            <Autocomplete
              multiple
              options={Latexes}
              value={Latex}
              onChange={(event, value) => setLatex(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Latex"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              multiple
              options={thornsSpinesOptions}
              value={thornsSpines}
              onChange={(event, value) => setThornsSpines(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Thorns or Spines"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              multiple
              options={shrubClimbings}
              value={shrubClimbing}
              onChange={(event, value) => setShrubclimbing(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Type of tree"
                  fullWidth
                  margin="normal"
                />
              )}
            />
          </AccordionDetails>
        </Accordion>
        {/* Fruits Info Section */}
        {/* Fruits Info Section */}
        <Accordion
          expanded={fruitsInfoExpanded}
          onChange={() => setFruitsInfoExpanded(!fruitsInfoExpanded)}
        >
          <AccordionSummary>
            <Typography color="red">Fruit Data</Typography>
          </AccordionSummary>
          <AccordionDetails>
            <Autocomplete
              multiple
              options={fruitColors}
              value={fruitColor}
              onChange={(event, value) => setFruitColor(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Fruit Color"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              multiple
              options={fruitTypes}
              value={fruitType}
              onChange={(event, value) => setFruitType(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Fruit Type(s)"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              multiple
              options={fruitSizes}
              value={fruitSize}
              onChange={(event, value) => setFruitSize(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Fruit Size (s)"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              multiple
              options={fruitShapes}
              value={fruitShape}
              onChange={(event, value) => setFruitShape(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Fruit Shape (s)"
                  fullWidth
                  margin="normal"
                />
              )}
            />
          </AccordionDetails>
        </Accordion>
        {/* Leaf Info Section */}
        <Accordion
          expanded={leafInfoExpanded}
          onChange={() => setLeafInfoExpanded(!leafInfoExpanded)}
        >
          <AccordionSummary>
            <Typography color="green">Leaf Data</Typography>
          </AccordionSummary>
          <AccordionDetails>
            <Autocomplete
              multiple
              options={leafMargins}
              value={leafMargin}
              onChange={(event, value) => setLeafMargin(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Leaf Margin(s)"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              options={leafTypes}
              value={leafType}
              onChange={(event, value) => setLeafType(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Leaf Type"
                  fullWidth
                  margin="normal"
                />
              )}
            />
            <Autocomplete
              multiple
              options={leafArrangementsOptions}
              value={leafArrangement}
              onChange={(event, value) => setLeafArrangement(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Leaf Arrangement"
                  fullWidth
                  margin="normal"
                />
              )}
            />
          </AccordionDetails>
        </Accordion>
        {/* <input
          type="file"
          accept="image/*"
          multiple
          onChange={(e) => setImageFiles(Array.from(e.target.files))}
          style={{ margin: "10px 0" }}
        /> */}
        <Box>
          {selectedImage && <img src={URL.createObjectURL(selectedImage)} />}
          <h4>Select Image</h4>
          <input type="file" name="myImage" onChange={handleImageSelection} />
        </Box>
        <Button type="submit" variant="contained" color="primary">
          Submit
        </Button>
      </form>
    </Container>
  );
}
