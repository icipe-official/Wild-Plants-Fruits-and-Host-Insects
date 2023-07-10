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
  const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";
  const fetcher = async (url) => {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  };
  const plant =
    "(Bactrocera_amplexa_22_13_Olacaceae_F_Strombosia_scheffleri|:0.0919358627,(Bactrocera_munroi_24_13_Oleaceae_F_Olea_welwitschii|:0.0388361238,Bactrocera_oleae_29_13_Oleaceae_F_Olea_europaea|:0.0664028857)98:0.0824644309,(((((((Capparimyia_melanaspis_98_21_Capparaceae_F_Boscia_angustifolia|_Capparaceae_F_Boscia_coriacea|_Capparaceae_F_Maerua_angolensis|:0.0700263109,((((Carpophilus_fumatus_100_23_Sapotaceae_F_Chrysophylum_albidum|_Flagellariaceae_F_Flagellaria_guine__nsis|_Vitaceae_F_Leea_guineensis|_Rubiaceae_F_Rothmannia_urcelliformis|_Solanaceae_F_Solanum_sp.|_Myrtaceae_F_Syzygium_guineense|:0.2114615566,(Psyttalia_concolor_426_137_Simaroubaceae_F_Harrisonia_abyssinica|_Oleaceae_F_Olea_europaea|:0.1177551929,Psyttalia_lounsburyi_428_137_Oleaceae_F_Olea_europaea|_Olacaceae_F_Strombosia_scheffleri|:0.0941084222)81:0.1355654536)100:0.6351622920,Megastigmus_transvaalensis_339_96_Anacardiaceae_F_Searsia_natalensis|:1.1144266743)86:0.2359208481,Deudorix_dinochares_328_92_Rubiaceae_F_Catunaregam_nilotica|_Sapindaceae_F_Deinbollia_borbonica|_Connaraceae_F_Ellipanthus_madagascariensis|_Sapindaceae_F_Lecaniodiscus_fraxinifolius|_Sapindaceae_F_Lepisanthes_senegalensis|_Sapindaceae_F_Majidea_zangueba:0.0385865551)58:0.0320264691,((((Prochoristis_calamochroa_114_27_Capparaceae_F_Boscia_coriacea|:0.0991875548,Hydrillodes_uliginosalis_379_114_Achariaceae_F_Rawsonia_lucida|:0.0876914929)49:0.0198522373,(Dolicharthria_lanceolalis_171_40_Oleaceae_F_Olea_welwitschii|_Rutaceae_F_Vepris_nobilis|:0.0822172772,Palpita_unionalis_172_41_Sapotaceae_F_Englerophytum_oblanceolatum|_Oleaceae_F_Jasminum_fluminense|:0.0751469923)64:0.0287383668)19:0.0140899536,(Agrotera_citrina_169_38_Phyllanthaceae_F_Phyllanthus_reticulatus|:0.0932589708,(Prophantis_smaragdina_174_43_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Oxyanthus_goetzei|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_multiflora|_Rubiaceae_F_Psydrax_polhillii|_Rubiaceae_F_Tricalysia_microphyla|_Rubiaceae_F_Empogon:0.0412439613,Thliptoceras_xanthomeralis_176_45_Rubiaceae_F_Calycosiphonia_spathicalyx|_Rubiaceae_F_Leptactina_platyphylla|_Rubiaceae_F_Oxyanthus_speciosus|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_parvifolia|:0.0559773693)32:0.0134938126)12:0.0056692057)27:0.0292439433,Metendothenia_balanacma_479_154_Sapindaceae_F_Lepisanthes_senegalensis|:0.1578000698)57:0.0355168383)100:0.2238442431)30:0.0320996722,(Celidodacus_obnubilus_138_29_Fabaceae_F_Canavalia_africana|_Fabaceae_F_Canavalia_cathartica|:0.1334009110,Perilampsis|pulchella_403_128_Loranthaceae_F_Agelanthus_sp.|:0.0861589998)48:0.0297351992)12:0.0400346159,(((((((Ceratiti_anonae_115_28_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Sapotaceae_F_Englerophytum_oblanceolatum|_Rosaceae_F_Rhaphiolepis_bibas|_Rubiaceae_F_Leptactina_platyphylla|_Moraceae_F_Morus_mesozygia:0.0123684911,Ceratitis_rosa_149_28_Sapindaceae_F_Allophylus_pervillei|_Fabaceae_F_Angylocalyx_braunii|_Annonaceae_F_Annona_senegalensis|_Rubiaceae_F_Calycosiphonia_spathicalyx|_Apocynaceae_F_Dictyophleba_lucida|_Putranjivaceae_F_Drypetes_natalensis|_Putranjivaceae_F_:0.0161070152)51:0.0040022563,Ceratitis_fasciventris_134_28_Apocynaceae_F_Acokanthera_schimperi|_Annonaceae_F_Annona_senegalensis|_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Salicaceae_F_Dovyalis_caffra|_Putranjivaceae_F_Drypetes_ge:0.0153674641)62:0.0113958826,(Ceratitis|flexuosa_135_28_Moraceae_F_Antiaris_toxicaria|:0.0438368864,Ceratitis|rubivora_150_28_Rosaceae_F_Rubus_apetalus|_Rosaceae_F_Rubus_keniensis|_Rosaceae_F_Rubus_niveus|_Rosaceae_F_Rubus_pinnatus|_Rosaceae_F_Rubus_rigidus|_Rosaceae_F_Rubus_scheffleri|_Rosaceae_F_Rubus_steudneri|:0.0347164867)27:0.0070404864)25:0.0052899836,Ceratitis_copelandi_141_28_Sapotaceae_F_Chrysophylum_gorungosanum|_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Dovyalis_abyssinica|_Sapotaceae_F_Englerophytum_natalense|_Annonaceae_F_Monanthotaxis_parvifolia|_Achariaceae_F_Rawsonia_lucida|_Sapotaceae_:0.0417856356)41:0.0107809214,(((Ceratitis_caetrata_120_28_Apocynaceae_F_Carissa_spinarum|_Ebenaceae_F_Euclea_divinorum|_Sapotaceae_F_Manilkara_butugi|_Sapotaceae_F_Mimusops_bagshawei|:0.0049216398,Ceratitis_capitata_121_28_Apocynaceae_F_Acokanthera_oppositifolia|_Apocynaceae_F_Acokanthera_schimperi|_Euphorbiaceae_F_Antidesma_venosum|_Annonaceae_F_Artabotrys_monteiroae|_Salvadoraceae_F_Azima_tetracantha|_Boraginaceae_F_Bourreria_petiolaris|_Cappara:0.0047283229)99:0.0667878714,Ceratitis_querita_146_28_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Ludia_mauritiana|_Loganiaceae_F_Strychnos_mitis|:0.0420361192)18:0.0168907589,((Ceratitis_cornuta_124_28_Rubiaceae_F_Oxyanthus_speciosus|:0.1064924340,Ceratitis|pedestris_143_28_Loganiaceae_F_Strychnos_madagascariensis|:0.0667795176)43:0.0223852398,(Ceratitis_gravinotata_136_28_Podocarpaceae_F_Afrocarpus_gracilior|:0.0419633261,Ceratitis_podocarpi_145_28_Podocarpaceae_F_Afrocarpus_gracilior|:0.0070301445)88:0.0226480095)28:0.0097106222)15:0.0116398899)42:0.0210437476,(((Ceratitis_cosyra_125_28_Annonaceae_F_Annona_muricata|_Annonaceae_F_Annona_senegalensis|_Fabaceae_F_Cordyla_africana|_Apocynaceae_F_Landolphia_sp.|_Anacardiaceae_F_Mangifera_indica|_Apocynaceae_F_Saba_comorensis|_Anacardiaceae_F_Sclerocarya_birrea|_Canell:0.0655588176,Ceratitis_discussa_129_28_Annonaceae_F_Annona_senegalensis|:0.0450094139)71:0.0198987733,Ceratitis|striatella_155_28_Apocynaceae_F_Dictyophleba_lucida|:0.0650406051)85:0.0315614936,Ceratitis|oraria_154_28_Celastraceae_F_Salacia_leptoclada|:0.1007265993)57:0.0283620923)21:0.0117507817,(((Ceratitis_bremii_118_28_Sapotaceae_F_Pouteria_alnifolia|_Sapotaceae_F_Pouteria_altissima|:0.0762872103,(((Ceratitis_cuthbertsoni_128_28_Apocynaceae_F_Tabernaemontana_stapfiana|:0.0516528227,Ceratitis_edwardsi_133_28_Apocynaceae_F_Tabernaemontana_ventricosa|:0.0553172319)56:0.0114350351,Ceratitis|millicentae_131_28_Apocynaceae_F_Ancylobothrys_petersiana|_Rutaceae_F_Vepris_sp.|_Apocynaceae_F_Tabernaemontana_elegans|:0.0460055959)56:0.0165617433,Ceratitis_ditissima_130_28_Sapotaceae_F_Chrysophylum_albidum|:0.0841374476)74:0.0240968847)100:0.0709261605,(Ceratitis_marriotti_140_28_Solanaceae_F_Solanum_anguivi|_Solanaceae_F_Solanum_schumannianum|:0.0675369720,Trirhithrum_overlaeti_576_185_Solanaceae_F_Solanum_terminale|:0.0879423957)85:0.0583188674)8:0.0020370514,(Ceratitis_stictica_152_28_Rubiaceae_F_Craterispermum_schweinfurthii|:0.1030891709,((((Trirhithrum_coffeae_561_185_Rubiaceae_F_Coffea_arabica|_Rubiaceae_F_Coffea_eugenioides|:0.0415418407,(Trirhithrum_fraternum_565_185_Rubiaceae_F_Craterispermum_schweinfurthii|:0.0072932531,Trirhithrum_nigerrimum_572_185_Vitaceae_F_Ampelocissus_africana|_Euphorbiaceae_F_Antidesma_venosum|_Boraginaceae_F_Bourreria_petiolaris|_Apocynaceae_F_Carissa_tetramera|_Vitaceae_F_Afrocayratia_gracilis|_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Eum:0.0161768962)57:0.0092383323)96:0.0305834558,(Trirhithru_|meladiscum_570_185_Rubiaceae_F_Chassalia_discolor|_Rubiaceae_F_Chassalia_kenyensis|_Rubiaceae_F_Chassalia_parvifolia|_Rubiaceae_F_Lasianthus_kilimandscharicus|_Rubiaceae_F_Psychotria_fractinervata|_Rubiaceae_F_Psychotria_mahonii|_Rubiaceae_F_:0.0698177891,Trirhithrum_senex_578_185_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Geophila_uniflora|_Rubiaceae_F_Psychotria_alsophila|_Rubiaceae_F_Psychotria_amboniana|_Rubiaceae_F_Psychotria_capensis|_Rubiaceae_F_Psychotria_faucicola|_Rubiaceae_F_Psychotria_holt:0.0705308907)85:0.0212527814)57:0.0066750621,Trirhithrum_culcasiae_562_185_Araceae_F_Culcasia_falcifolia|_Araceae_F_Culcasia_orientalis|:0.1313178670)40:0.0126850549,Trirhithrum_teres_581_185_Rubiaceae_F_Eumachia_abrupta|:0.0748021326)35:0.0109410451)30:0.0129899886)7:0.0084579622)12:0.0336818360)17:0.0000028621,Carpophthoromyia_dimidiata_99_22_Putranjivaceae_F_Drypetes_gerrardii|:0.2026671041)25:0.0286488479,Munromyia_whartoni_362_104_Oleaceae_F_Noronhia_nilotica|:0.2280360676)25:0.0167906786,Ceratitis_connexa_122_28_Sapotaceae_F_Synsepalum_brevipes|_Canellaceae_F_Warburgia_ugandensis|:0.2023995955)40:0.0302222129,((Dacus_arcuatus_181_47_Apocynaceae_F_Pergularia_daemia|:0.0802674423,Dacus|tenebricus_207_47_Apocynaceae_F_Gomphocarpus_semilunatus|:0.0580832486)100:0.1268180037,((((Dacus_ciliatus_187_47_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Corallocarpus_ellipticus|_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Kedrostis_foetidissima|:0.1005414578,Dacus|frontalis_189_47_Cucurbitaceae_F_Coccinia_grandis|_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Cucumis_prophetarum|:0.0666893318)86:0.0580588571,(Dacus_phloginus_197_47_Cucurbitaceae_F_Zehneria_minutiflora|:0.0545064714,(Dacus_apostata_200_47_Cucurbitaceae_F_Zehneria_scabra|:0.0000009997,Dacus|triater_208_47_Cucurbitaceae_F_Zehneria_scabra|:0.0000009997)100:0.0514334222)100:0.0678390731)32:0.0165943112,((Dacus_eclipsis_188_47_Passifloraceae_F_Adenia_gummifera|:0.1165984754,Dacus_limbipennis_194_47_Cucurbitaceae_F_Momordica_cissoides|_Cucurbitaceae_F_Momordica_foetida|:0.1122499579)34:0.0128667828,(Dacus|pleuralis_198_47_Cucurbitaceae_F_Lagenaria_sphaerica|:0.1318666535,(Dacus|punctatifrons_199_47_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Diplocyclos_palmatus|_Cucurbitaceae_F_Lagenaria_sphaerica|_Cucurbitaceae_F_Momordica_trifoliolata|_Cucurbitaceae_F_Peponium_vogelii|_Cucurbitaceae_F_Zehneria_scabra|:0.1117146308,Dacus|sphaeristicus_205_47_Cucurbitaceae_F_Momordica_foetida|:0.0934660765)35:0.0128100836)36:0.0231781286)56:0.0380803800)49:0.0229277063,Dacus_vertebratus_210_47_Cucurbitaceae_F_Cucumis_aculeatus|_Cucurbitaceae_F_Cucumis_dipsaceus|:0.1478606914)39:0.0243752285)45:0.0291078628)82:0.0676048884);";
  // When the selected organism changes, clear the previous data
  // Event handler for updating the selected organism
  // Create the URL based on the selected organism
  const url = `${base_url}/api/${selectedOrganism}/species`;

  const { data, error, isLoading } = useSWR(url, fetcher);
  console.log(data);
  const [newickData, setNewickData] = useState(
    "(Bactrocera_amplexa_22_13_Olacaceae_F_Strombosia_scheffleri|:0.0919358627,(Bactrocera_munroi_24_13_Oleaceae_F_Olea_welwitschii|:0.0388361238,Bactrocera_oleae_29_13_Oleaceae_F_Olea_europaea|:0.0664028857)98:0.0824644309,(((((((Capparimyia_melanaspis_98_21_Capparaceae_F_Boscia_angustifolia|_Capparaceae_F_Boscia_coriacea|_Capparaceae_F_Maerua_angolensis|:0.0700263109,((((Carpophilus_fumatus_100_23_Sapotaceae_F_Chrysophylum_albidum|_Flagellariaceae_F_Flagellaria_guine__nsis|_Vitaceae_F_Leea_guineensis|_Rubiaceae_F_Rothmannia_urcelliformis|_Solanaceae_F_Solanum_sp.|_Myrtaceae_F_Syzygium_guineense|:0.2114615566,(Psyttalia_concolor_426_137_Simaroubaceae_F_Harrisonia_abyssinica|_Oleaceae_F_Olea_europaea|:0.1177551929,Psyttalia_lounsburyi_428_137_Oleaceae_F_Olea_europaea|_Olacaceae_F_Strombosia_scheffleri|:0.0941084222)81:0.1355654536)100:0.6351622920,Megastigmus_transvaalensis_339_96_Anacardiaceae_F_Searsia_natalensis|:1.1144266743)86:0.2359208481,Deudorix_dinochares_328_92_Rubiaceae_F_Catunaregam_nilotica|_Sapindaceae_F_Deinbollia_borbonica|_Connaraceae_F_Ellipanthus_madagascariensis|_Sapindaceae_F_Lecaniodiscus_fraxinifolius|_Sapindaceae_F_Lepisanthes_senegalensis|_Sapindaceae_F_Majidea_zangueba:0.0385865551)58:0.0320264691,((((Prochoristis_calamochroa_114_27_Capparaceae_F_Boscia_coriacea|:0.0991875548,Hydrillodes_uliginosalis_379_114_Achariaceae_F_Rawsonia_lucida|:0.0876914929)49:0.0198522373,(Dolicharthria_lanceolalis_171_40_Oleaceae_F_Olea_welwitschii|_Rutaceae_F_Vepris_nobilis|:0.0822172772,Palpita_unionalis_172_41_Sapotaceae_F_Englerophytum_oblanceolatum|_Oleaceae_F_Jasminum_fluminense|:0.0751469923)64:0.0287383668)19:0.0140899536,(Agrotera_citrina_169_38_Phyllanthaceae_F_Phyllanthus_reticulatus|:0.0932589708,(Prophantis_smaragdina_174_43_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Oxyanthus_goetzei|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_multiflora|_Rubiaceae_F_Psydrax_polhillii|_Rubiaceae_F_Tricalysia_microphyla|_Rubiaceae_F_Empogon:0.0412439613,Thliptoceras_xanthomeralis_176_45_Rubiaceae_F_Calycosiphonia_spathicalyx|_Rubiaceae_F_Leptactina_platyphylla|_Rubiaceae_F_Oxyanthus_speciosus|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_parvifolia|:0.0559773693)32:0.0134938126)12:0.0056692057)27:0.0292439433,Metendothenia_balanacma_479_154_Sapindaceae_F_Lepisanthes_senegalensis|:0.1578000698)57:0.0355168383)100:0.2238442431)30:0.0320996722,(Celidodacus_obnubilus_138_29_Fabaceae_F_Canavalia_africana|_Fabaceae_F_Canavalia_cathartica|:0.1334009110,Perilampsis|pulchella_403_128_Loranthaceae_F_Agelanthus_sp.|:0.0861589998)48:0.0297351992)12:0.0400346159,(((((((Ceratiti_anonae_115_28_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Sapotaceae_F_Englerophytum_oblanceolatum|_Rosaceae_F_Rhaphiolepis_bibas|_Rubiaceae_F_Leptactina_platyphylla|_Moraceae_F_Morus_mesozygia:0.0123684911,Ceratitis_rosa_149_28_Sapindaceae_F_Allophylus_pervillei|_Fabaceae_F_Angylocalyx_braunii|_Annonaceae_F_Annona_senegalensis|_Rubiaceae_F_Calycosiphonia_spathicalyx|_Apocynaceae_F_Dictyophleba_lucida|_Putranjivaceae_F_Drypetes_natalensis|_Putranjivaceae_F_:0.0161070152)51:0.0040022563,Ceratitis_fasciventris_134_28_Apocynaceae_F_Acokanthera_schimperi|_Annonaceae_F_Annona_senegalensis|_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Salicaceae_F_Dovyalis_caffra|_Putranjivaceae_F_Drypetes_ge:0.0153674641)62:0.0113958826,(Ceratitis|flexuosa_135_28_Moraceae_F_Antiaris_toxicaria|:0.0438368864,Ceratitis|rubivora_150_28_Rosaceae_F_Rubus_apetalus|_Rosaceae_F_Rubus_keniensis|_Rosaceae_F_Rubus_niveus|_Rosaceae_F_Rubus_pinnatus|_Rosaceae_F_Rubus_rigidus|_Rosaceae_F_Rubus_scheffleri|_Rosaceae_F_Rubus_steudneri|:0.0347164867)27:0.0070404864)25:0.0052899836,Ceratitis_copelandi_141_28_Sapotaceae_F_Chrysophylum_gorungosanum|_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Dovyalis_abyssinica|_Sapotaceae_F_Englerophytum_natalense|_Annonaceae_F_Monanthotaxis_parvifolia|_Achariaceae_F_Rawsonia_lucida|_Sapotaceae_:0.0417856356)41:0.0107809214,(((Ceratitis_caetrata_120_28_Apocynaceae_F_Carissa_spinarum|_Ebenaceae_F_Euclea_divinorum|_Sapotaceae_F_Manilkara_butugi|_Sapotaceae_F_Mimusops_bagshawei|:0.0049216398,Ceratitis_capitata_121_28_Apocynaceae_F_Acokanthera_oppositifolia|_Apocynaceae_F_Acokanthera_schimperi|_Euphorbiaceae_F_Antidesma_venosum|_Annonaceae_F_Artabotrys_monteiroae|_Salvadoraceae_F_Azima_tetracantha|_Boraginaceae_F_Bourreria_petiolaris|_Cappara:0.0047283229)99:0.0667878714,Ceratitis_querita_146_28_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Ludia_mauritiana|_Loganiaceae_F_Strychnos_mitis|:0.0420361192)18:0.0168907589,((Ceratitis_cornuta_124_28_Rubiaceae_F_Oxyanthus_speciosus|:0.1064924340,Ceratitis|pedestris_143_28_Loganiaceae_F_Strychnos_madagascariensis|:0.0667795176)43:0.0223852398,(Ceratitis_gravinotata_136_28_Podocarpaceae_F_Afrocarpus_gracilior|:0.0419633261,Ceratitis_podocarpi_145_28_Podocarpaceae_F_Afrocarpus_gracilior|:0.0070301445)88:0.0226480095)28:0.0097106222)15:0.0116398899)42:0.0210437476,(((Ceratitis_cosyra_125_28_Annonaceae_F_Annona_muricata|_Annonaceae_F_Annona_senegalensis|_Fabaceae_F_Cordyla_africana|_Apocynaceae_F_Landolphia_sp.|_Anacardiaceae_F_Mangifera_indica|_Apocynaceae_F_Saba_comorensis|_Anacardiaceae_F_Sclerocarya_birrea|_Canell:0.0655588176,Ceratitis_discussa_129_28_Annonaceae_F_Annona_senegalensis|:0.0450094139)71:0.0198987733,Ceratitis|striatella_155_28_Apocynaceae_F_Dictyophleba_lucida|:0.0650406051)85:0.0315614936,Ceratitis|oraria_154_28_Celastraceae_F_Salacia_leptoclada|:0.1007265993)57:0.0283620923)21:0.0117507817,(((Ceratitis_bremii_118_28_Sapotaceae_F_Pouteria_alnifolia|_Sapotaceae_F_Pouteria_altissima|:0.0762872103,(((Ceratitis_cuthbertsoni_128_28_Apocynaceae_F_Tabernaemontana_stapfiana|:0.0516528227,Ceratitis_edwardsi_133_28_Apocynaceae_F_Tabernaemontana_ventricosa|:0.0553172319)56:0.0114350351,Ceratitis|millicentae_131_28_Apocynaceae_F_Ancylobothrys_petersiana|_Rutaceae_F_Vepris_sp.|_Apocynaceae_F_Tabernaemontana_elegans|:0.0460055959)56:0.0165617433,Ceratitis_ditissima_130_28_Sapotaceae_F_Chrysophylum_albidum|:0.0841374476)74:0.0240968847)100:0.0709261605,(Ceratitis_marriotti_140_28_Solanaceae_F_Solanum_anguivi|_Solanaceae_F_Solanum_schumannianum|:0.0675369720,Trirhithrum_overlaeti_576_185_Solanaceae_F_Solanum_terminale|:0.0879423957)85:0.0583188674)8:0.0020370514,(Ceratitis_stictica_152_28_Rubiaceae_F_Craterispermum_schweinfurthii|:0.1030891709,((((Trirhithrum_coffeae_561_185_Rubiaceae_F_Coffea_arabica|_Rubiaceae_F_Coffea_eugenioides|:0.0415418407,(Trirhithrum_fraternum_565_185_Rubiaceae_F_Craterispermum_schweinfurthii|:0.0072932531,Trirhithrum_nigerrimum_572_185_Vitaceae_F_Ampelocissus_africana|_Euphorbiaceae_F_Antidesma_venosum|_Boraginaceae_F_Bourreria_petiolaris|_Apocynaceae_F_Carissa_tetramera|_Vitaceae_F_Afrocayratia_gracilis|_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Eum:0.0161768962)57:0.0092383323)96:0.0305834558,(Trirhithru_|meladiscum_570_185_Rubiaceae_F_Chassalia_discolor|_Rubiaceae_F_Chassalia_kenyensis|_Rubiaceae_F_Chassalia_parvifolia|_Rubiaceae_F_Lasianthus_kilimandscharicus|_Rubiaceae_F_Psychotria_fractinervata|_Rubiaceae_F_Psychotria_mahonii|_Rubiaceae_F_:0.0698177891,Trirhithrum_senex_578_185_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Geophila_uniflora|_Rubiaceae_F_Psychotria_alsophila|_Rubiaceae_F_Psychotria_amboniana|_Rubiaceae_F_Psychotria_capensis|_Rubiaceae_F_Psychotria_faucicola|_Rubiaceae_F_Psychotria_holt:0.0705308907)85:0.0212527814)57:0.0066750621,Trirhithrum_culcasiae_562_185_Araceae_F_Culcasia_falcifolia|_Araceae_F_Culcasia_orientalis|:0.1313178670)40:0.0126850549,Trirhithrum_teres_581_185_Rubiaceae_F_Eumachia_abrupta|:0.0748021326)35:0.0109410451)30:0.0129899886)7:0.0084579622)12:0.0336818360)17:0.0000028621,Carpophthoromyia_dimidiata_99_22_Putranjivaceae_F_Drypetes_gerrardii|:0.2026671041)25:0.0286488479,Munromyia_whartoni_362_104_Oleaceae_F_Noronhia_nilotica|:0.2280360676)25:0.0167906786,Ceratitis_connexa_122_28_Sapotaceae_F_Synsepalum_brevipes|_Canellaceae_F_Warburgia_ugandensis|:0.2023995955)40:0.0302222129,((Dacus_arcuatus_181_47_Apocynaceae_F_Pergularia_daemia|:0.0802674423,Dacus|tenebricus_207_47_Apocynaceae_F_Gomphocarpus_semilunatus|:0.0580832486)100:0.1268180037,((((Dacus_ciliatus_187_47_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Corallocarpus_ellipticus|_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Kedrostis_foetidissima|:0.1005414578,Dacus|frontalis_189_47_Cucurbitaceae_F_Coccinia_grandis|_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Cucumis_prophetarum|:0.0666893318)86:0.0580588571,(Dacus_phloginus_197_47_Cucurbitaceae_F_Zehneria_minutiflora|:0.0545064714,(Dacus_apostata_200_47_Cucurbitaceae_F_Zehneria_scabra|:0.0000009997,Dacus|triater_208_47_Cucurbitaceae_F_Zehneria_scabra|:0.0000009997)100:0.0514334222)100:0.0678390731)32:0.0165943112,((Dacus_eclipsis_188_47_Passifloraceae_F_Adenia_gummifera|:0.1165984754,Dacus_limbipennis_194_47_Cucurbitaceae_F_Momordica_cissoides|_Cucurbitaceae_F_Momordica_foetida|:0.1122499579)34:0.0128667828,(Dacus|pleuralis_198_47_Cucurbitaceae_F_Lagenaria_sphaerica|:0.1318666535,(Dacus|punctatifrons_199_47_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Diplocyclos_palmatus|_Cucurbitaceae_F_Lagenaria_sphaerica|_Cucurbitaceae_F_Momordica_trifoliolata|_Cucurbitaceae_F_Peponium_vogelii|_Cucurbitaceae_F_Zehneria_scabra|:0.1117146308,Dacus|sphaeristicus_205_47_Cucurbitaceae_F_Momordica_foetida|:0.0934660765)35:0.0128100836)36:0.0231781286)56:0.0380803800)49:0.0229277063,Dacus_vertebratus_210_47_Cucurbitaceae_F_Cucumis_aculeatus|_Cucurbitaceae_F_Cucumis_dipsaceus|:0.1478606914)39:0.0243752285)45:0.0291078628)82:0.0676048884);"
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
      setNewickData(plant);
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
        "(Bactrocera_amplexa_22_13_Olacaceae_F_Strombosia_scheffleri|:0.0919358627,(Bactrocera_munroi_24_13_Oleaceae_F_Olea_welwitschii|:0.0388361238,Bactrocera_oleae_29_13_Oleaceae_F_Olea_europaea|:0.0664028857)98:0.0824644309,(((((((Capparimyia_melanaspis_98_21_Capparaceae_F_Boscia_angustifolia|_Capparaceae_F_Boscia_coriacea|_Capparaceae_F_Maerua_angolensis|:0.0700263109,((((Carpophilus_fumatus_100_23_Sapotaceae_F_Chrysophylum_albidum|_Flagellariaceae_F_Flagellaria_guine__nsis|_Vitaceae_F_Leea_guineensis|_Rubiaceae_F_Rothmannia_urcelliformis|_Solanaceae_F_Solanum_sp.|_Myrtaceae_F_Syzygium_guineense|:0.2114615566,(Psyttalia_concolor_426_137_Simaroubaceae_F_Harrisonia_abyssinica|_Oleaceae_F_Olea_europaea|:0.1177551929,Psyttalia_lounsburyi_428_137_Oleaceae_F_Olea_europaea|_Olacaceae_F_Strombosia_scheffleri|:0.0941084222)81:0.1355654536)100:0.6351622920,Megastigmus_transvaalensis_339_96_Anacardiaceae_F_Searsia_natalensis|:1.1144266743)86:0.2359208481,Deudorix_dinochares_328_92_Rubiaceae_F_Catunaregam_nilotica|_Sapindaceae_F_Deinbollia_borbonica|_Connaraceae_F_Ellipanthus_madagascariensis|_Sapindaceae_F_Lecaniodiscus_fraxinifolius|_Sapindaceae_F_Lepisanthes_senegalensis|_Sapindaceae_F_Majidea_zangueba:0.0385865551)58:0.0320264691,((((Prochoristis_calamochroa_114_27_Capparaceae_F_Boscia_coriacea|:0.0991875548,Hydrillodes_uliginosalis_379_114_Achariaceae_F_Rawsonia_lucida|:0.0876914929)49:0.0198522373,(Dolicharthria_lanceolalis_171_40_Oleaceae_F_Olea_welwitschii|_Rutaceae_F_Vepris_nobilis|:0.0822172772,Palpita_unionalis_172_41_Sapotaceae_F_Englerophytum_oblanceolatum|_Oleaceae_F_Jasminum_fluminense|:0.0751469923)64:0.0287383668)19:0.0140899536,(Agrotera|citrina_169_38_Phyllanthaceae_F_Phyllanthus_reticulatus|:0.0932589708,(Prophantis_smaragdina_174_43_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Oxyanthus_goetzei|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_multiflora|_Rubiaceae_F_Psydrax_polhillii|_Rubiaceae_F_Tricalysia_microphyla|_Rubiaceae_F_Empogon:0.0412439613,Thliptoceras_xanthomeralis_176_45_Rubiaceae_F_Calycosiphonia_spathicalyx|_Rubiaceae_F_Leptactina_platyphylla|_Rubiaceae_F_Oxyanthus_speciosus|_Rubiaceae_F_Oxyanthus_zanguebaricus|_Rubiaceae_F_Polysphaeria_parvifolia|:0.0559773693)32:0.0134938126)12:0.0056692057)27:0.0292439433,Metendothenia_balanacma_479_154_Sapindaceae_F_Lepisanthes_senegalensis|:0.1578000698)57:0.0355168383)100:0.2238442431)30:0.0320996722,(Celidodacus_obnubilus_138_29_Fabaceae_F_Canavalia_africana|_Fabaceae_F_Canavalia_cathartica|:0.1334009110,Perilampsis|pulchella_403_128_Loranthaceae_F_Agelanthus_sp.|:0.0861589998)48:0.0297351992)12:0.0400346159,(((((((Ceratiti_anonae_115_28_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Sapotaceae_F_Englerophytum_oblanceolatum|_Rosaceae_F_Rhaphiolepis_bibas|_Rubiaceae_F_Leptactina_platyphylla|_Moraceae_F_Morus_mesozygia:0.0123684911,Ceratitis_rosa_149_28_Sapindaceae_F_Allophylus_pervillei|_Fabaceae_F_Angylocalyx_braunii|_Annonaceae_F_Annona_senegalensis|_Rubiaceae_F_Calycosiphonia_spathicalyx|_Apocynaceae_F_Dictyophleba_lucida|_Putranjivaceae_F_Drypetes_natalensis|_Putranjivaceae_F_:0.0161070152)51:0.0040022563,Ceratitis|fasciventris_134_28_Apocynaceae_F_Acokanthera_schimperi|_Annonaceae_F_Annona_senegalensis|_Moraceae_F_Antiaris_toxicaria|_Annonaceae_F_Artabotrys_monteiroae|_Rubiaceae_F_Coffea_arabica|_Salicaceae_F_Dovyalis_caffra|_Putranjivaceae_F_Drypetes_ge:0.0153674641)62:0.0113958826,(Ceratitis|flexuosa_135_28_Moraceae_F_Antiaris_toxicaria|:0.0438368864,Ceratitis|rubivora_150_28_Rosaceae_F_Rubus_apetalus|_Rosaceae_F_Rubus_keniensis|_Rosaceae_F_Rubus_niveus|_Rosaceae_F_Rubus_pinnatus|_Rosaceae_F_Rubus_rigidus|_Rosaceae_F_Rubus_scheffleri|_Rosaceae_F_Rubus_steudneri|:0.0347164867)27:0.0070404864)25:0.0052899836,Ceratitis_copelandi_141_28_Sapotaceae_F_Chrysophylum_gorungosanum|_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Dovyalis_abyssinica|_Sapotaceae_F_Englerophytum_natalense|_Annonaceae_F_Monanthotaxis_parvifolia|_Achariaceae_F_Rawsonia_lucida|_Sapotaceae_:0.0417856356)41:0.0107809214,(((Ceratitis_caetrata_120_28_Apocynaceae_F_Carissa_spinarum|_Ebenaceae_F_Euclea_divinorum|_Sapotaceae_F_Manilkara_butugi|_Sapotaceae_F_Mimusops_bagshawei|:0.0049216398,Ceratitis|capitata_121_28_Apocynaceae_F_Acokanthera_oppositifolia|_Apocynaceae_F_Acokanthera_schimperi|_Euphorbiaceae_F_Antidesma_venosum|_Annonaceae_F_Artabotrys_monteiroae|_Salvadoraceae_F_Azima_tetracantha|_Boraginaceae_F_Bourreria_petiolaris|_Cappara:0.0047283229)99:0.0667878714,Ceratitis_querita_146_28_Sapotaceae_F_Donella_viridifolia|_Salicaceae_F_Ludia_mauritiana|_Loganiaceae_F_Strychnos_mitis|:0.0420361192)18:0.0168907589,((Ceratitis_cornuta_124_28_Rubiaceae_F_Oxyanthus_speciosus|:0.1064924340,Ceratitis|pedestris_143_28_Loganiaceae_F_Strychnos_madagascariensis|:0.0667795176)43:0.0223852398,(Ceratitis_gravinotata_136_28_Podocarpaceae_F_Afrocarpus_gracilior|:0.0419633261,Ceratitis_podocarpi_145_28_Podocarpaceae_F_Afrocarpus_gracilior|:0.0070301445)88:0.0226480095)28:0.0097106222)15:0.0116398899)42:0.0210437476,(((Ceratitis_cosyra_125_28_Annonaceae_F_Annona_muricata|_Annonaceae_F_Annona_senegalensis|_Fabaceae_F_Cordyla_africana|_Apocynaceae_F_Landolphia_sp.|_Anacardiaceae_F_Mangifera_indica|_Apocynaceae_F_Saba_comorensis|_Anacardiaceae_F_Sclerocarya_birrea|_Canell:0.0655588176,Ceratitis_discussa_129_28_Annonaceae_F_Annona_senegalensis|:0.0450094139)71:0.0198987733,Ceratitis|striatella_155_28_Apocynaceae_F_Dictyophleba_lucida|:0.0650406051)85:0.0315614936,Ceratitis|oraria_154_28_Celastraceae_F_Salacia_leptoclada|:0.1007265993)57:0.0283620923)21:0.0117507817,(((Ceratitis_bremii_118_28_Sapotaceae_F_Pouteria_alnifolia|_Sapotaceae_F_Pouteria_altissima|:0.0762872103,(((Ceratitis_cuthbertsoni_128_28_Apocynaceae_F_Tabernaemontana_stapfiana|:0.0516528227,Ceratitis_edwardsi_133_28_Apocynaceae_F_Tabernaemontana_ventricosa|:0.0553172319)56:0.0114350351,Ceratitis|millicentae_131_28_Apocynaceae_F_Ancylobothrys_petersiana|_Rutaceae_F_Vepris_sp.|_Apocynaceae_F_Tabernaemontana_elegans|:0.0460055959)56:0.0165617433,Ceratitis_ditissima_130_28_Sapotaceae_F_Chrysophylum_albidum|:0.0841374476)74:0.0240968847)100:0.0709261605,(Ceratitis_marriotti_140_28_Solanaceae_F_Solanum_anguivi|_Solanaceae_F_Solanum_schumannianum|:0.0675369720,Trirhithrum_overlaeti_576_185_Solanaceae_F_Solanum_terminale|:0.0879423957)85:0.0583188674)8:0.0020370514,(Ceratitis_stictica_152_28_Rubiaceae_F_Craterispermum_schweinfurthii|:0.1030891709,((((Trirhithrum_coffeae_561_185_Rubiaceae_F_Coffea_arabica|_Rubiaceae_F_Coffea_eugenioides|:0.0415418407,(Trirhithrum_fraternum_565_185_Rubiaceae_F_Craterispermum_schweinfurthii|:0.0072932531,Trirhithrum_nigerrimum_572_185_Vitaceae_F_Ampelocissus_africana|_Euphorbiaceae_F_Antidesma_venosum|_Boraginaceae_F_Bourreria_petiolaris|_Apocynaceae_F_Carissa_tetramera|_Vitaceae_F_Afrocayratia_gracilis|_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Eum:0.0161768962)57:0.0092383323)96:0.0305834558,(Trirhithru_|meladiscum_570_185_Rubiaceae_F_Chassalia_discolor|_Rubiaceae_F_Chassalia_kenyensis|_Rubiaceae_F_Chassalia_parvifolia|_Rubiaceae_F_Lasianthus_kilimandscharicus|_Rubiaceae_F_Psychotria_fractinervata|_Rubiaceae_F_Psychotria_mahonii|_Rubiaceae_F_:0.0698177891,Trirhithrum_senex_578_185_Rubiaceae_F_Chassalia_umbraticola|_Rubiaceae_F_Geophila_uniflora|_Rubiaceae_F_Psychotria_alsophila|_Rubiaceae_F_Psychotria_amboniana|_Rubiaceae_F_Psychotria_capensis|_Rubiaceae_F_Psychotria_faucicola|_Rubiaceae_F_Psychotria_holt:0.0705308907)85:0.0212527814)57:0.0066750621,Trirhithrum_culcasiae_562_185_Araceae_F_Culcasia_falcifolia|_Araceae_F_Culcasia_orientalis|:0.1313178670)40:0.0126850549,Trirhithrum_teres_581_185_Rubiaceae_F_Eumachia_abrupta|:0.0748021326)35:0.0109410451)30:0.0129899886)7:0.0084579622)12:0.0336818360)17:0.0000028621,Carpophthoromyia_dimidiata_99_22_Putranjivaceae_F_Drypetes_gerrardii|:0.2026671041)25:0.0286488479,Munromyia_whartoni_362_104_Oleaceae_F_Noronhia_nilotica|:0.2280360676)25:0.0167906786,Ceratitis_connexa_122_28_Sapotaceae_F_Synsepalum_brevipes|_Canellaceae_F_Warburgia_ugandensis|:0.2023995955)40:0.0302222129,((Dacus_arcuatus_181_47_Apocynaceae_F_Pergularia_daemia|:0.0802674423,Dacus|tenebricus_207_47_Apocynaceae_F_Gomphocarpus_semilunatus|:0.0580832486)100:0.1268180037,((((Dacus_ciliatus_187_47_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Corallocarpus_ellipticus|_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Kedrostis_foetidissima|:0.1005414578,Dacus|frontalis_189_47_Cucurbitaceae_F_Coccinia_grandis|_Cucurbitaceae_F_Coccinia_trilobata|_Cucurbitaceae_F_Cucumis_prophetarum|:0.0666893318)86:0.0580588571,(Dacus_phloginus_197_47_Cucurbitaceae_F_Zehneria_minutiflora|:0.0545064714,(Dacus_apostata_200_47_Cucurbitaceae_F_Zehneria_scabra|:0.0000009997,Dacus|triater_208_47_Cucurbitaceae_F_Zehneria_scabra|:0.0000009997)100:0.0514334222)100:0.0678390731)32:0.0165943112,((Dacus_eclipsis_188_47_Passifloraceae_F_Adenia_gummifera|:0.1165984754,Dacus_limbipennis_194_47_Cucurbitaceae_F_Momordica_cissoides|_Cucurbitaceae_F_Momordica_foetida|:0.1122499579)34:0.0128667828,(Dacus|pleuralis_198_47_Cucurbitaceae_F_Lagenaria_sphaerica|:0.1318666535,(Dacus|punctatifrons_199_47_Cucurbitaceae_F_Cucumis_dipsaceus|_Cucurbitaceae_F_Diplocyclos_palmatus|_Cucurbitaceae_F_Lagenaria_sphaerica|_Cucurbitaceae_F_Momordica_trifoliolata|_Cucurbitaceae_F_Peponium_vogelii|_Cucurbitaceae_F_Zehneria_scabra|:0.1117146308,Dacus|sphaeristicus_205_47_Cucurbitaceae_F_Momordica_foetida|:0.0934660765)35:0.0128100836)36:0.0231781286)56:0.0380803800)49:0.0229277063,Dacus_vertebratus_210_47_Cucurbitaceae_F_Cucumis_aculeatus|_Cucurbitaceae_F_Cucumis_dipsaceus|:0.1478606914)39:0.0243752285)45:0.0291078628)82:0.0676048884);"
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
                  {/* <MenuItem value="plants">
                    plants matK and predator insects
                  </MenuItem> */}
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
              src={`${base_path}/phylotree.html?newickData=${newickData}`}
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
