import React, { useState } from "react";
import { TextField, Button, Container, Box } from "@mui/material";
import useSWR from "swr";
import axios from "axios";

const InsertForm = () => {
  const [speciesName, setSpeciesName] = useState("");
  const [maxLatitude, setMaxLatitude] = useState("");
  const [genusName, setGenusName] = useState("");
  const [familyName, setFamilyName] = useState("");
  const [minLatitude, setminLatitude] = useState("");
  const [plantdescription, setPlantDescription] = useState("");
  const [leaftype, setLeaftype] = useState("");
  const [password, setPassword] = useState("");
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const secretPassword = process.env.PASSWORD;
  const url = process.env.PASSWORD;
  //use npm install dotenv to store secure passwords
  // const { data, error } = useSWR("/api/insertData", fetcher);
  const handleLogin = (event) => {
    console.log("secretPassword");

    console.log(url);
    console.log("password");
    console.log(password);
    event.preventDefault();
    // Access the secret password from the environment variable
    // Check if the entered password is correct (e.g., "admin123")
    if (password !== secretPassword) {
      setIsLoggedIn(true);
    } else {
      console.log("Invalid password");
    }
  };
  const handleSubmit = async (event) => {
    event.preventDefault();
    // Only submit the form if the user is logged in
    if (!isLoggedIn) {
      console.log("Please log in first");
      return;
    }

    // Create the data object with form field values
    const data = {
      species_name: speciesName,
      max_latitude: maxLatitude,
      min_latitude: minLatitude,
      plant_description: plantdescription,
      genus_name: genusName,
      family_name: familyName,
      // Add more fields as needed
    };
    setFamilyName("");
    setGenusName("");
    setminLatitude("");
    setMaxLatitude("");
    setSpeciesName("");
    setPlantDescription("");
    setLeaftype("");

    try {
      // Send POST request to your API endpoint
      const response = await axios.post("/api/plants/insert", data);
      console.log(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  // if (error) {
  //   return <div>Error fetching data</div>;
  // }

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
              label="Species Name"
              value={speciesName}
              onChange={(e) => setSpeciesName(e.target.value)}
              fullWidth
              margin="normal"
            />
            <TextField
              label="genus Name"
              value={genusName}
              onChange={(e) => setGenusName(e.target.value)}
              fullWidth
              margin="normal"
            />
            <TextField
              label="Family name"
              value={familyName}
              onChange={(e) => setFamilyName(e.target.value)}
              fullWidth
              margin="normal"
            />

            <TextField
              label="Max Latitude"
              value={maxLatitude}
              onChange={(e) => setMaxLatitude(parseInt(e.target.value))}
              fullWidth
              margin="normal"
            />
            <TextField
              label="Min Latitude"
              value={minLatitude}
              onChange={(e) => setminLatitude(parseInt(e.target.value))}
              fullWidth
              margin="normal"
            />
            <TextField
              label="Leaf type"
              value={leaftype}
              onChange={(e) => setLeaftype(e.target.value)}
              fullWidth
              margin="normal"
            />
            <TextField
              label="Description"
              value={plantdescription}
              onChange={(e) => setPlantDescription(e.target.value)}
              fullWidth
              margin="normal"
            />

            {/* Add more fields as needed */}
            <Button type="submit" variant="contained" color="primary">
              Submit
            </Button>
          </form>
        </>
      )}
    </Container>
  );
};

export default InsertForm;
