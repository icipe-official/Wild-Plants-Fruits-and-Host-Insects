//https://stackoverflow.com/questions/72197774/how-to-call-where-clause-conditionally-prisma
// API for plant  fruit details
import prisma from "../../../lib/prisma";
export default async function getFilterdData(req, res) {
  const { colors } = req.query;
  // console.log('query')
  // const y=JSON.stringify(g)
  // const  t=(JSON.parse(y))
  // const v= JSON.parse(t)
  console.log(JSON.parse(req.query.colors));

  try {
    //Fetch data from database
    // console.log(params);
    const color = ["green"];
    const size = [];
    const plant = await prisma.plants.findMany({
      //...(leaf.length!==0?{ //check if fruit has values else skip this code ... is a spread operator
      select: {
        species_name: true,
        genus: {
          select: {
            genus_name: true,
          },
        },
      }, // This code iis run after every code below
      where: {
        AND: {
          ...(size.length !== 0
            ? {
                // ...spread operator

                leaf_type: { in: leaf },
              }
            : {}),
          ...(color.length !== 0
            ? {
                plant_fruit_color: {
                  some: {
                    fruit_color: {
                      color: { in: color },
                    },
                  },
                },
              }
            : {}),
        },
      },
    }); // {} end of spred operator
    // console.log(tms);
    res.json(plant);
  } catch (e) {
    console.error(e);
  }
}

// http://localhost:3000/api/plants/prisma_api/multipleEntry/multipletrial?filters={%22colors%22%20:%20[%22green%22],%22leaf%22:%20[%22simple%22]}`
