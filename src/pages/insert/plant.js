import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
import axios from "axios";
import useSWR from "swr";
import { useState, useEffect } from "react";
import { Autocomplete } from "@mui/material";
const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

export default function InsertForm() {
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const [speciesName, setSpeciesName] = useState("");
  const [maxLatitude, setMaxLatitude] = useState("");
  const [genusName, setGenusName] = useState("");
  const [familyName, setFamilyName] = useState("");
  const [minLatitude, setMinLatitude] = useState("");
  const [plantDescription, setPlantDescription] = useState("");
  const [leafType, setLeafType] = useState("");
  const [Latex, setLatex] = useState([]);

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

  const handleLogin = (event) => {
    event.preventDefault();
    if (password !== secretPassword) {
      setIsLoggedIn(true);
    } else {
      console.log("Invalid password");
    }
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    if (!isLoggedIn) {
      console.log("Please log in first");
      return;
    }

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
    setLeafArrangement([]);

    try {
      const response = await axios.post("/api/plants/insert", data);
      console.log(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <Container sx={{ marginTop: 9 }}>
      {!isLoggedIn ? (
        <Box sx={{ fontWeight: "bold" }}>
          <form onSubmit={handleLogin}>
            <TextField
              label="Password"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              fullWidth
              margin="normal"
            />
            <Button type="submit" variant="contained" color="primary">
              Login
            </Button>
          </form>
        </Box>
      ) : (
        <>
          <Box sx={{ fontWeight: "bold" }}>Insert Plants Data</Box>
          <form onSubmit={handleSubmit}>
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
              onChange={(event, value) => setFamilyName(value)}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Genus Name"
                  fullWidth
                  margin="normal"
                />
              )}
            />
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

            <Button type="submit" variant="contained" color="primary">
              Submit
            </Button>
          </form>
        </>
      )}
    </Container>
  );
}
