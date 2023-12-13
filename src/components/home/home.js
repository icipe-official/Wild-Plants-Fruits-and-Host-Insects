import { useState, useEffect } from "react";
import Head from "next/head";
import {
  Box,
  Container,
  Grid,
  Card,
  CardContent,
  Typography,
  Link,
  Button,
} from "@mui/material";
import Image from "next/image";
import { useRouter } from "next/router";
import { useMediaQuery } from "@mui/material";
export default function HomePage() {
  const [images, setImages] = useState([]);
  const router = useRouter();
  const isSmallScreen = useMediaQuery(`(max-width: 760px)`);

  useEffect(() => {
    // List of image paths and corresponding names
    const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";

    const imageList = [
      {
        path: `${base_path}/photos/plants/0008.jpg`,
        name: "Acokanthera oppositifolia",
        speciesId: 8,
      },
      {
        path: `${base_path}/photos/insects/B001.jpg`,
        name: " Bactrocera amplexa",
        genusId: 13,
        speciesId: 22,
        order: "Diptera",
      },
      {
        path: `${base_path}/photos/plants/0058.jpg`,
        name: "Annona senegalensis ",
        speciesId: 40,
      },
      {
        path: `${base_path}/photos/insects/c003.jpg`,
        name: "Ceratitis argentobrunnea",
        genusId: 28,
        speciesId: 116,
        order: "Diptera",
      },
      {
        path: `${base_path}/photos/plants/01070.jpg`,
        name: " Vepris simplex",
        genusId: 851,
      },
      {
        path: `${base_path}/photos/insects/c017.jpg`,
        name: "Ceratitis cristata",
        genusId: 28,
        speciesId: 126,
        order: "Diptera",
      },
      {
        path: `${base_path}/photos/plants/01069.jpg`,
        name: "Vepris nobilis",
        speciesId: 850,
      },
      {
        path: `${base_path}/photos/insects/c046.jpg`,
        name: "Ceratitis rosa",
        genusId: 28,
        speciesId: 149,
        order: "Diptera",
      },
      {
        path: `${base_path}/photos/plants/0969.jpg`,
        name: "Strombosia scheffleri",
        speciesId: 770,
      },
    ];

    setImages(imageList);
  }, []);

  return (
    <Box>
      <Head>
        <title>Wild Fruits and Host Insects of Kenya</title>
        <meta name="description" content="home page" />
      </Head>
      <Box
        sx={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          height: "100%",
        }}
      >
        <Container>
          <Grid container spacing={2}>
            {" "}
            {images.map((image, index) => (
              <Grid item xs={isSmallScreen ? 12 : 4} key={index}>
                <Card>
                  {" "}
                  <Image
                    src={image.path}
                    alt={image.name}
                    width={350}
                    height={250}
                  />
                  <CardContent>
                    <Typography variant="subtitle1" align="center">
                      <Button
                        onClick={() => {
                          // Check if the path includes "insect"
                          if (image.path.toLowerCase().includes("insect")) {
                            router.push({
                              pathname: `/insects/${image.genusId}`,
                              query: {
                                genus: image.genusId,
                                species: image.speciesId,
                                speciesName: image.name,
                                order: image.order,
                              },
                            });
                          } else {
                            // Handle the case where the path doesn't include "insect"
                            router.push({
                              pathname: `/plants/${image.speciesId}`,
                            });
                          }
                        }}
                        style={{
                          fontStyle: "italic",
                          textTransform: "none",
                        }}
                      >
                        {image.name}
                      </Button>
                    </Typography>
                  </CardContent>
                </Card>
              </Grid>
            ))}
          </Grid>
        </Container>
      </Box>
    </Box>
  );
}
