import prisma from "../../lib/prisma";
import csv from "csv-stringify";
export default async function handler(req, res) {
  const data = await prisma.plants.findMany({
    select: {
      species_name: true,
      max_latitude: true,
      min_latitude: true,
      plant_description: true,
      plant_genera: {
        select: {
          genus_name: true,
          plant_families: {
            select: {
              family_name: true,
            },
          },
        },
      },
      plants_woody_herbaceous: {
        select: {
          back_id: true,
          woody_herbaceous: {
            select: {
              type_of_stem: true,
            },
          },
        },
      },

      plants_latex: {
        select: {
          fruit_latex_id: true,
          latex: {
            select: { latex_description: true },
          },
        },
      },
      plants_spines_thorns: {
        select: {
          thorn_id: true,
          spines_thorns: {
            select: { thorns_spines: true },
          },
        },
      },
      plants_shrub_climbings: {
        select: {
          shrub_id: true,
          shrub_climbings: {
            select: { tree_type: true },
          },
        },
      },
    },
  });
  const flattenedData = data.map((plant) => {
    return {
      species_name: plant.species_name,
      max_latitude: plant.max_latitude,
      min_latitude: plant.min_latitude,
      description: plant.description,
      genus_name: plant.plant_genera.genus_name,
      family_name: plant.plant_genera.plant_families.family_name,
      stem_type: plant.plants_woody_herbaceous
        .map((y) => y.woody_herbaceous.type_of_stem)
        .join(","),
      //   type_of_stem: plant.plants_woody_herbaceous.woody_herbaceous.map((t)=>t.tree_type)
      latex_description: plant.plants_latex
        .map((latex) => latex.latex.latex_description)
        .join(","),
      //   thorns_spines: plant.plants_spines_thorns.spines_thorns.thorns_spines,
      //   tree_type: plant.plants_shrub_climbings.shrub_climbings.tree_type,
    };
  });
  console.log(
    data.map((plant) =>
      plant.plants_woody_herbaceous.map((y) => y.woody_herbaceous.type_of_stem)
    )
  );
  const csvString = await new Promise((resolve, reject) => {
    csv(flattenedData, { header: true, delimiter: "\t" }, (err, output) => {
      if (err) reject(err);
      else resolve(output);
    });
  });

  res.setHeader("Content-Type", "text/csv");
  res.setHeader("Content-Disposition", 'attachment; filename="data.csv"');
  res.status(200).send(csvString);
}
