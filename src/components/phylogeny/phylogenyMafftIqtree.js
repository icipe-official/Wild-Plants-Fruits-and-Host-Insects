import useSWR, { mutate } from "swr";
import { useEffect, useState } from "react";
import TephritidaeNewick from "./tephritidae";
import { useRef } from "react";
import Tooltip from "@mui/material/Tooltip";

// import useMediaQuery from "@mui/material";
import {
  Box,
  Button,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  useMediaQuery,
} from "@mui/material";
import { useRouter } from "next/router";
import { Container } from "@mui/material";
import SequenceDownload from "./download";
import NewickDownload from "./downloadnewick";
import { TreeView, TreeItem } from "@mui/lab";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
import ConverttoFasta from "./inputsequence";
import { makeStyles } from "@mui/styles";
import { kMaxLength } from "buffer";
// export default function Newick() {
import FastaToDict from "./inputsequence";
import { Download } from "@mui/icons-material";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

// const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PhylogenyMafft() {
  const classes = useStyles();
  const [selectedOrganism, setSelectedOrganism] = useState("plants");
  // const base_url = "http://localhost:3000";
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("md"));

  // const fetcher = (url) => fetch(url).then((r) => r.json());
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const fetcher = async (url) => {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  };

  // When the selected organism changes, clear the previous data
  // Event handler for updating the selected organism
  const handleOrganismChange = (event) => {
    setSelectedOrganism(event.target.value);
    // if (event.target.value == "plants") {
    //   setSelectedFamily("Vitaceae");
    //   setNewickData(
    //     "(Ampelocissus_africana_32_Mozambique1_null:0.0052553240,(Cissus_integrifolia_162_Mozambique1_null:0.0132453949,(Cissus_quadrangularis_165_Mozambique1_null:0.0147338409,Cissus_rotundifolia_166_Mozambique1_null:0.0034097278):0.0299088729):0.0143999760,((Cissus_integrifolia_162_Mozambique2_JX517840:0.0134818729,(Cissus_rotundifolia_166_Kenya2_KR734442:0.0000010000,Cissus_rotundifolia_166_Kenya3_KR734438:0.0000010000):0.0375850749):0.0075449127,(((Cyphostemma_cyphopetalum_244_Kenya1_KR734863:0.0000010000,((Cyphostemma_cyphopetalum_244_Kenya2_KR735040:0.0000010000,Cyphostemma_cyphopetalum_244_Kenya3_KR734634:0.0000010000):0.0000010000,Cyphostemma_cyphopetalum_244_Kenya4_KR734418:0.0000010000):0.0000010000):0.0057315869,(((Cyphostemma_serpens_251_Kenya1_KR734797:0.0000010000,Cyphostemma_serpens_251_Kenya4_KR734760:0.0000010000):0.0000010000,Cyphostemma_serpens_251_Kenya3_KR734594:0.0000010000):0.0000027692,Cyphostemma_serpens_251_Kenya2_KR734930:0.0000010000):0.0040904962):0.0304552143,((Rhoicissus_revoilii_670_South-Africa1_JF270915:0.0000010000,Rhoicissus_revoilii_670_Mozambique2_JX517321:0.0000010000):0.0000010000,Rhoicissus_tridentata_671_South-Africa1_JF270917:0.0013104152):0.0123125789):0.0055262866):1.1594228367);"
    //   );
    // } else {
    //   if (event.target.value == "insects") {
    //     setSelectedFamily("Braconidae");
    //     setNewickData(
    //       "(Ampelocissus_africana_32_Mozambique1_null:0.0052553240,(Cissus_integrifolia_162_Mozambique1_null:0.0132453949,(Cissus_quadrangularis_165_Mozambique1_null:0.0147338409,Cissus_rotundifolia_166_Mozambique1_null:0.0034097278):0.0299088729):0.0143999760,((Cissus_integrifolia_162_Mozambique2_JX517840:0.0134818729,(Cissus_rotundifolia_166_Kenya2_KR734442:0.0000010000,Cissus_rotundifolia_166_Kenya3_KR734438:0.0000010000):0.0375850749):0.0075449127,(((Cyphostemma_cyphopetalum_244_Kenya1_KR734863:0.0000010000,((Cyphostemma_cyphopetalum_244_Kenya2_KR735040:0.0000010000,Cyphostemma_cyphopetalum_244_Kenya3_KR734634:0.0000010000):0.0000010000,Cyphostemma_cyphopetalum_244_Kenya4_KR734418:0.0000010000):0.0000010000):0.0057315869,(((Cyphostemma_serpens_251_Kenya1_KR734797:0.0000010000,Cyphostemma_serpens_251_Kenya4_KR734760:0.0000010000):0.0000010000,Cyphostemma_serpens_251_Kenya3_KR734594:0.0000010000):0.0000027692,Cyphostemma_serpens_251_Kenya2_KR734930:0.0000010000):0.0040904962):0.0304552143,((Rhoicissus_revoilii_670_South-Africa1_JF270915:0.0000010000,Rhoicissus_revoilii_670_Mozambique2_JX517321:0.0000010000):0.0000010000,Rhoicissus_tridentata_671_South-Africa1_JF270917:0.0013104152):0.0123125789):0.0055262866):1.1594228367);"
    //     );
    //   }
    // }
    // const newOrganism = event.target.value;
    // Clear the previous data and refetch based on selecetd organism and change api to that of selected organism
    //use the same name for api end points to
    mutate(`${base_url}/api/plants/species`, null, false);
    mutate(`${base_url}/api/insects/species`, null, false);
    // Update the selected organism

    handleChange(event);
  };
  // Create the URL based on the selected organism
  const url = `${base_url}/api/${selectedOrganism}/species`;

  const { data, error, isLoading } = useSWR(url, fetcher);
  // console.log(data);

  // const router = useRouter();
  // const [newickData, setNewickData] = useState("");

  // "((A:0.1,B:0.2)80:0.3,(C:0.4,D:0.5)95:0.6)90;"
  //check if router has plantFamily
  const router = useRouter();

  // const [selectedFamily, setSelectedFamily] = useState(
  //   router.query.plantFamily ? router.query.plantFamily : "Vitaceae"
  // );
  const [selectedFamily, setSelectedFamily] = useState(
    selectedOrganism === "insects" && !router.query.insectFamily
      ? "Braconidae"
      : selectedOrganism === "plants" && router.query.plantFamily
      ? router.query.plantFamily
      : "Rubiaceae"
  );
  console.log("selectedFamily");

  console.log(selectedFamily);
  const nosequences = [
    "Achariaceae",
    "Amaranthaceae",
    "Amaryllidaceae",
    "Araceae",
    "Araliaceae",
    "Aristolochiaceae",
    "Calophyllaceae",
    "Chrysobalanaceae",
    "Clusiaceae",
    "Combretaceae",
  ];
  const seqlist = [
    "Achariaceae",
    "Amaranthaceae",
    "Amaryllidaceae",
    "Araceae",
    "Araliaceae",
    "Aristolochiaceae",
    "Calophyllaceae",
    "Chrysobalanaceae",
    "Clusiaceae",
    "Combretaceae",
    "Combretaceae",
    "Gelsemiaceae",
    "Putranjivaceae",
    "Rhizophoraceae",
    "Cornaceae",
    "Gentianaceae",
    "Icacinaceae",
    "Erythroxylaceae",
    "Aristolochiaceae",
    "Araliaceae",
    "Amaryllidaceae",
    "Stilbaceae",
    "Calophyllaceae",
    "Violaceae",
    "Portulacaceae",
    "Taccaceae",
    "Lecythidaceae",
    "Sterculiaceae",
    "Chrysobalanaceae",
    "Achariaceae",
    "Amaranthaceae",
    "Peraceae",
    "Santalaceae",
    "Orobanchaceae",
    "Opiliaceae",
    "Proteaceae",
    "Clusiaceae",
    "Araceae",
    "Hernandiaceae",
    "Monimiaceae",
    "Passifloraceae",
  ];

  // Now you can use the 'plantFamilyNames' constant list in your JavaScript code.
  const teph = TephritidaeNewick();
  console.log("teph");
  console.log(teph.props.children);
  console.log("selectedFamily on change event");

  const [newickData, setNewickData] = useState(
    selectedFamily == "Rubiaceae" && !router.query.plantFamily
      ? "(Calycosiphonia_spathicalyx_102_Cameroon1_KC627799_TCAFR372-10:0.0000009297,(Calycosiphonia_spathicalyx_102_Cameroon1_KC627420_TCAFR373-10:0.0000009297,(((((((Catunaregam_obovata_132_South-Africa1_JX517479_SAFH2404-11:0.0090347753,Rothmannia_manganjae_689_South-Africa1_JX517759_SAFH336-10:0.0039416080):0.0012635996,((Rothmannia_fischeri_688_South-Africa1_JF270919_KNPA1317-09:0.0000009297,Rothmannia_fischeri_688_South-Africa1_null_KNPA141-08:0.0000009297):0.0000009297,Rothmannia_fischeri_688_South-Africa1_JX518115_KNPA974-09:0.0000009297):0.0025900262):0.0000009297,((((Gardenia_ternifolia_356_Mozambique1_JX517388_TSA138-10:0.0000000000,Gardenia_volkensii_357_South-Africa1_JF270793_KNPA821-09:0.0000000000):0.0000009297,Gardenia_volkensii_357_South-Africa1_JX518233_KNPA1093-09:0.0000009297):0.0000009297,((((Gardenia_volkensii_357_Kenya1_MK290523_UHURU1674-17:0.0000000000,Gardenia_volkensii_357_Kenya1_MK290525_UHURU1676-17:0.0000000000):0.0000000000,Gardenia_volkensii_357_Kenya1_MK290526_UHURU1677-17:0.0000000000):0.0000000000,Coptosperma_graveolens_800_Kenya1_MK290531_UHURU1685-17:0.0000000000):0.0000009297,Gardenia_volkensii_357_Kenya1_MK290524_UHURU1675-17:0.0000009297):0.0000009297):0.0064474984,(Oxyanthus_pyriformis_571_South-Africa1_JX517942_SAFH342-10:0.0012900727,Oxyanthus_speciosus_572_South-Africa1_JX517484_SAFH1706-11:0.0000009297):0.0131662131):0.0000009297):0.0000009297,((Coptosperma_graveolens_800_Kenya1_MK290530_UHURU1684-17:0.0025978602,Coptosperma_supra-axillare_802_South-Africa1_JX517476_SAFH945-10:0.0051634358):0.0012685646,Tarenna_pavettoides_801_South-Africa1_JX517414_SAFH1700-11:0.0053266710):0.0065706609):0.0012158242,(((((Craterispermum_schweinfurthii_208_Mozambique1_JX517952_SAFH1575-11:0.0086836698,Psychotria_capensis_634_South-Africa1_JX517469_KNPA138-08:0.0452309006):0.0721418343,(((Crossopteryx_febrifuga_214_Mozambique1_null_PNG524-18:0.0512399448,Vangueria_infausta_843_Mozambique1_null_PNG296-18:0.0000014035):1.4162368633,Guettarda_speciosa_386_South-Africa1_JX517544_SAFH684-10:0.0000016538):0.0243555346,(Hymenodictyon_parvifolium_416_South-Africa1_JF270827_KNPA156-08:0.0000009297,Hymenodictyon_parvifolium_416_South-Africa1_JX517708_KNPA864-09:0.0066768472):0.0229430367):0.0151356272):0.0153806991,(Heinsia_crinita_398_South-Africa1_JF270815_KNPA154-08:0.0039955774,(Heinsia_crinita_398_Cameroon1_KC627834_TCAFR569-10:0.0000014960,Heinsia_crinita_398_Cameroon1_KC627522_TCAFR570-10:0.0000009297):0.0012870780):0.0220482982):0.0145510161,(Keetia_gueinzii_444_South-Africa1_JX518184_SAFH383-10:0.0096582629,((((Vangueria_infausta_843_South-Africa1_JF270985_KNPA1246-09:0.0000009297,Vangueria_infausta_843_Mozambique1_JX517485_TSA234-10:0.0000009297):0.0000009297,Vangueria_infausta_843_South-Africa1_null_KNPA488-09:0.0013106003):0.0000009297,(Vangueria_madagascariensis_844_Kenya1_MK285023_UHURU1504-15:0.0000009297,Vangueria_madagascariensis_844_Kenya1_MK290482_UHURU1505-15:0.0000009297):0.0013486622):0.0009053217,Vangueria_madagascariensis_844_South-Africa1_JF270986_KNPA1141-09:0.0019069597):0.0123705920):0.0221248546):0.0011335788,((Crossopteryx_febrifuga_214_South-Africa1_JF270725_KNPA1067-09:0.0000009297,Crossopteryx_febrifuga_214_Mozambique1_JX517365_TSA129-10:0.0000009297):0.0000009297,Crossopteryx_febrifuga_214_South-Africa1_null_KNPA346-09:0.0000009297):0.0180155799):0.0096581902):0.0026500591,Coffea_arabica_180_United-States1_OL689937_GRDMO111-21:0.0052177811):0.0012151155,Tricalysia_pallens_822_Gabon1_KC627487_TCAFR159-10:0.0039608086):0.0066287185):0.0000009297,Calycosiphonia_spathicalyx_102_Cameroon1_KC627495_TCAFR374-10:0.0000009297);"
      : ""
  );
  const [kmer, setkmer] = useState(9);
  const [filteredFamily, setfilteredFamily] = useState("Acanthaceae");
  const [selecteorder, setSelectedOrder] = useState("Braconidae");
  const [filteredOrder, setFilteredOrder] = useState("Braconidae");
  const [download, setDownload] = useState([]);

  //handle input sequences
  const [fastaInput, setFastaInput] = useState("");
  const [fastaArray, setFastaArray] = useState([]);
  const [newickInput, setNewickInput] = useState("");

  //control drop down tree for download
  const [selectedNode, setSelectedNode] = useState(null);

  //handle user added sequences
  const [userSequences, setUserSequences] = useState(false);

  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  //change view if small screen variable
  const iframeRef = useRef(null);
  useEffect(() => {
    if (newickData && iframeRef.current) {
      // Wait for the iframe to load
      iframeRef.current.addEventListener("load", () => {
        // Send data to the iframe
        iframeRef.current.contentWindow.postMessage({ newickData }, "*");
      });
    }
  }, [newickData]);
  // //handle new data
  // useEffect(() => {
  //   if (data) {
  //     // console.log("selectedFamily changed to:", selectedFamily);
  //     handleChange();
  //   }
  // }, [selectedFamily]);

  function handleChange(event) {
    if (event) {
      if (
        selectedOrganism === "insects" &&
        event.target.value === "Tephritidae"
      ) {
        setNewickData("");
        setSelectedOrder("Tephritidae");
        setNewickData(teph.props.children);
        console.log("selectedFamily on cahnge event1");
        console.log(event.target.value);
      }
      // if (selectedOrganism === "plants") {
      if (selectedOrganism === "plants") {
        if (event.target.value !== "Rubiaceae") {
          // setNewickData(
          //   "(Calycosiphonia_spathicalyx_102_Cameroon_:0.0065146261,((((Catunaregam_obovata_132_South-Africa_:0.0089283989,Rothmannia_manganjae_689_South-Africa_:0.0038783416):0.0012580537,(((Gardenia_ternifolia_356_Mozambique_:0.0000010000,Gardenia_volkensii_357_South-Africa_:0.0000010000):0.0000010000,(Gardenia_volkensii_357_Kenya_:0.0000010000,Coptosperma_graveolens_800_Kenya_:0.0000010000):0.0000010000):0.0063431604,(((Oxyanthus_pyriformis_571_South-Africa_:0.0012783140,Oxyanthus_speciosus_572_South-Africa_:0.0000010000):0.0129967622,(Tarenna_pavettoides_801_South-Africa_:0.0062060557,Coptosperma_supra-axillare_802_South-Africa_:0.0057373486):0.0062072372):0.0000010000,Rothmannia_fischeri_688_South-Africa_:0.0025722173):0.0000010000):0.0000010000):0.0012115393,(((((Craterispermum_schweinfurthii_208_Mozambique_:0.0077669857,Psychotria_capensis_634_South-Africa_:0.0458549100):0.0721375332,(Guettarda_speciosa_386_South-Africa_:0.0235601231,Hymenodictyon_parvifolium_416_South-Africa_:0.0304942729):0.0145171868):0.0152760505,(Heinsia_crinita_398_South-Africa_:0.0043509979,Heinsia_crinita_398_Cameroon_:0.0000010000):0.0206267766):0.0135388278,(Keetia_gueinzii_444_South-Africa_:0.0096219113,((Vangueria_infausta_843_South-Africa_:0.0013020862,(Vangueria_infausta_843_Mozambique_:0.0000010000,Vangueria_madagascariensis_844_Kenya_:0.0013470757):0.0000010000):0.0009155633,Vangueria_madagascariensis_844_South-Africa_:0.0018851766):0.0122956721):0.0217888126):0.0013308961,(Crossopteryx_febrifuga_214_South-Africa_:0.0000010000,Crossopteryx_febrifuga_214_Mozambique_:0.0000010000):0.0177373534):0.0095579059):0.0025909569,Coffea_arabica_180_United-States_:0.0051660120):0.0012292570,Tricalysia_pallens_822_Gabon_:0.0039115562);"
          // );
          setNewickData("");
          // console.log("kmer at handlechange");
          const selectedValue =
            (event.target && event.target.value) || "Select family";
          setSelectedFamily(selectedValue);
          const filteredData = data.filter(
            (dat) =>
              dat.plant_genera.plant_families.family_name === selectedValue
          );
          // setSelectedFamily(selectedValue);
          setfilteredFamily(filteredData);
          let counter = 1;
          const sequences = filteredData.reduce((result, obj) => {
            if (obj.plants_matk.length > 0) {
              obj.plants_matk.forEach((plant) => {
                if (
                  plant.nucleotide !== null &&
                  plant.nucleotide.length >= 400
                ) {
                  const name =
                    obj.plant_genera.genus_name +
                    "_" +
                    obj.species_name.split(" ")[0] +
                    "_" +
                    obj.id +
                    "_" +
                    plant.country.replace(/ /g, "-") +
                    // counter +
                    "_" +
                    plant?.genbank_accession +
                    "_" +
                    plant.bold_id;

                  const cleanedSequence = plant.nucleotide
                    .replace(/-/g, "")
                    .replace(/N/g, "");
                  // const name =
                  //   obj.plant_genera.genus_name +
                  //   "_" +
                  //   obj.species_name.split(" ")[0] +
                  //   "_" +
                  //   plant.country.replace(/ /g, "-") +
                  //   "_" +
                  //   counter;
                  // counter++;
                  result[name.replace(/\s/g, "")] = cleanedSequence
                    .replace(/-/g, "")
                    .replace(/N/g, "");
                }
              });
            }
            return result;
          }, {});
          setDownload(sequences);

          // console.log("plant sequences format");
          // console.log(sequences);
          // console.log("sequences on click family");
          // console.log(sequences);
          const requestBody = {
            sequences: sequences,
          };
          fetch(`${base_url}/api/phylogeny/phylogeny`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(requestBody),
          })
            .then((response) => {
              if (!response.ok) {
                throw new Error("Error: " + response.status);
              }
              return response.json();
            })
            .then((data) => {
              const newick = data.newick;
              setNewickData(newick);
              // console.log(data);
            })
            .catch((error) => {
              console.error(error);
            });
          console.log("newickData plantsss");

          console.log(newickData);
          // check length of sequences
          // Check if the total sequence count is less than three
          if (sequences.length < 3) {
            // Display a pop-up message
            alert("Total number of sequences is less than three!");

            // Redirect the user to the default page
            window.location.href = `${base_url}/phylogeny`;
          }
        } else {
          setSelectedOrder("Rubiaceae");
          setSelectedFamily("Rubiaceae");
          setNewickData(
            "(Calycosiphonia_spathicalyx_102_Cameroon1_KC627799_TCAFR372-10:0.0000009297,(Calycosiphonia_spathicalyx_102_Cameroon1_KC627420_TCAFR373-10:0.0000009297,(((((((Catunaregam_obovata_132_South-Africa1_JX517479_SAFH2404-11:0.0090347753,Rothmannia_manganjae_689_South-Africa1_JX517759_SAFH336-10:0.0039416080):0.0012635996,((Rothmannia_fischeri_688_South-Africa1_JF270919_KNPA1317-09:0.0000009297,Rothmannia_fischeri_688_South-Africa1_null_KNPA141-08:0.0000009297):0.0000009297,Rothmannia_fischeri_688_South-Africa1_JX518115_KNPA974-09:0.0000009297):0.0025900262):0.0000009297,((((Gardenia_ternifolia_356_Mozambique1_JX517388_TSA138-10:0.0000000000,Gardenia_volkensii_357_South-Africa1_JF270793_KNPA821-09:0.0000000000):0.0000009297,Gardenia_volkensii_357_South-Africa1_JX518233_KNPA1093-09:0.0000009297):0.0000009297,((((Gardenia_volkensii_357_Kenya1_MK290523_UHURU1674-17:0.0000000000,Gardenia_volkensii_357_Kenya1_MK290525_UHURU1676-17:0.0000000000):0.0000000000,Gardenia_volkensii_357_Kenya1_MK290526_UHURU1677-17:0.0000000000):0.0000000000,Coptosperma_graveolens_800_Kenya1_MK290531_UHURU1685-17:0.0000000000):0.0000009297,Gardenia_volkensii_357_Kenya1_MK290524_UHURU1675-17:0.0000009297):0.0000009297):0.0064474984,(Oxyanthus_pyriformis_571_South-Africa1_JX517942_SAFH342-10:0.0012900727,Oxyanthus_speciosus_572_South-Africa1_JX517484_SAFH1706-11:0.0000009297):0.0131662131):0.0000009297):0.0000009297,((Coptosperma_graveolens_800_Kenya1_MK290530_UHURU1684-17:0.0025978602,Coptosperma_supra-axillare_802_South-Africa1_JX517476_SAFH945-10:0.0051634358):0.0012685646,Tarenna_pavettoides_801_South-Africa1_JX517414_SAFH1700-11:0.0053266710):0.0065706609):0.0012158242,(((((Craterispermum_schweinfurthii_208_Mozambique1_JX517952_SAFH1575-11:0.0086836698,Psychotria_capensis_634_South-Africa1_JX517469_KNPA138-08:0.0452309006):0.0721418343,(((Crossopteryx_febrifuga_214_Mozambique1_null_PNG524-18:0.0512399448,Vangueria_infausta_843_Mozambique1_null_PNG296-18:0.0000014035):1.4162368633,Guettarda_speciosa_386_South-Africa1_JX517544_SAFH684-10:0.0000016538):0.0243555346,(Hymenodictyon_parvifolium_416_South-Africa1_JF270827_KNPA156-08:0.0000009297,Hymenodictyon_parvifolium_416_South-Africa1_JX517708_KNPA864-09:0.0066768472):0.0229430367):0.0151356272):0.0153806991,(Heinsia_crinita_398_South-Africa1_JF270815_KNPA154-08:0.0039955774,(Heinsia_crinita_398_Cameroon1_KC627834_TCAFR569-10:0.0000014960,Heinsia_crinita_398_Cameroon1_KC627522_TCAFR570-10:0.0000009297):0.0012870780):0.0220482982):0.0145510161,(Keetia_gueinzii_444_South-Africa1_JX518184_SAFH383-10:0.0096582629,((((Vangueria_infausta_843_South-Africa1_JF270985_KNPA1246-09:0.0000009297,Vangueria_infausta_843_Mozambique1_JX517485_TSA234-10:0.0000009297):0.0000009297,Vangueria_infausta_843_South-Africa1_null_KNPA488-09:0.0013106003):0.0000009297,(Vangueria_madagascariensis_844_Kenya1_MK285023_UHURU1504-15:0.0000009297,Vangueria_madagascariensis_844_Kenya1_MK290482_UHURU1505-15:0.0000009297):0.0013486622):0.0009053217,Vangueria_madagascariensis_844_South-Africa1_JF270986_KNPA1141-09:0.0019069597):0.0123705920):0.0221248546):0.0011335788,((Crossopteryx_febrifuga_214_South-Africa1_JF270725_KNPA1067-09:0.0000009297,Crossopteryx_febrifuga_214_Mozambique1_JX517365_TSA129-10:0.0000009297):0.0000009297,Crossopteryx_febrifuga_214_South-Africa1_null_KNPA346-09:0.0000009297):0.0180155799):0.0096581902):0.0026500591,Coffea_arabica_180_United-States1_OL689937_GRDMO111-21:0.0052177811):0.0012151155,Tricalysia_pallens_822_Gabon1_KC627487_TCAFR159-10:0.0039608086):0.0066287185):0.0000009297,Calycosiphonia_spathicalyx_102_Cameroon1_KC627495_TCAFR374-10:0.0000009297);"
          );
        }
      } else if (
        selectedOrganism === "insects" &&
        event.target.value === "Tephritidae"
      ) {
        setNewickData("");
        console.log("teph on clicking tephritidae");

        console.log(teph);
        setSelectedOrder("Tephritidae");
        setNewickData(teph.props.children);
      } else if (
        selectedOrganism === "insects" &&
        event.target.value !== "Tephritidae"
      ) {
        setNewickData("");
        // console.log("insect kmer at handlechange");
        const selectedValue =
          (event.target && event.target.value) || "Select family";
        setSelectedOrder(selectedValue);
        // setSelectedFamily(se);
        const filteredData = data?.filter(
          (dat) => dat.insect_families.family_name === selectedValue
        );
        setSelectedOrder(selectedValue);
        // setFilteredOrder(filteredData);
        // console.log("insect filteredData");
        const sequences = filteredData.reduce((result, obj) => {
          let counter = 1;
          if (obj.insects_coi.length > 0) {
            obj.insects_coi.forEach((insect) => {
              if (
                insect.nucleotide !== null &&
                insect.nucleotide.length >= 400
              ) {
                const name =
                  obj.insect_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  obj.id +
                  "_" +
                  obj.insect_genera.id +
                  "_" +
                  insect.country?.replace(/ /g, "") +
                  counter +
                  "_" +
                  (insect.genbank_accession || "") +
                  "_" +
                  (insect.bold_id || "");
                result[name.replace(/\s/g, "")] = insect.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");
                // counter++;
              }
            });
          }
          return result;
        }, {});
        setDownload(sequences);

        const requestBody = {
          sequences: sequences,
        };
        fetch(`${base_url}/api/phylogeny/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      }
    } else {
      //if not event
      if (selectedOrganism === "plants") {
        console.log("Rubiaceae");
        setSelectedOrder("Rubiaceae");
        // setNewickData()

        // setNewickData("");

        const filteredData = data.filter(
          (dat) =>
            dat.plant_genera.plant_families.family_name === selectedFamily
        );
        // console.log("filteredData");
        const sequences = filteredData.reduce((result, obj) => {
          let counter = 1;
          if (obj.plants_matk.length > 0 && plant.nucleotide.length >= 400) {
            obj.plants_matk.forEach((plant) => {
              if (plant.nucleotide !== null) {
                const name =
                  obj.plant_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  obj.id +
                  "_" +
                  plant.country.replace(/ /g, "-") +
                  counter +
                  "_" +
                  plant?.genbank_accession +
                  "_" +
                  plant?.bold_id;

                const cleanedSequence = plant.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");
                result[name.replace(/\s/g, "")] = cleanedSequence
                  .replace(/-/g, "")
                  .replace(/N/g, "");
              }
            });
          }
          return result;
        }, {});
        setDownload(sequences);

        // console.log("plant sequences format");
        // console.log(sequences);
        // console.log("plant sequences format");
        // console.log(sequences);
        const requestBody = {
          sequences: sequences,
        };
        fetch(`${base_url}/api/phylogeny/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      } else if (selectedOrganism === "insects") {
        setSelectedOrder("Brocanidae");
        setSelectedFamily("Brocanidae");

        setNewickData("");
        // console.log("insect selecteorder");
        const filteredData = data.filter(
          (dat) => dat.insect_families.family_name === selecteorder
        );
        // console.log("insect filteredData on selecting insect order");
        const sequences = filteredData.reduce((result, obj) => {
          let counter = 1;
          if (obj.insects_coi.length > 0) {
            obj.insects_coi.forEach((insect) => {
              //filter sequences whose length is less than 658
              if (
                insect.nucleotide !== null &&
                insect.nucleotide.length >= 400
              ) {
                const name =
                  obj.insect_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  obj.id +
                  "_" +
                  obj.insect_genera.id +
                  "_" +
                  insect.country?.replace(/ /g, "") +
                  counter +
                  "_" +
                  (insect.genbank_accession || "") +
                  "_" +
                  insect.bold_id;
                result[name.replace(/\s/g, "")] = insect.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");
                // counter++;
              }
            });
          }
          return result;
        }, {});
        setDownload(sequences);

        const requestBody = {
          sequences: sequences,
        };
        fetch(`${base_url}/api/phylogeny/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      }
    }
  }

  const handleChangekmer = (event) => {
    const newKmer = event.target.value;
    setkmer(newKmer);
    handleChange();
  };
  const handleSubmitfasta = (event) => {
    event.preventDefault();

    // setFastaInput(event.target.value);
    // handleSubmitfasta(event);
    handleInputChangefasta(event);
    // setFastaInput("");
  };
  //handle input fasta sequence
  const handleInputChangefasta = (event) => {
    setFastaInput(event.target.value);
    if (fastaInput) {
      // remove current family name
      setSelectedFamily("Select family");

      // console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
      const fastaLines = fastaInput.trim().split("\n");
      let currentSequenceName = "";
      let currentSequence = "";
      const fastaArray = [];
      for (let line of fastaLines) {
        if (line.startsWith(">")) {
          if (currentSequenceName !== "") {
            fastaArray.push({
              name: currentSequenceName
                .slice(1)
                .split(" ")
                .slice(0, 2)
                .join("-"),
              sequence: currentSequence,
            });
            currentSequence = "";
          }
          currentSequenceName = line;
        } else {
          currentSequence += line.trim();
        }
      }

      fastaArray.push({
        name: currentSequenceName.slice(1).split(" ").slice(0, 2).join("-"),
        sequence: currentSequence,
      });

      const fastaObject = {};
      for (let entry of fastaArray) {
        fastaObject[entry.name] = entry.sequence;
      }

      setFastaArray(fastaObject);
      // console.log("fastaArray");
      if (fastaArray) {
        // if (fastaArray.length > 50 || fastaInput.length > 2000) {
        //   alert(
        //     "Warning: Limit exceeded, Only less than 50  sequences  and  each less than 2000bp in length or below can be processed. Return to default phylogeny page"
        //   );
        //   setNewickData(
        //     "(Calycosiphonia_spathicalyx_102_Cameroon_:0.0065146261,((((Catunaregam_obovata_132_South-Africa_:0.0089283989,Rothmannia_manganjae_689_South-Africa_:0.0038783416):0.0012580537,(((Gardenia_ternifolia_356_Mozambique_:0.0000010000,Gardenia_volkensii_357_South-Africa_:0.0000010000):0.0000010000,(Gardenia_volkensii_357_Kenya_:0.0000010000,Coptosperma_graveolens_800_Kenya_:0.0000010000):0.0000010000):0.0063431604,(((Oxyanthus_pyriformis_571_South-Africa_:0.0012783140,Oxyanthus_speciosus_572_South-Africa_:0.0000010000):0.0129967622,(Tarenna_pavettoides_801_South-Africa_:0.0062060557,Coptosperma_supra-axillare_802_South-Africa_:0.0057373486):0.0062072372):0.0000010000,Rothmannia_fischeri_688_South-Africa_:0.0025722173):0.0000010000):0.0000010000):0.0012115393,(((((Craterispermum_schweinfurthii_208_Mozambique_:0.0077669857,Psychotria_capensis_634_South-Africa_:0.0458549100):0.0721375332,(Guettarda_speciosa_386_South-Africa_:0.0235601231,Hymenodictyon_parvifolium_416_South-Africa_:0.0304942729):0.0145171868):0.0152760505,(Heinsia_crinita_398_South-Africa_:0.0043509979,Heinsia_crinita_398_Cameroon_:0.0000010000):0.0206267766):0.0135388278,(Keetia_gueinzii_444_South-Africa_:0.0096219113,((Vangueria_infausta_843_South-Africa_:0.0013020862,(Vangueria_infausta_843_Mozambique_:0.0000010000,Vangueria_madagascariensis_844_Kenya_:0.0013470757):0.0000010000):0.0009155633,Vangueria_madagascariensis_844_South-Africa_:0.0018851766):0.0122956721):0.0217888126):0.0013308961,(Crossopteryx_febrifuga_214_South-Africa_:0.0000010000,Crossopteryx_febrifuga_214_Mozambique_:0.0000010000):0.0177373534):0.0095579059):0.0025909569,Coffea_arabica_180_United-States_:0.0051660120):0.0012292570,Tricalysia_pallens_822_Gabon_:0.0039115562);"
        //   );
        //   setSelectedFamily("Rubiaceae");
        //   return;
        // }
        setSelectedFamily("Select family");
        //retrieve the data from back end API
        // console.log("input  sequences format");
        // console.log(fastaArray);

        // var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);
        // console.log("plant newick from mafttttttttttt");
        const requestBody = {
          sequences: fastaObject,
        };

        fetch(`${base_url}/api/phylogeny/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
        // const newick = await Mafft(sequences);

        // console.log(newick);

        // console.log("plant newick");
        // setNewickData(newick);

        // console.log(fastaArray);
        // var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        // var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");
        setNewickData(newick);
        setDownload(newick);
        setFastaInput("");
      }
    } else {
      if (fastaArray && userSequences) {
        setSelectedFamily("Select family");

        // console.log(fastaArray);
        //add suser sequences to existing sequences
        var result = CalculateSimilarityMatrixModified(
          [...fastaArray, ...Download],
          kmer
        );
        // console.log("user plus existing sequences");
        // console.log("Download");

        // console.log(Download);
        // console.log("fastaArray");

        // console.log(fastaArray);

        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    }
    setSelectedFamily("");
  };

  //handle input of newick
  const handleInputChangenewick = (event) => {
    event.preventDefault();
    setNewickInput(event.target.value);

    // setSelectedFamily("Select family");
    setSelectedFamily("Select family");
    setSelectedOrder("Select order");

    // console.log("newick input");
    // console.log(newickInput);
    // console.log("newick input");
    setNewickData(newickInput);
    setDownload(newickInput);

    // delete newick input on sub
  };
  //handle input data
  const handleSubmitnewick = (event) => {
    event.preventDefault();
    // setNewickData(event.target.value);

    handleInputChangenewick(event);
    // delete newick input on submit
    setNewickInput("");
  };

  //handle uploding newick
  const handleSubmitFile = (event) => {
    setSelectedFamily("");

    event.preventDefault(); // Prevent form submission

    // Access the selected file from the file input element
    const selectedFile =
      event.target.querySelector('input[type="file"]').files[0];

    if (selectedFile) {
      const reader = new FileReader();

      // Set up the FileReader onload event handler
      reader.onload = (e) => {
        const fileContents = e.target.result;
        // Use the file contents as needed
        console.log("File contents:", fileContents);
        setNewickData(fileContents);
      };

      // Clear the file input value
      event.target.querySelector('input[type="file"]').value = "";

      // Read the file as text
      reader.readAsText(selectedFile);
    }
  };

  const handleSubmiFastatFile = (event) => {
    event.preventDefault(); // Prevent form submission

    // Access the selected file from the file input element
    const selectedFile =
      event.target.querySelector('input[type="file"]').files[0];

    if (selectedFile) {
      const reader = new FileReader();

      // Set up the FileReader onload event handler
      reader.onload = (e) => {
        const fileContents = e.target.result;
        // set inputfasta to file contents
        // console.log("File contents:", fileContents);
        // setFastaInput(fileContents);
      };

      // Clear the file input value
      // event.target.querySelector('input[type="file"]').value = "";

      // Read the file as text
      reader.readAsText(selectedFile);
      setSelectedFamily("Select family");

      // console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
      // event.preventDefault();
      const fastaLines = fastaInput.trim().split("\n");
      let currentSequenceName = "";
      let currentSequence = "";
      const fastaArray = [];
      for (let line of fastaLines) {
        if (line.startsWith(">")) {
          if (currentSequenceName !== "") {
            // console.log("currentSequenceName");

            // console.log(
            //   currentSequenceName.slice(1).split(" ").slice(0, 2).join("-")
            // );
            fastaArray.push({
              name: currentSequenceName
                .slice(1)
                .split(" ")
                .slice(0, 2)
                .join("-"),
              sequence: currentSequence,
            });
            currentSequence = "";
          }
          currentSequenceName = line;
        } else {
          currentSequence += line.trim();
        }
      }
      fastaArray.push({
        name: currentSequenceName.slice(1).split(" ").slice(0, 2).join("-"),
        sequence: currentSequence,
      });
      setFastaArray(fastaArray);
      // console.log("fastaArray");
      if (fastaArray) {
        setSelectedFamily("Select family");

        // console.log(fastaArray);
        var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    }
    setFastaInput("");
    setSelectedFamily("");
  };
  if (isLoading)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
        {/* Footer goes here */}
      </Container>
    );
  if (error)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Failed to load...</Box>
        {/* Footer goes here */}
      </Container>
    );
  //navigation to phylogeny
  const handleClick = () => {
    router.push("/phylogeny/plantsInsects");
  };

  //conditional rendering with data
  if (data) {
    // setIsLoadingData(false); // Set loading state to false

    if (selectedOrganism === "plants") {
      let families =
        //return only families wth atleas two matk sequences
        data?.filter(
          (species) =>
            species.plant_genera.plant_families.family_name &&
            species.plants_matk.length > 0
        );
      // obtain families only with matk sequences, get the set of the kmers, convert to list [...]
      var families_list = [
        ...new Set(
          families
            .map((family) => family.plant_genera.plant_families.family_name)
            .sort()
        ),
      ];
      //remove families with less than 2 sequences from the liest
      // Remove plant families that are in the 'plantFamilyNames' list
      var filtered_families_list = families_list.filter(
        (family) => !seqlist.includes(family)
      );

      // Convert set to array
      // console.log("familes");

      // console.log(families);
      var filteredData = data.filter(
        (dat) => dat.plant_genera.plant_families.family_name === selectedFamily
      );
    } else {
      //render insects phylogeny
      // console.log("insects");
      if (selectedOrganism === "insects") {
        var orders = new Set(
          data.map((species) => species.insect_families.family_name)
        );

        var insect_orders_list = [...orders]; // Convert set to array
        // console.log("orders");

        // console.log(orders);
        var insectFilteredData = data.filter(
          (dat) => dat.insect_orders.order_name == selecteorder
        );
        // console.log("insect filteredData");
        var insect_famililes = data.filter(
          (entry) =>
            entry.plants_insects.length > 0 &&
            entry.insect_orders.order_name === "Lepidoptera"
        );
        // console.log("plants_famililes");

        // console.log(filteredData);
      }
    }
    function generateUniqueIdentifier() {
      // Generate a UUID (v4)
      return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(
        /[xy]/g,
        function (c) {
          const r = (Math.random() * 16) | 0;
          const v = c === "x" ? r : (r & 0x3) | 0x8;
          return v.toString(16);
        }
      );
    }

    const uniqueIdentifier = generateUniqueIdentifier(); // Generate a unique identifier
    const iframeSrc = `/phylotree.html`;

    const handleIframeLoad = () => {
      const iframe = iframeRef.current;
      const iframeWindow = iframe.contentWindow;

      // Check if newickData is present
      if (newickData) {
        console.log("Sending newickData to iframe:", newickData);

        // Send a message to the iframe to load the data
        iframeWindow.postMessage(
          {
            type: "loadData",
            data: { newickData },
          },
          "*"
        ); // Replace '*' with the appropriate origin if needed
      } else {
        console.log("No newickData to send to iframe.");
      }
    };

    return (
      <Container sx={{ marginTop: 12 }}>
        {/* <ConverttoFasta></ConverttoFasta> */}
        <Box sx={{ display: isSmallScreen ? "row" : "flex" }}>
          <Box sx={{ display: "flex" }}>
            {/* <Box> */}
            <FormControl>
              <InputLabel>select organism</InputLabel>
              <Select value={selectedOrganism} onChange={handleOrganismChange}>
                <MenuItem value="plants">Plants</MenuItem>
                <MenuItem value="insects">Insects</MenuItem>
              </Select>
            </FormControl>
            {/* </Box> */}
            <Box sx={{ marginLeft: 2 }}>
              <FormControl fullWidth variant="outlined">
                <InputLabel>Select family</InputLabel>
                {/* <Select */}

                {
                  //   selectedOrganism === "plants"
                  //     ? selectedFamily
                  //     : selecteorder
                  // }
                  // onChange={(event) => handleChange(event)}
                  // label="Families"
                  // //   IconComponent={ArrowDropDown}
                  <Tooltip
                    title="Only plant or insect families with barcode data appear in the list. The scale shown on top of the phylogeny tree shows the number of substitutions per site per unit time"
                    arrow
                    enterDelay={500}
                    leaveDelay={200}
                  >
                    <Select
                      value={
                        selectedOrganism === "plants"
                          ? selectedFamily
                          : selectedOrder
                      }
                      onChange={(event) => handleChange(event)}
                      label="Families"
                    >
                      {selectedOrganism === "plants"
                        ? filtered_families_list.map((family, index) => (
                            <MenuItem key={index} value={family}>
                              {family}
                            </MenuItem>
                          ))
                        : insect_orders_list.map((order, index) => (
                            <MenuItem key={index} value={order}>
                              {order}
                            </MenuItem>
                          ))}
                    </Select>
                  </Tooltip>
                }
              </FormControl>
            </Box>
            {isSmallScreen ? (
              <Box sx={{ marginLeft: 2 }}>
                {" "}
                <Button onClick={handleClick}>Insect-Plant Phylogeny</Button>
              </Box>
            ) : null}
          </Box>

          <Box sx={{ display: "flex" }}>
            {/* <Box sx={{marginLeft:2}}>          <FastaToDict/>
</Box> */}
            <Box sx={{ marginLeft: isSmallScreen ? 0 : 2 }}>
              <TreeView
                className={classes.root}
                defaultCollapseIcon={<ExpandMoreIcon />}
                defaultExpandIcon={<ChevronRightIcon />}
                selected={selectedNode}
                onNodeSelect={handleNodeSelect}
              >
                <TreeItem nodeId="1" label="Download">
                  <TreeItem nodeId="2" label="Sequences in fasta format">
                    <SequenceDownload
                      data={download}
                      selectdFamily={selectedFamily}
                      kmer={kmer}
                    />

                    {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                  </TreeItem>
                  <TreeItem nodeId="5" label="Newick file">
                    <NewickDownload
                      newick={newickData}
                      data={
                        selectedOrganism === "plants"
                          ? filteredData
                          : insectFilteredData
                      }
                    />
                  </TreeItem>
                </TreeItem>
              </TreeView>
            </Box>
            <Box sx={{ marginLeft: 2 }}></Box>
            {!isSmallScreen ? (
              <Box sx={{ marginLeft: 2 }}>
                {" "}
                {/* <Button onClick={handleClick}>
                  Link to Insect-Plant Phylogeny
                </Button> */}
                <Tooltip title="Delete"></Tooltip>
                <Tooltip
                  describeChild
                  title="This link shows the phylogenetic tree for the insect barcodes that have an associated plant names, which is included in the labelling. The plants are labelled starting from family name (F) to species name (S).Different plants are separted using."
                >
                  <Button onClick={handleClick}>
                    Link to Insect-Plant Phylogeny
                  </Button>
                </Tooltip>
              </Box>
            ) : null}
          </Box>
        </Box>{" "}
        <Box>
          {(selecteorder === "Tephritidae" || selecteorder === "Rubiaceae") && (
            <iframe
              ref={iframeRef}
              onLoad={handleIframeLoad}
              src={iframeSrc}
              style={{
                position: "relative",
                top: 3,
                left: 2,
                width: "100%", // Set a fixed width
                height: "100vh", // Set a fixed height
              }}
            />
          )}
          {(!selecteorder ||
            (selecteorder !== "Tephritidae" && selecteorder !== "Rubiaceae")) &&
            newickData && (
              <iframe
                ref={iframeRef}
                onLoad={handleIframeLoad}
                src={iframeSrc}
                style={{
                  position: "relative",
                  top: 3,
                  left: 2,
                  width: "100%", // Set a fixed width
                  height: "100vh", // Set a fixed height
                }}
              />
            )}
          {(!selecteorder ||
            (selecteorder !== "Tephritidae" && selecteorder !== "Rubiaceae")) &&
            !newickData && (
              <div
                style={{
                  display: "flex",
                  justifyContent: "center",
                  alignItems: "center",
                  height: "100vh",
                }}
              >
                <p>
                  Constructing phylogenetics tree. Please wait. This may take a
                  few minutes...
                </p>
              </div>
            )}
        </Box>
      </Container>
    );
  }
}
