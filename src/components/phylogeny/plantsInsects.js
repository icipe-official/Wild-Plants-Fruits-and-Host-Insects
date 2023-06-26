import useSWR, { mutate } from "swr";
import { useEffect, useState, useRef } from "react";
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
import { TreeView, TreeItem } from "@mui/lab";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
// import DistancematrixToNewick from "./neigbourjoining";
// import CalculateSimilarityMatrix from "./generateDistanceMatrix";
// import { NeighborJoining } from "./generateDistanceMatrix";

// import { NeighborJoining } from "./modifiedKTurple";
// import CalculateSimilarityMatrixModified from "./modifiedKTurple";
import { makeStyles } from "@mui/styles";

// export default function Newick() {
import { Download } from "@mui/icons-material";

import NewickDownload from "./downloadnewick";
import SequenceDownload from "./download";

const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PhylogenyMafftPlantsInsects() {
  const classes = useStyles();
  const [selectedOrganism, setSelectedOrganism] = useState("insects");
  // const base_url = "http://localhost:3000";
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  // const fetcher = (url) => fetch(url).then((r) => r.json());
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const fetcher = async (url) => {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  };

  // When the selected organism changes, clear the previous data
  // Event handler for updating the selected organism
  // Create the URL based on the selected organism
  const url = `${base_url}/api/${selectedOrganism}/species`;

  const { data, error, isLoading } = useSWR(url, fetcher);
  console.log(data);
  const [newickData, setNewickData] = useState(
    "(Bactrocera_amplexa_Olacaceae_F_Strombosia_scheffleri|:0.0915499461,(Bactrocera_munroi_Oleaceae_F_Olea_welwitschii|:0.0389937620,Bactrocera_oleae_Oleaceae_F_Olea_europaea|:0.0669345413):0.0837973484,(((((((Capparimyia_melanaspis_Capparaceae_F_Boscia_angustifolia|_Capparaceae_F_Boscia_coriacea|_Capparaceae_F_Maerua_angolensis|:0.0714361648,((((Carpophilus_fumatus_Sapotaceae_F_Chrysophylum_albidum|_Flagellariaceae_F_Flagellaria_guine__nsis|_Vitaceae_F_Leea_guineensis|_Rubiaceae_F_Rothmannia_urcelliformis|_Solanaceae_F_Solanum_sp.|_Myrtaceae_F_Syzygium_guineense|:0.2129591474,(Psyttalia_concolor_Simaroubaceae_F_Harrisonia_abyssinica|_Oleaceae_F_Olea_europaea|:0.1185267209,Psyttalia_lounsburyi_Oleaceae_F_Olea_europaea|_Olacaceae_F_Strombosia_scheffleri|:0.0948810949):0.1364394270):0.6392517637,Megastigmus_transvaalensis_Anacardiaceae_F_Searsia_natalensis|:1.1229216332):0.2383240242,Deudorix_dinochares_Rubiaceae_F_Catunaregam_nilotica|_Sapindaceae_F_Deinbollia_borbonica|_Connaraceae_F_Ellipanthus_madagascariensis|_Sapindaceae_F_Lecaniodiscus_fraxinifolius|_Sapindaceae_F_Lepisanthes_senegalensis|_Sapindaceae_F_Majidea_zanguebarica|_R:0.0386002347):0.0321542227,((((Prochoristis_calamochroa_Capparaceae_F_Boscia_coriacea|:0.0997297189,Hydrillodes_uliginosalis_Achariaceae_F_Rawsonia_lucida|:0.0882302365):0.0198278151,(Dolicharthria_lanceolalis_Oleaceae_F_Olea_welwitschii|_Rutaceae_F_Vepris_nobilis|:0.0825583405,Palpita_unionalis_Sapotaceae_F_Englerophytum_oblanceolatum|_Oleaceae_F_Jasminum_fluminense|:0.0755545295):0.0288606576):0.0141529066,(Agrotera_citrina_Phyllanthaceae_F_Phyllanthus_reticulatus|:0.0938934101,(Prophantis_smaragdina_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Oxyanthus_goetzei|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_multiflora|_Rubiaceae_F_Psydrax_polhillii|_Rubiaceae_F_Tricalysia_microphyla|_Rubiaceae_F_Empogona_ovali:0.0415081550,Thliptoceras_xanthomeralis_Rubiaceae_F_Calycosiphonia_spathicalyx|_Rubiaceae_F_Leptactina_platyphylla|_Rubiaceae_F_Oxyanthus_speciosus|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_parvifolia|:0.0563425153):0.0134565086):0.0060479632):0.0293533312,Metendothenia_balanacma_Sapindaceae_F_Lepisanthes_senegalensis|:0.1586143125):0.0358870186):0.2248268029):0.0316419327,(Celidodacus_obnubilus_Fabaceae_F_Canavalia_africana|_Fabaceae_F_Canavalia_cathartica|:0.1350244003,Perilampsis_pulchella_Loranthaceae_F_Agelanthus_sp.|:0.0859005619):0.0300790891):0.0383470638,((((((((Ceratitis_anonae_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Sapotaceae_F_Englerophytum_oblanceolatum|_Rosaceae_F_Rhaphiolepis_bibas|_Rubiaceae_F_Leptactina_platyphylla|_Moraceae_F_Morus_mesozygia|_Sapot:0.0126443506,Ceratitis_rosa_Sapindaceae_F_Allophylus_pervillei|_Fabaceae_F_Angylocalyx_braunii|_Annonaceae_F_Annona_senegalensis|_Rubiaceae_F_Calycosiphonia_spathicalyx|_Apocynaceae_F_Dictyophleba_lucida|_Putranjivaceae_F_Drypetes_natalensis|_Putranjivaceae_F_Drypete:0.0159902716):0.0022503798,Ceratitis_fasciventris_Apocynaceae_F_Acokanthera_schimperi|_Annonaceae_F_Annona_senegalensis|_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Salicaceae_F_Dovyalis_caffra|_Putranjivaceae_F_Drypetes_gerrardii:0.0174153198):0.0113147199,Ceratitis_copelandi_Sapotaceae_F_Chrysophylum_gorungosanum|_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Dovyalis_abyssinica|_Sapotaceae_F_Englerophytum_natalense|_Annonaceae_F_Monanthotaxis_parvifolia|_Achariaceae_F_Rawsonia_lucida|_Sapotaceae_F_Synse:0.0414199310):0.0089820367,(Ceratitis_flexuosa_Moraceae_F_Antiaris_toxicaria|:0.0453560151,Ceratitis_rubivora_Rosaceae_F_Rubus_apetalus|_Rosaceae_F_Rubus_keniensis|_Rosaceae_F_Rubus_niveus|_Rosaceae_F_Rubus_pinnatus|_Rosaceae_F_Rubus_rigidus|_Rosaceae_F_Rubus_scheffleri|_Rosaceae_F_Rubus_steudneri|:0.0322654750):0.0040869570):0.0063777902,(Ceratitis_caetrata_Apocynaceae_F_Carissa_spinarum|_Ebenaceae_F_Euclea_divinorum|_Sapotaceae_F_Manilkara_butugi|_Sapotaceae_F_Mimusops_bagshawei|:0.0058363076,Ceratitis_capitata_Apocynaceae_F_Acokanthera_oppositifolia|_Apocynaceae_F_Acokanthera_schimperi|_Euphorbiaceae_F_Antidesma_venosum|_Annonaceae_F_Artabotrys_monteiroae|_Salvadoraceae_F_Azima_tetracantha|_Boraginaceae_F_Bourreria_petiolaris|_Capparaceae_F_:0.0038468395):0.0743071485):0.0074202638,(((Ceratitis_cornuta_Rubiaceae_F_Oxyanthus_speciosus|:0.1089658653,Ceratitis_pedestris_Loganiaceae_F_Strychnos_madagascariensis|:0.0673123843):0.0200688033,Ceratitis_querita_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Ludia_mauritiana|_Loganiaceae_F_Strychnos_mitis|:0.0509838756):0.0078956207,(Ceratitis_gravinotata_Podocarpaceae_F_Afrocarpus_gracilior|:0.0411329054,Ceratitis_podocarpi_Podocarpaceae_F_Afrocarpus_gracilior|:0.0081007834):0.0239868663):0.0174927906):0.0246442456,(((Ceratitis_cosyra_Annonaceae_F_Annona_muricata|_Annonaceae_F_Annona_senegalensis|_Fabaceae_F_Cordyla_africana|_Apocynaceae_F_Landolphia_sp.|_Anacardiaceae_F_Mangifera_indica|_Apocynaceae_F_Saba_comorensis|_Anacardiaceae_F_Sclerocarya_birrea|_Canellaceae_F:0.0664190301,Ceratitis_discussa_Annonaceae_F_Annona_senegalensis|:0.0450383177):0.0215127731,Ceratitis_striatella_Apocynaceae_F_Dictyophleba_lucida|:0.0642404487):0.0302916274,Ceratitis_oraria_Celastraceae_F_Salacia_leptoclada|:0.1004091258):0.0281048549):0.0110954017,(((Ceratitis_bremii_Sapotaceae_F_Pouteria_alnifolia|_Sapotaceae_F_Pouteria_altissima|:0.0777290932,(((Ceratitis_cuthbertsoni_Apocynaceae_F_Tabernaemontana_stapfiana|:0.0518795134,Ceratitis_edwardsi_Apocynaceae_F_Tabernaemontana_ventricosa|:0.0559362548):0.0112577760,Ceratitis_millicentae_Apocynaceae_F_Ancylobothrys_petersiana|_Rutaceae_F_Vepris_sp.|_Apocynaceae_F_Tabernaemontana_elegans|:0.0464815661):0.0166862884,Ceratitis_ditissima_Sapotaceae_F_Chrysophylum_albidum|:0.0848959746):0.0234504988):0.0701111804,(Ceratitis_marriotti_Solanaceae_F_Solanum_anguivi|_Solanaceae_F_Solanum_schumannianum|:0.0683464930,Trirhithrum_overlaeti_Solanaceae_F_Solanum_terminale|:0.0880605770):0.0610949804):0.0020403778,(Ceratitis_stictica_Rubiaceae_F_Craterispermum_schweinfurthii|:0.1051267464,((((Trirhithrum_coffeae_Rubiaceae_F_Coffea_arabica|_Rubiaceae_F_Coffea_eugenioides|:0.0417421744,(Trirhithrum_fraternum_Rubiaceae_F_Craterispermum_schweinfurthii|:0.0072929440,Trirhithrum_nigerrimum_Vitaceae_F_Ampelocissus_africana|_Euphorbiaceae_F_Antidesma_venosum|_Boraginaceae_F_Bourreria_petiolaris|_Apocynaceae_F_Carissa_tetramera|_Vitaceae_F_Afrocayratia_gracilis|_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Eumachia_ab:0.0163205354):0.0093042931):0.0309357975,(Trirhithrum_meladiscum_Rubiaceae_F_Chassalia_discolor|_Rubiaceae_F_Chassalia_kenyensis|_Rubiaceae_F_Chassalia_parvifolia|_Rubiaceae_F_Lasianthus_kilimandscharicus|_Rubiaceae_F_Psychotria_fractinervata|_Rubiaceae_F_Psychotria_mahonii|_Rubiaceae_F_Psychotr:0.0706282881,Trirhithrum_senex_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Geophila_uniflora|_Rubiaceae_F_Psychotria_alsophila|_Rubiaceae_F_Psychotria_amboniana|_Rubiaceae_F_Psychotria_capensis|_Rubiaceae_F_Psychotria_faucicola|_Rubiaceae_F_Psychotria_holtzii|_Rub:0.0707192518):0.0213547697):0.0045286868,Trirhithrum_culcasiae_Araceae_F_Culcasia_falcifolia|_Araceae_F_Culcasia_orientalis|:0.1341185310):0.0127550985,Trirhithrum_teres_Rubiaceae_F_Eumachia_abrupta|:0.0771984588):0.0118032911):0.0131838814):0.0096578689):0.0322043674):0.0000025713,Carpophthoromyia_dimidiata_Putranjivaceae_F_Drypetes_gerrardii|:0.2059643474):0.0288990144,Munromyia_whartoni_Oleaceae_F_Noronhia_nilotica|:0.2276210901):0.0177763136,Ceratitis_connexa_Sapotaceae_F_Synsepalum_brevipes|_Canellaceae_F_Warburgia_ugandensis|:0.2039856790):0.0301500275,((Dacus_arcuatus_Apocynaceae_F_Pergularia_daemia|:0.0806808030,Dacus_tenebricus_Apocynaceae_F_Gomphocarpus_semilunatus|:0.0584226368):0.1279393251,((((Dacus_ciliatus_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Corallocarpus_ellipticus|_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Kedrostis_foetidissima|:0.1008369742,Dacus_frontalis_Cucurbitaceae_F_Coccinia_grandis|_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Cucumis_prophetarum|:0.0673129536):0.0584655406,(Dacus_phloginus_Cucurbitaceae_F_Zehneria_minutiflora|:0.0548718633,(Dacus_apostata_Cucurbitaceae_F_Zehneria_scabra|:0.0000009993,Dacus_triater_Cucurbitaceae_F_Zehneria_scabra|:0.0000009993):0.0516386062):0.0682597696):0.0169524055,((Dacus_eclipsis_Passifloraceae_F_Adenia_gummifera|:0.1177122775,Dacus_limbipennis_Cucurbitaceae_F_Momordica_cissoides|_Cucurbitaceae_F_Momordica_foetida|:0.1132810173):0.0121999115,(Dacus_pleuralis_Cucurbitaceae_F_Lagenaria_sphaerica|:0.1323782765,(Dacus_punctatifrons_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Diplocyclos_palmatus|_Cucurbitaceae_F_Lagenaria_sphaerica|_Cucurbitaceae_F_Momordica_trifoliolata|_Cucurbitaceae_F_Peponium_vogelii|_Cucurbitaceae_F_Zehneria_scabra|:0.1124694748,Dacus_sphaeristicus_Cucurbitaceae_F_Momordica_foetida|:0.0942854011):0.0126594243):0.0234450397):0.0383459526):0.0230066822,Dacus_vertebratus_Cucurbitaceae_F_Cucumis_aculeatus|_Cucurbitaceae_F_Cucumis_dipsaceus|:0.1485768978):0.0245337139):0.0302574563):0.0679333833);"
  );
  const [download, setDownload] = useState([]);

  // handle input sequences
  const [fastaInput, setFastaInput] = useState("");
  const [fastaArray, setFastaArray] = useState([]);
  const [newickInput, setNewickInput] = useState("");
  const handleOrganismChange = (event) => {
    // setNewickData("");
    // const newSelectedOrganism = event.target.value;
    setSelectedOrganism(event.target.value);

    // console.log(selectedOrganism);
    // // const newOrganism = event.target.value;
    // // Clear the previous data and refetch based on selecetd organism and change api
    // // to that of selected organism
    // // use the same name for api end points to
    // mutate(`${base_url}/api/plants/species`, null, false);
    // mutate(`${base_url}/api/insects/all/coi`, null, false);

    // Update the selected organism

    // setfilteredFamily("")
    handleChange(event);
    // setNewickData("");
  };
  // control drop down tree for download
  const [selectedNode, setSelectedNode] = useState(null);

  // handle user added sequences
  const [userSequences, setUserSequences] = useState(false);

  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  //back to phylogeny page]
  const handleClick = () => {
    router.push("/phylogeny");
  };

  // change view if small screen variable
  const iframeRef = useRef(null);
  const router = useRouter();
  useEffect(() => {
    if (newickData && iframeRef.current) {
      // Wait for the iframe to load
      iframeRef.current.addEventListener("load", () => {
        // Send data to the iframe
        iframeRef.current.contentWindow.postMessage({ newickData }, "*");
      });
    }
  }, [newickData]);
  if (isLoading) {
    return <Container sx={{ height: "100%" }}>Loading</Container>;
  }

  // //handle new set kmer
  // useEffect(() => {
  //   if (data) {
  //     // console.log("selectedFamily changed to:", selectedFamily);
  //     handleChange();
  //   }
  // }, []);

  async function handleChange(event) {
    if (selectedOrganism === "plants") {
      setSelectedOrganism(event.target.value);
      // // setNewickData("");
      // console.log("filterd data");
      // const plantsfilteredData = data.filter(
      //   (dat) => dat.plants_matk.length > 0 && dat.plants_insects.length > 0
      // );
      // console.log(filteredData);

      // const sequences = plantsfilteredData.reduce((result, obj) => {
      //   let counter = 1;
      //   if (obj.plants_matk.length > 0) {
      //     obj.plants_matk.forEach((plant) => {
      //       if (plant.nucleotide !== null) {
      //         const name = `${obj.plant_genera.genus_name}_${
      //           obj.species_name.split(" ")[0]
      //         }_${obj.plants_insects
      //           .map(
      //             (insect) =>
      //               `${insect.insects.insect_orders.order_name}_F_${
      //                 insect.insects.insect_genera.genus_name
      //               }-${insect.insects.species_name
      //                 .split(" ")[0]
      //                 .replace(/./g, "")
      //                 .replace(/\s/g, "")
      //                 .replace(/[.?]/g, "")}`
      //           )
      //           .join("")}`; // Join the generated name fragments without any separator
      //         counter;
      //         counter++;
      //         result[
      //           name.replace(/\s/g, "").replace(/\n/g, "").replace(/-/g, "")
      //         ] = plant.nucleotide.replace(/-/g, "").replace(/N/g, "");
      //       }
      //     });
      //   }
      //   return result;
      // }, {});

      // setDownload(sequences);
      // console.log("plant sequences format");
      // console.log(sequences);
      // console.log("sequences on click family");
      // console.log(sequences);
      // const requestBody = {
      //   sequences,
      // };
      // fetch(`${base_url}/api/phylogeny`, {
      //   method: "POST",
      //   headers: {
      //     "Content-Type": "application/json",
      //   },
      //   body: JSON.stringify(requestBody),
      // })
      //   .then((response) => {
      //     if (!response.ok) {
      //       throw new Error(`Error: ${response.status}`);
      //     }
      //     return response.json();
      //   })
      //   .then((data) => {
      //     const { newick } = data;
      setNewickData(
        "(Bactrocera_amplexa_Olacaceae_F_Strombosia_scheffleri|:0.0915499461,(Bactrocera_munroi_Oleaceae_F_Olea_welwitschii|:0.0389937620,Bactrocera_oleae_Oleaceae_F_Olea_europaea|:0.0669345413):0.0837973484,(((((((Capparimyia_melanaspis_Capparaceae_F_Boscia_angustifolia|_Capparaceae_F_Boscia_coriacea|_Capparaceae_F_Maerua_angolensis|:0.0714361648,((((Carpophilus_fumatus_Sapotaceae_F_Chrysophylum_albidum|_Flagellariaceae_F_Flagellaria_guine__nsis|_Vitaceae_F_Leea_guineensis|_Rubiaceae_F_Rothmannia_urcelliformis|_Solanaceae_F_Solanum_sp.|_Myrtaceae_F_Syzygium_guineense|:0.2129591474,(Psyttalia_concolor_Simaroubaceae_F_Harrisonia_abyssinica|_Oleaceae_F_Olea_europaea|:0.1185267209,Psyttalia_lounsburyi_Oleaceae_F_Olea_europaea|_Olacaceae_F_Strombosia_scheffleri|:0.0948810949):0.1364394270):0.6392517637,Megastigmus_transvaalensis_Anacardiaceae_F_Searsia_natalensis|:1.1229216332):0.2383240242,Deudorix_dinochares_Rubiaceae_F_Catunaregam_nilotica|_Sapindaceae_F_Deinbollia_borbonica|_Connaraceae_F_Ellipanthus_madagascariensis|_Sapindaceae_F_Lecaniodiscus_fraxinifolius|_Sapindaceae_F_Lepisanthes_senegalensis|_Sapindaceae_F_Majidea_zanguebarica|_R:0.0386002347):0.0321542227,((((Prochoristis_calamochroa_Capparaceae_F_Boscia_coriacea|:0.0997297189,Hydrillodes_uliginosalis_Achariaceae_F_Rawsonia_lucida|:0.0882302365):0.0198278151,(Dolicharthria_lanceolalis_Oleaceae_F_Olea_welwitschii|_Rutaceae_F_Vepris_nobilis|:0.0825583405,Palpita_unionalis_Sapotaceae_F_Englerophytum_oblanceolatum|_Oleaceae_F_Jasminum_fluminense|:0.0755545295):0.0288606576):0.0141529066,(Agrotera_citrina_Phyllanthaceae_F_Phyllanthus_reticulatus|:0.0938934101,(Prophantis_smaragdina_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Oxyanthus_goetzei|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_multiflora|_Rubiaceae_F_Psydrax_polhillii|_Rubiaceae_F_Tricalysia_microphyla|_Rubiaceae_F_Empogona_ovali:0.0415081550,Thliptoceras_xanthomeralis_Rubiaceae_F_Calycosiphonia_spathicalyx|_Rubiaceae_F_Leptactina_platyphylla|_Rubiaceae_F_Oxyanthus_speciosus|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_parvifolia|:0.0563425153):0.0134565086):0.0060479632):0.0293533312,Metendothenia_balanacma_Sapindaceae_F_Lepisanthes_senegalensis|:0.1586143125):0.0358870186):0.2248268029):0.0316419327,(Celidodacus_obnubilus_Fabaceae_F_Canavalia_africana|_Fabaceae_F_Canavalia_cathartica|:0.1350244003,Perilampsis_pulchella_Loranthaceae_F_Agelanthus_sp.|:0.0859005619):0.0300790891):0.0383470638,((((((((Ceratitis_anonae_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Sapotaceae_F_Englerophytum_oblanceolatum|_Rosaceae_F_Rhaphiolepis_bibas|_Rubiaceae_F_Leptactina_platyphylla|_Moraceae_F_Morus_mesozygia|_Sapot:0.0126443506,Ceratitis_rosa_Sapindaceae_F_Allophylus_pervillei|_Fabaceae_F_Angylocalyx_braunii|_Annonaceae_F_Annona_senegalensis|_Rubiaceae_F_Calycosiphonia_spathicalyx|_Apocynaceae_F_Dictyophleba_lucida|_Putranjivaceae_F_Drypetes_natalensis|_Putranjivaceae_F_Drypete:0.0159902716):0.0022503798,Ceratitis_fasciventris_Apocynaceae_F_Acokanthera_schimperi|_Annonaceae_F_Annona_senegalensis|_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Salicaceae_F_Dovyalis_caffra|_Putranjivaceae_F_Drypetes_gerrardii:0.0174153198):0.0113147199,Ceratitis_copelandi_Sapotaceae_F_Chrysophylum_gorungosanum|_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Dovyalis_abyssinica|_Sapotaceae_F_Englerophytum_natalense|_Annonaceae_F_Monanthotaxis_parvifolia|_Achariaceae_F_Rawsonia_lucida|_Sapotaceae_F_Synse:0.0414199310):0.0089820367,(Ceratitis_flexuosa_Moraceae_F_Antiaris_toxicaria|:0.0453560151,Ceratitis_rubivora_Rosaceae_F_Rubus_apetalus|_Rosaceae_F_Rubus_keniensis|_Rosaceae_F_Rubus_niveus|_Rosaceae_F_Rubus_pinnatus|_Rosaceae_F_Rubus_rigidus|_Rosaceae_F_Rubus_scheffleri|_Rosaceae_F_Rubus_steudneri|:0.0322654750):0.0040869570):0.0063777902,(Ceratitis_caetrata_Apocynaceae_F_Carissa_spinarum|_Ebenaceae_F_Euclea_divinorum|_Sapotaceae_F_Manilkara_butugi|_Sapotaceae_F_Mimusops_bagshawei|:0.0058363076,Ceratitis_capitata_Apocynaceae_F_Acokanthera_oppositifolia|_Apocynaceae_F_Acokanthera_schimperi|_Euphorbiaceae_F_Antidesma_venosum|_Annonaceae_F_Artabotrys_monteiroae|_Salvadoraceae_F_Azima_tetracantha|_Boraginaceae_F_Bourreria_petiolaris|_Capparaceae_F_:0.0038468395):0.0743071485):0.0074202638,(((Ceratitis_cornuta_Rubiaceae_F_Oxyanthus_speciosus|:0.1089658653,Ceratitis_pedestris_Loganiaceae_F_Strychnos_madagascariensis|:0.0673123843):0.0200688033,Ceratitis_querita_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Ludia_mauritiana|_Loganiaceae_F_Strychnos_mitis|:0.0509838756):0.0078956207,(Ceratitis_gravinotata_Podocarpaceae_F_Afrocarpus_gracilior|:0.0411329054,Ceratitis_podocarpi_Podocarpaceae_F_Afrocarpus_gracilior|:0.0081007834):0.0239868663):0.0174927906):0.0246442456,(((Ceratitis_cosyra_Annonaceae_F_Annona_muricata|_Annonaceae_F_Annona_senegalensis|_Fabaceae_F_Cordyla_africana|_Apocynaceae_F_Landolphia_sp.|_Anacardiaceae_F_Mangifera_indica|_Apocynaceae_F_Saba_comorensis|_Anacardiaceae_F_Sclerocarya_birrea|_Canellaceae_F:0.0664190301,Ceratitis_discussa_Annonaceae_F_Annona_senegalensis|:0.0450383177):0.0215127731,Ceratitis_striatella_Apocynaceae_F_Dictyophleba_lucida|:0.0642404487):0.0302916274,Ceratitis_oraria_Celastraceae_F_Salacia_leptoclada|:0.1004091258):0.0281048549):0.0110954017,(((Ceratitis_bremii_Sapotaceae_F_Pouteria_alnifolia|_Sapotaceae_F_Pouteria_altissima|:0.0777290932,(((Ceratitis_cuthbertsoni_Apocynaceae_F_Tabernaemontana_stapfiana|:0.0518795134,Ceratitis_edwardsi_Apocynaceae_F_Tabernaemontana_ventricosa|:0.0559362548):0.0112577760,Ceratitis_millicentae_Apocynaceae_F_Ancylobothrys_petersiana|_Rutaceae_F_Vepris_sp.|_Apocynaceae_F_Tabernaemontana_elegans|:0.0464815661):0.0166862884,Ceratitis_ditissima_Sapotaceae_F_Chrysophylum_albidum|:0.0848959746):0.0234504988):0.0701111804,(Ceratitis_marriotti_Solanaceae_F_Solanum_anguivi|_Solanaceae_F_Solanum_schumannianum|:0.0683464930,Trirhithrum_overlaeti_Solanaceae_F_Solanum_terminale|:0.0880605770):0.0610949804):0.0020403778,(Ceratitis_stictica_Rubiaceae_F_Craterispermum_schweinfurthii|:0.1051267464,((((Trirhithrum_coffeae_Rubiaceae_F_Coffea_arabica|_Rubiaceae_F_Coffea_eugenioides|:0.0417421744,(Trirhithrum_fraternum_Rubiaceae_F_Craterispermum_schweinfurthii|:0.0072929440,Trirhithrum_nigerrimum_Vitaceae_F_Ampelocissus_africana|_Euphorbiaceae_F_Antidesma_venosum|_Boraginaceae_F_Bourreria_petiolaris|_Apocynaceae_F_Carissa_tetramera|_Vitaceae_F_Afrocayratia_gracilis|_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Eumachia_ab:0.0163205354):0.0093042931):0.0309357975,(Trirhithrum_meladiscum_Rubiaceae_F_Chassalia_discolor|_Rubiaceae_F_Chassalia_kenyensis|_Rubiaceae_F_Chassalia_parvifolia|_Rubiaceae_F_Lasianthus_kilimandscharicus|_Rubiaceae_F_Psychotria_fractinervata|_Rubiaceae_F_Psychotria_mahonii|_Rubiaceae_F_Psychotr:0.0706282881,Trirhithrum_senex_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Geophila_uniflora|_Rubiaceae_F_Psychotria_alsophila|_Rubiaceae_F_Psychotria_amboniana|_Rubiaceae_F_Psychotria_capensis|_Rubiaceae_F_Psychotria_faucicola|_Rubiaceae_F_Psychotria_holtzii|_Rub:0.0707192518):0.0213547697):0.0045286868,Trirhithrum_culcasiae_Araceae_F_Culcasia_falcifolia|_Araceae_F_Culcasia_orientalis|:0.1341185310):0.0127550985,Trirhithrum_teres_Rubiaceae_F_Eumachia_abrupta|:0.0771984588):0.0118032911):0.0131838814):0.0096578689):0.0322043674):0.0000025713,Carpophthoromyia_dimidiata_Putranjivaceae_F_Drypetes_gerrardii|:0.2059643474):0.0288990144,Munromyia_whartoni_Oleaceae_F_Noronhia_nilotica|:0.2276210901):0.0177763136,Ceratitis_connexa_Sapotaceae_F_Synsepalum_brevipes|_Canellaceae_F_Warburgia_ugandensis|:0.2039856790):0.0301500275,((Dacus_arcuatus_Apocynaceae_F_Pergularia_daemia|:0.0806808030,Dacus_tenebricus_Apocynaceae_F_Gomphocarpus_semilunatus|:0.0584226368):0.1279393251,((((Dacus_ciliatus_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Corallocarpus_ellipticus|_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Kedrostis_foetidissima|:0.1008369742,Dacus_frontalis_Cucurbitaceae_F_Coccinia_grandis|_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Cucumis_prophetarum|:0.0673129536):0.0584655406,(Dacus_phloginus_Cucurbitaceae_F_Zehneria_minutiflora|:0.0548718633,(Dacus_apostata_Cucurbitaceae_F_Zehneria_scabra|:0.0000009993,Dacus_triater_Cucurbitaceae_F_Zehneria_scabra|:0.0000009993):0.0516386062):0.0682597696):0.0169524055,((Dacus_eclipsis_Passifloraceae_F_Adenia_gummifera|:0.1177122775,Dacus_limbipennis_Cucurbitaceae_F_Momordica_cissoides|_Cucurbitaceae_F_Momordica_foetida|:0.1132810173):0.0121999115,(Dacus_pleuralis_Cucurbitaceae_F_Lagenaria_sphaerica|:0.1323782765,(Dacus_punctatifrons_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Diplocyclos_palmatus|_Cucurbitaceae_F_Lagenaria_sphaerica|_Cucurbitaceae_F_Momordica_trifoliolata|_Cucurbitaceae_F_Peponium_vogelii|_Cucurbitaceae_F_Zehneria_scabra|:0.1124694748,Dacus_sphaeristicus_Cucurbitaceae_F_Momordica_foetida|:0.0942854011):0.0126594243):0.0234450397):0.0383459526):0.0230066822,Dacus_vertebratus_Cucurbitaceae_F_Cucumis_aculeatus|_Cucurbitaceae_F_Cucumis_dipsaceus|:0.1485768978):0.0245337139):0.0302574563):0.0679333833);"
      );
      //     console.log(data);
      //   })
      //   .catch((error) => {
      //     console.error(error);
      //   });
    } else if (selectedOrganism === "insects") {
      setSelectedOrganism(event.target.value);
      //   setNewickData("");
      //   console.log("insect kmer at handlechange");
      //   const selectedValue =
      //     (event.target && event.target.value) || "Select family";
      //   const insectfilteredData = data.filter(
      //     (entry) => entry.plants_insects.length > 0
      //   );
      //   console.log("insect filteredData");
      //   const sequences = insectfilteredData.reduce((result, obj) => {
      //     let counter = 1;
      //     if (obj.insects_coi.length > 0) {
      //       obj.insects_coi.forEach((insect) => {
      //         if (insect.nucleotide !== null) {
      //           const name = `${obj.insect_genera.genus_name}>${
      //             obj.species_name.split(" ")[0]
      //           }_${obj.plants_insects.map(
      //             (plant) =>
      //               `${plant.plants.plant_genera.plant_families.family_name}_F_${
      //                 plant.plants.plant_genera.genus_name
      //               }_${plant.plants.species_name.split(" ")[0]}|`
      //           )}`;

      //           result[
      //             name.replace(/\s/g, "").replace(/\n/g, "").replace(/-/g, "")
      //           ] = insect.nucleotide.replace(/-/g, "").replace(/N/g, "");
      //         }
      //       });
      //     }
      //     return result;
      //   }, {});
      //   setDownload(sequences);
      //   // console.log("insect sequncesssss");

      //   // console.log(sequences);

      //   const requestBody = {
      //     sequences,
      //   };
      //   fetch(`${base_url}/api/phylogeny`, {
      //     method: "POST",
      //     headers: {
      //       "Content-Type": "application/json",
      //     },
      //     body: JSON.stringify(requestBody),
      //   })
      //     .then((response) => {
      //       if (!response.ok) {
      //         throw new Error(`Error: ${response.status}`);
      //       }
      //       return response.json();
      //     })
      //     .then((data) => {
      //       const { newick } = data;
      setNewickData(
        "(Bactrocera_amplexa_Olacaceae_F_Strombosia_scheffleri|:0.0915499461,(Bactrocera_munroi_Oleaceae_F_Olea_welwitschii|:0.0389937620,Bactrocera_oleae_Oleaceae_F_Olea_europaea|:0.0669345413):0.0837973484,(((((((Capparimyia_melanaspis_Capparaceae_F_Boscia_angustifolia|_Capparaceae_F_Boscia_coriacea|_Capparaceae_F_Maerua_angolensis|:0.0714361648,((((Carpophilus_fumatus_Sapotaceae_F_Chrysophylum_albidum|_Flagellariaceae_F_Flagellaria_guine__nsis|_Vitaceae_F_Leea_guineensis|_Rubiaceae_F_Rothmannia_urcelliformis|_Solanaceae_F_Solanum_sp.|_Myrtaceae_F_Syzygium_guineense|:0.2129591474,(Psyttalia_concolor_Simaroubaceae_F_Harrisonia_abyssinica|_Oleaceae_F_Olea_europaea|:0.1185267209,Psyttalia_lounsburyi_Oleaceae_F_Olea_europaea|_Olacaceae_F_Strombosia_scheffleri|:0.0948810949):0.1364394270):0.6392517637,Megastigmus_transvaalensis_Anacardiaceae_F_Searsia_natalensis|:1.1229216332):0.2383240242,Deudorix_dinochares_Rubiaceae_F_Catunaregam_nilotica|_Sapindaceae_F_Deinbollia_borbonica|_Connaraceae_F_Ellipanthus_madagascariensis|_Sapindaceae_F_Lecaniodiscus_fraxinifolius|_Sapindaceae_F_Lepisanthes_senegalensis|_Sapindaceae_F_Majidea_zanguebarica|_R:0.0386002347):0.0321542227,((((Prochoristis_calamochroa_Capparaceae_F_Boscia_coriacea|:0.0997297189,Hydrillodes_uliginosalis_Achariaceae_F_Rawsonia_lucida|:0.0882302365):0.0198278151,(Dolicharthria_lanceolalis_Oleaceae_F_Olea_welwitschii|_Rutaceae_F_Vepris_nobilis|:0.0825583405,Palpita_unionalis_Sapotaceae_F_Englerophytum_oblanceolatum|_Oleaceae_F_Jasminum_fluminense|:0.0755545295):0.0288606576):0.0141529066,(Agrotera_citrina_Phyllanthaceae_F_Phyllanthus_reticulatus|:0.0938934101,(Prophantis_smaragdina_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Oxyanthus_goetzei|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_multiflora|_Rubiaceae_F_Psydrax_polhillii|_Rubiaceae_F_Tricalysia_microphyla|_Rubiaceae_F_Empogona_ovali:0.0415081550,Thliptoceras_xanthomeralis_Rubiaceae_F_Calycosiphonia_spathicalyx|_Rubiaceae_F_Leptactina_platyphylla|_Rubiaceae_F_Oxyanthus_speciosus|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_parvifolia|:0.0563425153):0.0134565086):0.0060479632):0.0293533312,Metendothenia_balanacma_Sapindaceae_F_Lepisanthes_senegalensis|:0.1586143125):0.0358870186):0.2248268029):0.0316419327,(Celidodacus_obnubilus_Fabaceae_F_Canavalia_africana|_Fabaceae_F_Canavalia_cathartica|:0.1350244003,Perilampsis_pulchella_Loranthaceae_F_Agelanthus_sp.|:0.0859005619):0.0300790891):0.0383470638,((((((((Ceratitis_anonae_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Sapotaceae_F_Englerophytum_oblanceolatum|_Rosaceae_F_Rhaphiolepis_bibas|_Rubiaceae_F_Leptactina_platyphylla|_Moraceae_F_Morus_mesozygia|_Sapot:0.0126443506,Ceratitis_rosa_Sapindaceae_F_Allophylus_pervillei|_Fabaceae_F_Angylocalyx_braunii|_Annonaceae_F_Annona_senegalensis|_Rubiaceae_F_Calycosiphonia_spathicalyx|_Apocynaceae_F_Dictyophleba_lucida|_Putranjivaceae_F_Drypetes_natalensis|_Putranjivaceae_F_Drypete:0.0159902716):0.0022503798,Ceratitis_fasciventris_Apocynaceae_F_Acokanthera_schimperi|_Annonaceae_F_Annona_senegalensis|_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Salicaceae_F_Dovyalis_caffra|_Putranjivaceae_F_Drypetes_gerrardii:0.0174153198):0.0113147199,Ceratitis_copelandi_Sapotaceae_F_Chrysophylum_gorungosanum|_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Dovyalis_abyssinica|_Sapotaceae_F_Englerophytum_natalense|_Annonaceae_F_Monanthotaxis_parvifolia|_Achariaceae_F_Rawsonia_lucida|_Sapotaceae_F_Synse:0.0414199310):0.0089820367,(Ceratitis_flexuosa_Moraceae_F_Antiaris_toxicaria|:0.0453560151,Ceratitis_rubivora_Rosaceae_F_Rubus_apetalus|_Rosaceae_F_Rubus_keniensis|_Rosaceae_F_Rubus_niveus|_Rosaceae_F_Rubus_pinnatus|_Rosaceae_F_Rubus_rigidus|_Rosaceae_F_Rubus_scheffleri|_Rosaceae_F_Rubus_steudneri|:0.0322654750):0.0040869570):0.0063777902,(Ceratitis_caetrata_Apocynaceae_F_Carissa_spinarum|_Ebenaceae_F_Euclea_divinorum|_Sapotaceae_F_Manilkara_butugi|_Sapotaceae_F_Mimusops_bagshawei|:0.0058363076,Ceratitis_capitata_Apocynaceae_F_Acokanthera_oppositifolia|_Apocynaceae_F_Acokanthera_schimperi|_Euphorbiaceae_F_Antidesma_venosum|_Annonaceae_F_Artabotrys_monteiroae|_Salvadoraceae_F_Azima_tetracantha|_Boraginaceae_F_Bourreria_petiolaris|_Capparaceae_F_:0.0038468395):0.0743071485):0.0074202638,(((Ceratitis_cornuta_Rubiaceae_F_Oxyanthus_speciosus|:0.1089658653,Ceratitis_pedestris_Loganiaceae_F_Strychnos_madagascariensis|:0.0673123843):0.0200688033,Ceratitis_querita_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Ludia_mauritiana|_Loganiaceae_F_Strychnos_mitis|:0.0509838756):0.0078956207,(Ceratitis_gravinotata_Podocarpaceae_F_Afrocarpus_gracilior|:0.0411329054,Ceratitis_podocarpi_Podocarpaceae_F_Afrocarpus_gracilior|:0.0081007834):0.0239868663):0.0174927906):0.0246442456,(((Ceratitis_cosyra_Annonaceae_F_Annona_muricata|_Annonaceae_F_Annona_senegalensis|_Fabaceae_F_Cordyla_africana|_Apocynaceae_F_Landolphia_sp.|_Anacardiaceae_F_Mangifera_indica|_Apocynaceae_F_Saba_comorensis|_Anacardiaceae_F_Sclerocarya_birrea|_Canellaceae_F:0.0664190301,Ceratitis_discussa_Annonaceae_F_Annona_senegalensis|:0.0450383177):0.0215127731,Ceratitis_striatella_Apocynaceae_F_Dictyophleba_lucida|:0.0642404487):0.0302916274,Ceratitis_oraria_Celastraceae_F_Salacia_leptoclada|:0.1004091258):0.0281048549):0.0110954017,(((Ceratitis_bremii_Sapotaceae_F_Pouteria_alnifolia|_Sapotaceae_F_Pouteria_altissima|:0.0777290932,(((Ceratitis_cuthbertsoni_Apocynaceae_F_Tabernaemontana_stapfiana|:0.0518795134,Ceratitis_edwardsi_Apocynaceae_F_Tabernaemontana_ventricosa|:0.0559362548):0.0112577760,Ceratitis_millicentae_Apocynaceae_F_Ancylobothrys_petersiana|_Rutaceae_F_Vepris_sp.|_Apocynaceae_F_Tabernaemontana_elegans|:0.0464815661):0.0166862884,Ceratitis_ditissima_Sapotaceae_F_Chrysophylum_albidum|:0.0848959746):0.0234504988):0.0701111804,(Ceratitis_marriotti_Solanaceae_F_Solanum_anguivi|_Solanaceae_F_Solanum_schumannianum|:0.0683464930,Trirhithrum_overlaeti_Solanaceae_F_Solanum_terminale|:0.0880605770):0.0610949804):0.0020403778,(Ceratitis_stictica_Rubiaceae_F_Craterispermum_schweinfurthii|:0.1051267464,((((Trirhithrum_coffeae_Rubiaceae_F_Coffea_arabica|_Rubiaceae_F_Coffea_eugenioides|:0.0417421744,(Trirhithrum_fraternum_Rubiaceae_F_Craterispermum_schweinfurthii|:0.0072929440,Trirhithrum_nigerrimum_Vitaceae_F_Ampelocissus_africana|_Euphorbiaceae_F_Antidesma_venosum|_Boraginaceae_F_Bourreria_petiolaris|_Apocynaceae_F_Carissa_tetramera|_Vitaceae_F_Afrocayratia_gracilis|_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Eumachia_ab:0.0163205354):0.0093042931):0.0309357975,(Trirhithrum_meladiscum_Rubiaceae_F_Chassalia_discolor|_Rubiaceae_F_Chassalia_kenyensis|_Rubiaceae_F_Chassalia_parvifolia|_Rubiaceae_F_Lasianthus_kilimandscharicus|_Rubiaceae_F_Psychotria_fractinervata|_Rubiaceae_F_Psychotria_mahonii|_Rubiaceae_F_Psychotr:0.0706282881,Trirhithrum_senex_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Geophila_uniflora|_Rubiaceae_F_Psychotria_alsophila|_Rubiaceae_F_Psychotria_amboniana|_Rubiaceae_F_Psychotria_capensis|_Rubiaceae_F_Psychotria_faucicola|_Rubiaceae_F_Psychotria_holtzii|_Rub:0.0707192518):0.0213547697):0.0045286868,Trirhithrum_culcasiae_Araceae_F_Culcasia_falcifolia|_Araceae_F_Culcasia_orientalis|:0.1341185310):0.0127550985,Trirhithrum_teres_Rubiaceae_F_Eumachia_abrupta|:0.0771984588):0.0118032911):0.0131838814):0.0096578689):0.0322043674):0.0000025713,Carpophthoromyia_dimidiata_Putranjivaceae_F_Drypetes_gerrardii|:0.2059643474):0.0288990144,Munromyia_whartoni_Oleaceae_F_Noronhia_nilotica|:0.2276210901):0.0177763136,Ceratitis_connexa_Sapotaceae_F_Synsepalum_brevipes|_Canellaceae_F_Warburgia_ugandensis|:0.2039856790):0.0301500275,((Dacus_arcuatus_Apocynaceae_F_Pergularia_daemia|:0.0806808030,Dacus_tenebricus_Apocynaceae_F_Gomphocarpus_semilunatus|:0.0584226368):0.1279393251,((((Dacus_ciliatus_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Corallocarpus_ellipticus|_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Kedrostis_foetidissima|:0.1008369742,Dacus_frontalis_Cucurbitaceae_F_Coccinia_grandis|_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Cucumis_prophetarum|:0.0673129536):0.0584655406,(Dacus_phloginus_Cucurbitaceae_F_Zehneria_minutiflora|:0.0548718633,(Dacus_apostata_Cucurbitaceae_F_Zehneria_scabra|:0.0000009993,Dacus_triater_Cucurbitaceae_F_Zehneria_scabra|:0.0000009993):0.0516386062):0.0682597696):0.0169524055,((Dacus_eclipsis_Passifloraceae_F_Adenia_gummifera|:0.1177122775,Dacus_limbipennis_Cucurbitaceae_F_Momordica_cissoides|_Cucurbitaceae_F_Momordica_foetida|:0.1132810173):0.0121999115,(Dacus_pleuralis_Cucurbitaceae_F_Lagenaria_sphaerica|:0.1323782765,(Dacus_punctatifrons_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Diplocyclos_palmatus|_Cucurbitaceae_F_Lagenaria_sphaerica|_Cucurbitaceae_F_Momordica_trifoliolata|_Cucurbitaceae_F_Peponium_vogelii|_Cucurbitaceae_F_Zehneria_scabra|:0.1124694748,Dacus_sphaeristicus_Cucurbitaceae_F_Momordica_foetida|:0.0942854011):0.0126594243):0.0234450397):0.0383459526):0.0230066822,Dacus_vertebratus_Cucurbitaceae_F_Cucumis_aculeatus|_Cucurbitaceae_F_Cucumis_dipsaceus|:0.1485768978):0.0245337139):0.0302574563):0.0679333833);"
      );
      //       console.log(data);
      //     })
      //     .catch((error) => {
      //       console.error(error);
      //     });
      // }
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
  // handle input fasta sequence
  const handleInputChangefasta = (event) => {
    setFastaInput(event.target.value);
    if (fastaInput) {
      // remove current family name

      console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
      const fastaLines = fastaInput.trim().split("\n");
      let currentSequenceName = "";
      let currentSequence = "";
      const fastaArray = [];
      for (const line of fastaLines) {
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
      for (const entry of fastaArray) {
        fastaObject[entry.name] = entry.sequence;
      }
      setFastaArray(fastaObject);
      console.log("fastaArray");
      if (fastaArray) {
        setSelectedFamily("Select family");
        // retrieve the data from back end API
        console.log("input  sequences format");
        console.log(fastaArray);

        // var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);
        console.log("plant newick from mafttttttttttt");
        const requestBody = {
          sequences: fastaObject,
        };

        fetch(`${base_url}/api/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error(`Error: ${response.status}`);
            }
            return response.json();
          })
          .then((data) => {
            const { newick } = data;
            setNewickData(newick);
            console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
        // const newick = await Mafft(sequences);

        console.log(newick);

        console.log("plant newick");
        // setNewickData(newick);

        // console.log(fastaArray);
        // var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        // var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    } else if (fastaArray && userSequences) {
      setSelectedFamily("Select family");

      // console.log(fastaArray);
      // add suser sequences to existing sequences
      const result = CalculateSimilarityMatrixModified(
        [...fastaArray, ...Download],
        kmer
      );
      console.log("user plus existing sequences");
      console.log("Download");

      console.log(Download);
      console.log("fastaArray");

      console.log(fastaArray);

      // var result = CalculateSimilarityMatrix(sequences);

      var newick = NeighborJoining(result.dist_mat, result.names);
      console.log("newick");
      setNewickData(newick);
      setDownload(newick);
    }
    setSelectedFamily("");
  };

  // handle input of newick
  const handleInputChangenewick = (event) => {
    event.preventDefault();
    setNewickInput(event.target.value);

    // setSelectedFamily("Select family");
    setSelectedFamily("Select family");
    setSelectedOrder("Select order");

    console.log("newick input");
    // console.log(newickInput);
    console.log("newick input");
    setNewickData(newickInput);
    setDownload(newickInput);

    // delete newick input on sub
  };
  // handle input data
  const handleSubmitnewick = (event) => {
    event.preventDefault();
    // setNewickData(event.target.value);

    handleInputChangenewick(event);
    // delete newick input on submit
    setNewickInput("");
  };

  // handle uploding newick
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
        console.log("File contents:", fileContents);
        // setFastaInput(fileContents);
      };

      // Clear the file input value
      // event.target.querySelector('input[type="file"]').value = "";

      // Read the file as text
      reader.readAsText(selectedFile);
      setSelectedFamily("Select family");

      console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
      // event.preventDefault();
      const fastaLines = fastaInput.trim().split("\n");
      let currentSequenceName = "";
      let currentSequence = "";
      const fastaArray = [];
      for (const line of fastaLines) {
        if (line.startsWith(">")) {
          if (currentSequenceName !== "") {
            console.log("currentSequenceName");

            console.log(
              currentSequenceName.slice(1).split(" ").slice(0, 2).join("-")
            );
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
      console.log("fastaArray");
      if (fastaArray) {
        // console.log(fastaArray);
        const result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        const newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    }
    setFastaInput("");
  };
  // conditional rendering with data
  if (isLoading) {
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
  }

  if (data) {
    // setIsLoadingData(false); // Set loading state to false
    // ...

    if (selectedOrganism === "plants") {
      const families =
        // return only families wth atleas two matk sequences
        data.filter(
          (species) =>
            species.plant_genera.plant_families.family_name &&
            species.plants_matk.length > 0
        );
      // obtain families only with matk sequences, get the set of the kmers, convert to list [...]
      const families_list = [
        ...new Set(
          families
            .map((family) => family.plant_genera.plant_families.family_name)
            .sort()
        ),
      ]; // Convert set to array
      console.log("familes");

      // console.log(families);
      var filteredData = data.filter((dat) => dat.plants_insects.length > 0);
    } else {
      // render insects phylogeny
      console.log("insects");
      if (selectedOrganism === "insects") {
        const orders = new Set(
          data.map((species) => species.insect_families.family_name)
        );

        const insect_orders_list = [...orders]; // Convert set to array
        console.log("orders");

        // console.log(orders);
        var insectFilteredData = data.filter(
          (dat) => dat.plants_insects.length > 0
        );
        console.log("insect filteredData");
        const insect_famililes = data.filter(
          (entry) =>
            entry.plants_insects.length > 0 &&
            entry.insect_orders.order_name === "Lepidoptera"
        );
        console.log("plants_famililes");

        // console.log(filteredData);
      }
    }
    return (
      <Container sx={{ marginTop: 10 }}>
        {/* <ConverttoFasta></ConverttoFasta> */}
        <Box sx={{ display: isSmallScreen ? "row" : "flex" }}>
          <Box sx={{ display: "flex" }}>
            <Box>
              <FormControl>
                <InputLabel>select organism</InputLabel>
                <Select
                  value={selectedOrganism}
                  onChange={handleOrganismChange}
                >
                  <MenuItem value="plants">
                    plants matK and predator insects
                  </MenuItem>
                  <MenuItem value="insects">
                    insects-coi and host plants
                  </MenuItem>
                </Select>
              </FormControl>
            </Box>
          </Box>
          <Box>
            <Button onClick={handleClick}>Back to phylogeny page</Button>
          </Box>
        </Box>{" "}
        <Box>
          {newickData ? (
            <iframe
              ref={iframeRef}
              src={`/phylotree.html?newickData=${newickData}`}
              style={{
                position: "relative",
                top: 3,
                left: 2,
                width: "100%", // Set a fixed width
                height: "100vh", // Set a fixed height
              }}
            />
          ) : (
            <Box
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                height: "100vh",
              }}
            >
              <p>Please wait Constructing phylogenetics tree...</p>
            </Box>
          )}
        </Box>
      </Container>
    );
  }
}
