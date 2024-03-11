import React from "react";
import { Description } from "@mui/icons-material";
import { Box, Container, Divider } from "@mui/material";

export default function AboutUs() {
  const general_introduction = `
This platform enable users to examine the data of the wild fruits of
 Kenya and their associated insect fauna, specifically those that use
 fruits in their breeding cycles. Although the primary focus of our study was on fruits as larval
 habitats of fruit flies (Tephritidae), particularly those of economic
 importance, many other insects exploit fruits. And while there is a
 large body of information on the associations of insects with the
 leafy and woody parts of plants, there is little data available on the
 guild of insects exploiting fruits, either as pulp or seed feeders, or
 as parasitoids of species from these two groups. This is especially
 true for Africa. In addition to tephritids, by including in the
 platform records of the many other insect groups feeding within fruits
 we hoped to provide the baseline information necessary for a fuller
 appreciation of the possibilities available for studying insect-fruit
 interactions.
 `;

  const keyFeatures = [
    {
      title: "Browsing Plants and Fruits Data",
      description:
        "Easily browse through a collection of wild plants and their fruits. Each entry provides detailed descriptions, taxonomic information, habitat preferences, and other relevant data, allowing users to explore the diversity of plant life. Whether you are a scientist, a nature lover, or simply curious about the wonders of the natural world, Wild Plants, Fruits, and Host Insects BioCollections has something to offer for everyone.",
    },
    {
      title: "Browsing Insects Data",
      description:
        "Discover a wide range of host insects and their associations with specific plant species. Explore insect characteristics, behaviors, and their ecological significance in the context of the plant kingdom.",
    },
    {
      title: "Phylogeny",
      description:
        "Uncover the evolutionary relationships between different plant families and their respective host insects through interactive phylogenetic trees. The molecular barcode data used for phylogeny tree construction is sourced from external databases.",
    },
    {
      title: "Multiple Entry Key Search",
      description:
        "Our advanced search functionality empowers users to find specific plant species based on unique features. Whether it's leaf shape, flower color, or growth habit, users can use key characteristics to identify plants that match their criteria.",
    },
    {
      title: "Glossary",
      description:
        "To enhance the user experience and understanding of the complex terminologies used in describing plants, we have implemented a glossary functionality. Here you can find descriptions and explanations of the key terms used throughout the platform. Simply click on the underlined terms to access their definitions.",
    },
  ];

  return (
    <Container>
      <Box sx={{ marginTop: 12, justifyContent: "center" }}>
        <h2>Introduction</h2>

        <p>{general_introduction}</p>
        <h2>Scope of the Database</h2>

        <p>
          The plant database contains approximately 873 plant types, primarily
          species. The majority of these species are indigenous to Kenya, but
          the database also includes certain non-native, species like guava and
          cultivated species like mango. During the early stages of the project,
          the collection were focused on plants likely to attract frugivorous
          tephritids, which skewed the sampling towards fruits with fleshy pulp.
          Notably, some significant plant taxa, including many from the
          Asteraceae, Burseraceae, and Fabaceae families, have fewer species
          with fleshy fruits and were sampled less frequently. Furthermore, the
          study concentration was primarily on woody plants, as they typically
          produce a greater abundance of fruits compared to herbaceous plants.
          While our coverage of woody plants wasn't exhaustive, it was
          substantial, encompassing approximately 40% of all species and a
          significantly higher percentage of those with fleshy fruits. This
          coverage aligns closely with the information found in "Kenya Trees
          Shrubs and Lianas" (Beentje 1994), a comprehensive guide for
          identifying woody plants in Kenya. We also extensively sampled certain
          other plant groups, such as the herbaceous Cucurbitaceae and Vitaceae,
          as well as the parasitic Loranthaceae (mistletoes). Additionally, we
          included representatives from specific plant families, like Asteraceae
          and Acanthaceae, which are consumed by different fruit fly groups,
          some of which feed on flower parts while others consume both flowers
          and fruits.
        </p>

        <h2>Key Features of the Platform</h2>

        <ol>
          <li>
            <u>Plants and fruits with insects</u> Users can choose specific
            species to get information about their descriptions, taxonomic and
            geographic features, fruit and plant images, insect taxa reared from
            the fruit, and insect images where possible. The plant names and
            authors largely match those found in The African Flowering Plant
            Database. (http://www.ville-ge.ch/cjb/bd/africa/index.php).
          </li>
          <li>
            <u>An advanced plant search</u>, based on characters of both the
            fruit and associated leafy specimen, will enable users to identify
            fruiting woody and herbaceous plants.
          </li>
          <li>
            <u>Insects reared from collected fruits may also be browsed</u>.
            Insects are categorized by order (Diptera, Lepidoptera, Coleoptera,
            and Hymenoptera). Choosing an insect family name (or genus name for
            Tephritidae and subfamily name for ichneumonoid wasps) within an
            order generates a list of insect species. Clicking on a specific
            species lists the plant species from which the insect was reared.
            Images of the selected insect species, as available, are displayed.
            The geographic locations where we collected fruits producing the
            insect species are also mentioned.
          </li>
          <li>
            <u>Phylogeny of Plants and Insects</u>. In this feature, users can
            explore the phylogeny of insects and plants based on their barcodes.
            The phylogeny is organized by family. The phylogeny tree displayed
            is based on maturase K (matK) for plants and Cytochrome Oxidase
            subunit I (COI) for insects. These barcodes were retrieved from
            Barcode of Life Systems Database (BOLD) systems. Upon clicking the
            species, users can navigate to the morhology page of the species, or
            navigate to external molecular databases for the selected species
          </li>
          <li>
            An <u>illustrated glossary of botanical</u> This page can can be
            referenced when using the advanced plant serach page to access
            definitions and images of plant structures and features. Double
            Clicking on a term related fruit type, fruit shape, leaf type, leaf
            shape and leaf arrangement with their definitions in the glossary.
            Photographs related to the terms can be viewed by clicking the
            "images" button next to each definition. Some obvious terms do not
            have illustrations. A comprehensive glossary is accessible in
            alphabetical order, along with category-specific glossaries (e.g.,
            terms related to leaf margin characteristics, fruit shapes, etc.).
            <u>Advanced plant search</u> to call up definitions and images of
            plant structures and features. Double-clicking on a some of the
            complex terms (fruit shape, fruit type) in the key will bring up its
            definition in the glossary. Photographic images illustrating a term
            are accessed by clicking on the “images” button to the right of each
            definition. Some self-evident terms are not illustrated. A general,
            alphabetically arranged glossary is available as are
            category-related glossaries (e.g. terms related to leaf margin
            characteristics, fruit shapes, etc.).
          </li>
        </ol>
      </Box>
      {/* <Divider /> */}
    </Container>
  );
}
