// // components/Introduction.js
import React from "react";
import { Container } from "@mui/material";
const About = () => {
  return (
    <Container>
      <iframe
        title="Introduction"
        src="introduction.html" // Adjust the filename and path as needed
        style={{
          position: "relative",
          top: 100,
          left: 2,
          width: "100%", // Set a fixed width
          height: "100vh", // Set a fixed height
        }}
        // frameBorder="0"
      />
    </Container>
  );
};

export default About;
