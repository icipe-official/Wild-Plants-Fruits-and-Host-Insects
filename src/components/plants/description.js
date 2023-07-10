import { makeStyles } from "@mui/styles";
// import React, { useState } from "react";
import {
  Button,
  Card,
  CardActions,
  CardContent,
  Typography,
} from "@mui/material";
import { Box } from "@mui/system";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
import PlantDescription from "./plantDescriptionCard";

// Define styles using makeStyles function
const useStyles = makeStyles({
  // card: {
  //   width:310,
  //   // margin: 'auto',
  //   marginLeft:2
  // },
  // expandButton: {
  //   marginLeft: 'auto',
  // },
  // expandedContent: {
  //   marginTop: 20,
  //   whiteSpace: 'pre-wrap',
  // },
});

/**
 * PlantDescriptionMUI component that displays the name, description, and details of a plant.
 * @param {object} plant - The plant object that contains the name, description, and details of the plant.
 * @returns {JSX.Element} A Card component that displays the name, description, and details of the plant.
 */
export default function PlantDescriptioncomponent({ plants_data }) {
  if (data && data.length > 0) {
    ////console.log(' data description');

    ////console.log(data);

    return <PlantDescription plants_data={data} />;
  }
}
