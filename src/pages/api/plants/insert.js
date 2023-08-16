import NextCors from "nextjs-cors";
import { mutate } from "swr";
import prisma from "../../../lib/prisma";

export default async function postPlant(req, res) {
  await NextCors(req, res, {
    methods: ["POST", "GET"],
    origin: "*",
    optionsSuccessStatus: 200,
  });

  if (req.method === "POST") {
    const {
      species_name,
      max_latitude,
      min_latitude,
      genus_name,
      family_name,
      plant_description,
      latex,
      tree_type,
      leaf_type,
      shape,
      type_of_fruit,
      color,
      size,
      type_of_leaf_margin,
      thorns_spines,
      arrangement,
      photo_name,
    } = req.body;

    // Convert max_latitude and min_latitude to integers
    const parsedMaxLatitude = parseInt(max_latitude, 10);
    const parsedMinLatitude = parseInt(min_latitude, 10);

    try {
      // Check if the family already exists in the plant_families table
      let plantFamily = await prisma.plant_families.findUnique({
        where: {
          family_name,
        },
      });

      let familyId;

      // If the family doesn't exist, create it and retrieve its id
      if (!plantFamily) {
        plantFamily = await prisma.plant_families.create({
          data: {
            family_name,
          },
        });
        familyId = plantFamily.id;
      } else {
        familyId = plantFamily.id;
      }

      // Check if the genus already exists in the plant_genera table
      let plantGenus = await prisma.plant_genera.findUnique({
        where: {
          genus_name,
        },
      });

      let genusId;

      // If the genus doesn't exist, create it and retrieve its id
      if (!plantGenus) {
        plantGenus = await prisma.plant_genera.create({
          data: {
            genus_name,
            plant_families: {
              connect: {
                id: familyId,
              },
            },
          },
        });
        genusId = plantGenus.id;
      } else {
        genusId = plantGenus.id;
      }

      // Check if the plant already exists
      const existingPlant = await prisma.plants.findFirst({
        where: {
          species_name,
        },
      });

      if (existingPlant) {
        // Handle the case when the plant already exists
        res.status(400).json({ message: "Plant already exists" });
        return;
      }

      // Create the plant record with the obtained genusId and converted latitudes
      const createdPlant = await prisma.plants.create({
        data: {
          species_name,
          max_latitude: parsedMaxLatitude,
          min_latitude: parsedMinLatitude,
          plant_description,
          plant_genera: {
            connect: {
              id: genusId,
            },
          },
        },
      });
      console.log("data back end");
      console.log(createdPlant);
      // Function to check if each feature exists or create it if it doesn't exist
      const checkOrCreateFeature = async (
        featureList,
        modelName,
        fieldName
      ) => {
        const createdFeatures = [];
        for (let feature of featureList) {
          let existingFeature = await prisma[modelName].findUnique({
            where: {
              [fieldName]: feature, // Use the unique identifier, e.g., color_id
            },
          });
          console.log("existingFeature");
          console.log(existingFeature);

          if (!existingFeature) {
            console.log("existingFeature 5");
            console.log(existingFeature);
            existingFeature = await prisma[modelName].create({
              data: {
                [fieldName]: feature[fieldName], // Use the unique identifier, e.g., color_id
              },
            });
          }
          createdFeatures.push(existingFeature);
        }
        return createdFeatures;
      };
      // crete plant photos
      // Create plant_photos records for the uploaded photos
      if (photo_name && Array.isArray(photo_name)) {
        for (const photo of photo_name) {
          await prisma.plants_photos.create({
            data: {
              plant_id: createdPlant.id,
              photo_name: photo,
            },
          });
        }
      } else if (photo_name) {
        // If it's a single photo, create one plant_photos entry
        await prisma.plants_photos.create({
          data: {
            plant_id: createdPlant.id,
            photo_name: photo_name,
          },
        });
      }

      // Function to connect the feature to the plant using the bridge table
      const connectFeatureToPlant = async (
        featureList,
        bridgeTable,
        model,
        fieldName,
        idFieldName
      ) => {
        for (let feature of featureList) {
          if (fieldName == "fruit_size_id") {
            var existingFeature = await prisma[model].findUnique({
              where: {
                ["id"]: feature["id"],
              },
            });
          } else {
            if (fieldName == "thorn_id") {
              var existingFeature = await prisma[model].findUnique({
                where: {
                  ["thorn_id"]: feature["thorn_id"],
                },
              });
            } else {
              var existingFeature = await prisma[model].findUnique({
                where: {
                  [fieldName]: feature[fieldName],
                },
              });
            }
          }
          console.log("existingFeature");

          console.log(existingFeature);
          const [firstKey, firstValue] = Object.entries(existingFeature)[0];
          console.log(firstValue);

          if (existingFeature) {
            await prisma[bridgeTable].create({
              data: {
                [idFieldName]: createdPlant.id,
                [fieldName]: firstValue,
              },
            });
          } else {
            const createdFeature = await prisma[model].create({
              data: {
                [fieldName]: feature[fieldName],
              },
            });

            await prisma[bridgeTable].create({
              data: {
                [idFieldName]: createdPlant.id,
                [fieldName]: createdFeature.id,
              },
            });
          }
        }
      };

      // Check and create features for each bridge table
      const createdShapes = await checkOrCreateFeature(
        shape,
        "fruit_shapes",
        "shape"
      );
      const createdFruitTypes = await checkOrCreateFeature(
        type_of_fruit,
        "fruit_types",
        "type_of_fruit"
      );
      const createdColors = await checkOrCreateFeature(
        color,
        "fruit_colors",
        "color"
      );
      const createdSizes = await checkOrCreateFeature(
        size,
        "fruit_sizes",
        "size"
      );
      const createdLeafMargins = await checkOrCreateFeature(
        type_of_leaf_margin,
        "leaf_margins",
        "type_of_leaf_margin"
      );
      const createdSpinesThorns = await checkOrCreateFeature(
        thorns_spines,
        "spines_thorns",
        "thorns_spines"
      );
      const createdLeafArrangements = await checkOrCreateFeature(
        arrangement,
        "leaf_arrangements",
        "arrangement"
      );

      // Connect the plant to the features using bridge tables
      await connectFeatureToPlant(
        createdShapes,
        "plants_fruit_shapes",
        "fruit_shapes",
        "fruit_shape_id",
        "plant_id"
      );
      await connectFeatureToPlant(
        createdFruitTypes,
        "plants_fruit_types",
        "fruit_types",
        "fruit_type_id",
        "plant_id"
      );
      await connectFeatureToPlant(
        createdColors,
        "plants_fruit_colors",
        "fruit_colors",
        "color_id",
        "plant_id"
      );
      await connectFeatureToPlant(
        createdSizes,
        "plants_fruit_sizes",
        "fruit_sizes",
        "fruit_size_id",
        "plant_id"
      );
      await connectFeatureToPlant(
        createdLeafMargins,
        "plants_leaf_margins",
        "leaf_margins",
        "leaf_margin_id",
        "plant_id"
      );
      await connectFeatureToPlant(
        createdSpinesThorns,
        "plants_spines_thorns",
        "spines_thorns",
        "thorn_id",
        "plant_id"
      );
      await connectFeatureToPlant(
        createdLeafArrangements,
        "plants_leaf_arrangements",
        "leaf_arrangements",
        "leaf_arrangement_id",
        "plant_id"
      );

      // Invalidate SWR cache to trigger a revalidation
      mutate("/api/plantData");

      res.status(200).json({ message: "Data inserted successfully" });
    } catch (error) {
      console.error("Error inserting data:", error);
      res.status(500).json({ message: "Internal Server Error" });
    }
  } else {
    res.status(405).json({ message: "Method Not Allowed" });
  }
}
