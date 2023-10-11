import React from "react";
import { Description } from "@mui/icons-material";
import { Box, Container, Divider } from "@mui/material";
import Image from "next/legacy/image";

export default function UserGuide() {
  return (
    <Container>
      <Box sx={{ marginTop: 12, justifyContent: "center" }}>
        <h2>
          <a name="usage_of_the_application" class="anchor">
            User Guide
          </a>
        </h2>

        <p>
          The Platform is organized in page format. Each main page is selected
          by clicking on one of the tabs at the top of the screen. The main
          data-related pages corresponding to the tabs are;
        </p>

        <ul>
          <li>Browse Plant and Fruit Data</li>
          <li>Multiple-entry Key to the Plants</li>
          <li>Browse Insects Reared from Fruits</li>
          <li>Phylogeny of Plants and Insects</li>
        </ul>
        {/* <p>{projectDescription}</p> */}
        <h3>
          <a name="browse_plant_and_fruit_data" class="anchor">
            Browsing Plant and Fruit Data
          </a>
        </h3>

        <p>
          When using the "Plant and Fruit Data” page, individual plant species
          are generated by clicking on that species’ name. A plant data page
          contains a photo, morphology, description of the plant, expandable
          photographs, and a map showing the geographical distribution of the
          plant, as well as its fruiting phenology, the latter determined
          empirically during this project. A list of insects reared from the
          fruit is also provided.
        </p>
        <Image
          src="/img/screen01.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />
        {/* <Image src="img/screen01.jpg" width="800" height="559" /> */}

        <p class="caption">
          Species page for <em>Drypetes gerrardii</em>.
        </p>

        <h3>
          <a name="multiple-entry-key-to-the-plants" class="anchor">
            Multiple-entry Key to the Plants
          </a>
        </h3>

        <p>
          Users select one or more values for each of several character states
          (e.g. fruit color, leaf type, etc.) by clicking on the appropriate
          entries. All selections within a character box are “or”, not “and”,
          selections, making the key inclusive, not exclusive. Say, for example,
          you have made a collection from a single plant species with compound
          leaves that are trifoliolate (three leaflets per leaf), and whose
          fruits include both red and yellow ones. You would select both colors
          in the Fruit color box. If the fruit from your plant is described in
          the literature as being yellow only, selecting red in addition to
          yellow will not eliminate the correct plant from the list generated by
          your query, because you have included yellow. Additionally, clicking
          on trifoliolate in the leaf type box will not exclude the correct
          plant from the results even if it is described in the literature as
          having 3 or 5 leaflets. Submitting a query will return a list of one
          or more plant names. Selecting a plant name from the list brings up
          the data page for that species.
        </p>
        <Image
          src="/img/screen02a.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">
          Example of character-state selections using the multiple-entry key.
        </p>
        <Image
          src="/img/screen02b.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">Results page generated by the query.</p>

        <p>
          It is not necessary to select a value for each character state. While
          not selecting a value for one or more character states diminishes the
          strength of your search, you may very well have entered enough values
          for other characters to identify your plant or to narrow the
          possibilities considerably. For example, you may not know whether your
          plant contains latex. Just leave out that character state.
        </p>

        <p>
          In the key, we have tried to keep technical terms to a minimum to
          enable non-specialists to use the key. Thus, for example, when
          examining the leaf or leaflet edge or margin, the term “with sharp or
          rounded teeth” includes margins more technically described as
          “dentate”, “serrate” or “crenate”. Many terms in the key are
          represented in the illustrated glossaries. Double-clicking on a term
          will call up the definition and one or more images illustrating it. In
          putting together the glossary we relied on several sources,
          particularly The Cambridge Illustrated Glossary of Botanical Terms
          (Hickey &amp; King 2000).
        </p>

        <h3>
          <a name="browse-insects-reared-from-fruits" class="anchor">
            Browsing Insects Reared from Fruits
          </a>
        </h3>

        <p>
          When using the “Browse Insects Reared from Fruit” page, selecting an
          insect species generates a page with information on that species,
          including a list of fruit species from which that insect was reared.
          Clicking on any fruit species in the list will generate the data page
          for that plant. To return to where you were on the “Browse Insects
          Reared from Fruit” page, simply click on “Browse Insects Reared from
          Fruit” on the tab panel at the top of the page.
        </p>
        <Image
          src="/img/screen03a.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">
          Browse Insects page with <em>Ceratitis</em> fruit flies selected.
        </p>
        <Image
          src="/img/screen03b.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">
          Page with list of <em>Ceratitis</em> species, and information and
          image for the default species (the first in the alphabetically sorted
          list).
        </p>
        <h3>
          <a name="phylogeny" class="anchor">
            Phylogeny Based On Molecular Barcodes
          </a>
        </h3>

        <p>
          In The "Phylogeny" page the phylogentics ree for the plant and insects
          are shown based on their families. are determined by their barcodes.
          The labels for the endpoints (terminal taxa) include the species name,
          followed by the species ID sourced from the local database, and
          subsequently the NCBI accession. The barcodes used to construct the
          phylogeny were maturase K for plants and Cytochrome oxidase sub-unit I
          (COI) for insects. Clicking on each species name provides users with
          options to access external databases or locally linked morphological
          information.
        </p>
        <Image
          src="/img/screen07.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">
          Phylogeny page for Phyllanthaceae plant family. The phylogeny tree
          shows that certain species display no genetic divergence based on
          their barcodes, as seen in Margaritaria discoidea.Flueggea virosa
          exhibits genetic variance among its species, potentially attributed to
          geographical differences<em></em>.
        </p>
        <h3>Illustrated glossaries of plant terms</h3>

        <p>
          An illustrated glossary of botanical terms can be used as a primary
          teaching tool, or referred to when using the multiple-entry key to the
          plants to call up definitions and images of plant structures and
          features. Double-clicking on a term in the key will bring up its
          definition in the glossary. Photographic images illustrating a term
          are accessed by clicking on the “images” button to the right of each
          definition. Some self-evident terms are not illustrated. A general,
          alphabetically arranged glossary is available as are category-related
          glossaries (e.g. terms related to leaf margin characteristics, fruit
          shapes, etc.).
        </p>
        <Image
          src="/img/screen04b.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">The alphabetically-ordered Glossary page.</p>
        <Image
          src="/img/screen04c.jpg"
          alt="No Image"
          width={1200}
          height={800}
        />

        <p class="caption">
          The same glossary page with "Subglobose (fruit shape)" selected.
        </p>
        <br />
      </Box>
      {/* <Divider /> */}
    </Container>
  );
}
