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
  const plant =
    "(Abutilon_mauritianum_Lepidoptera_F_nan:0.0266174266,(((((((((((((((((((Acokanthera_oppositifolia_Diptera_F_nanDiptera_F_CeratitisDiptera_F_Ceratitis:0.0080757395,Carissa_spinarum_Lepidoptera_F_nanHymenoptera_F_PsyttaliaDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nan:0.0043875811):0.0013211968,Carissa_tetramera_Diptera_F_CeratitisDiptera_F_TrirhithrumHymenoptera_F_nan:0.0012541061):0.0063399814,(Hunteria_zeylanica_Lepidoptera_F_ParotisLepidoptera_F_ThaumatotibiaHymenoptera_F_PsyttaliaHymenoptera_F_PsyttaliaDiptera_F_NotommimaDiptera_F_Ceratitis:0.0060160940,Pleiocarpa_pycnantha_Diptera_F_Ceratitis:0.0067826911):0.0070467415):0.0025366864,(Tabernaemontana_elegans_Hymenoptera_F_FopiusHymenoptera_F_PsyttaliaDiptera_F_PtecticusDiptera_F_PtecticusDiptera_F_SolvaDiptera_F_Ceratitis:0.0133718946,Tabernaemontana_ventricosa_Diptera_F_PtecticusDiptera_F_LonchaeidaeDiptera_F_nanDiptera_F_Ceratitis:0.0011096021):0.0313223336):0.0238792471,(Strychnos_henningsii_Diptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_Bracon:0.0060913512,(Strychnos_madagascariensis_Diptera_F_Graptomyza:0.0025484537,Strychnos_mitis_Hymenoptera_F_FopiusDiptera_F_CeratitisHymenoptera_F_Bracon:0.0038325662):0.0016703419):0.0284161710):0.0085603642,(((((((Calycosiphonia_spathicalyx_Lepidoptera_F_ThliptocerasDiptera_F_Ceratitis:0.0064904208,Tricalysia_pallens_Lepidoptera_F_ProphantisHymenoptera_F_PsyttaliaHymenoptera_F_UtetesHymenoptera_F_OpiusDiptera_F_TrirhithrumDiptera_F_ConradtinaDiptera_F_Ceratitis:0.0039037303):0.0012924716,Coffea_arabica_Diptera_F_TrirhithrumDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_Ceratitis:0.0052353683):0.0025914948,(Oxyanthus_speciosus_Lepidoptera_F_ThliptocerasDiptera_F_Ceratitis:0.0130601592,(Coptosperma_graveolens_Lepidoptera_F_Orneodes:0.0064569396,Tarenna_pavettoides_Hymenoptera_F_SycophilaHymenoptera_F_AprostocetusHymenoptera_F_Aprostocetus:0.0119784294):0.0000010000):0.0012244796):0.0104011911,Keetia_gueinzii_Lepidoptera_F_Thaumatotibia:0.0316415427):0.0138401391,Heinsia_crinita_Hymenoptera_F_nan:0.0212444275):0.0151366645,Craterispermum_schweinfurthii_Hymenoptera_F_DiachasmimorphaHymenoptera_F_UtetesDiptera_F_TrirhithrumDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_nan:0.0887731572):0.0000020182,Guettarda_speciosa_Lepidoptera_F_ThaumatotibiaHymenoptera_F_PsyttaliaDiptera_F_CeratitisHymenoptera_F_Apanteles:0.0350831548):0.0230628031):0.0250285218,((((((Avicennia_marina_Hymenoptera_F_Pristomerus:0.0567610020,Kigelia_africana_Hymenoptera_F_PsyttaliaDiptera_F_PtecticusDiptera_F_nrDrosimomyiaDiptera_F_nanHymenoptera_F_PhaenocarpaHymenoptera_F_nan:0.0087485096):0.0000026115,(Duranta_erecta_Hymenoptera_F_PsyttaliaDiptera_F_BactroceraHymenoptera_F_Bracon:0.0155070268,(Lantana_camara_Coleoptera_F_PhenoliaHymenoptera_F_nan:0.0013423340,(Lantana_trifolia_Diptera_F_UnidentifiedHymenoptera_F_Tetrastichinae:0.0000010000,Lantana_viburnoides_Diptera_F_Unidentified:0.0000010000):0.0026868153):0.0438056835):0.0064642811):0.0016577654,(Vitex_ferruginea_Diptera_F_LonchaeidaeDiptera_F_nan:0.0025584963,Vitex_payos_Coleoptera_F_Alcidodes:0.0039703890):0.0275492329):0.0040232214,Halleria_lucida_Hymenoptera_F_nan:0.0081728006):0.0259281278,((Jasminum_fluminense_Lepidoptera_F_PalpitaLepidoptera_F_Hendecasis:0.0067539072,Jasminum_stenolobum_Hymenoptera_F_Phanerotoma:0.0108695606):0.0359361307,(Olea_europaea_Hymenoptera_F_PsyttaliaHymenoptera_F_PsyttaliaHymenoptera_F_UtetesHymenoptera_F_UtetesHymenoptera_F_PsyttaliaDiptera_F_BactroceraDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_Bracon:0.0064814658,Olea_woodiana_Diptera_F_BactroceraDiptera_F_CeratitisHymenoptera_F_Pristomerus:0.0027286679):0.0057831563):0.0161256877):0.0188406316,(((Solanum_campylacanthum_Lepidoptera_F_Sceliodes:0.0014887823,Solanum_mauritianum_Diptera_F_SylvicolaDiptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_AsobaraHymenoptera_F_TetrastichusHymenoptera_F_TrichopriaHymenoptera_F__Bothriothorax:0.0025517037):0.0104938086,Solanum_nigrum_Hymenoptera_F_Bracon:0.0047012719):0.0074971890,Withania_somnifera_Lepidoptera_F_Sceliodes:0.0106697985):0.0652494339):0.0024560177):0.0016430980,(Cordia_africana_Hymenoptera_F_SycophilaHymenoptera_F_SycophilaHymenoptera_F_Pseudotorymus:0.0025455815,(Cordia_monoica_Hymenoptera_F_nanHymenoptera_F_Sycophila:0.0040495586,Cordia_sinensis_Lepidoptera_F_nanHymenoptera_F_EurytomaHymenoptera_F_ApantelesHymenoptera_F_nanHymenoptera_F_Pseudotorymus:0.0053112582):0.0000028091):0.0608706407):0.0097979889,Apodytes_dimidiata_Coleoptera_F_nanHymenoptera_F_nanHymenoptera_F_nan:0.0362222897):0.0072113426,Cussonia_spicata_Hymenoptera_F_nan:0.0635549495):0.0127874643,((((((Ampelocissus_africana_Diptera_F_Trirhithrum:0.0345002978,Coccinia_grandis_Hymenoptera_F_FopiusHymenoptera_F_FopiusDiptera_F_BactroceraDiptera_F_DacusDiptera_F_Dacus:0.1594797343):0.1005110077,Opilia_amentacea_Hymenoptera_F_PsyttaliaDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_nan:0.0198704018):2.5971598328,Euclea_divinorum_Lepidoptera_F_ThaumatotibiaHymenoptera_F_PsyttaliaColeoptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_BruchophagusHymenoptera_F_TetrastichusHymenoptera_F_nanHymenoptera_F_Sycophila:0.0017552816):0.0000323146,Euclea_natalensis_Lepidoptera_F_ThaumatotibiaLepidoptera_F_VietessaHymenoptera_F_nan:0.0014428658):0.0069291729,Diospyros_squarrosa_Lepidoptera_F_Thaumatotibia:0.0168939137):0.0174024495,((Englerophytum_natalense_Lepidoptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_Phanerotoma:0.0025862317,Synsepalum_brevipes_Coleoptera_F_EpuraeaColeoptera_F_PhenoliaColeoptera_F_nanDiptera_F_PtecticusDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_AsobaraHymenoptera_F_BraconHymenoptera_F_Leptopil:0.0000010000):0.0013398005,(Mimusops_obtusifolia_Lepidoptera_F_ThaumatotibiaLepidoptera_F_nanColeoptera_F_OchyromeraDiptera_F_CeratitisDiptera_F_PhilophyllaHymenoptera_F_TriaspisHymenoptera_F_Eurytoma:0.0039962672,Sideroxylon_inerme_Diptera_F_CeratitisHymenoptera_F_EalataHymenoptera_F_Trichopria:0.0078531538):0.0013094388):0.0260796313):0.0317920776):0.0115838007,(Strombosia_scheffleri_Hymenoptera_F_DiachasmimorphaHymenoptera_F_FopiusHymenoptera_F_FopiusHymenoptera_F_SternaulopiusHymenoptera_F_PsyttaliaHymenoptera_F_PsyttaliaColeoptera_F_PhenoliaDiptera_F_BactroceraDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera:0.0317891235,(Ximenia_americana_Hymenoptera_F_FopiusDiptera_F_CeratitisHymenoptera_F_ApantelesHymenoptera_F_PristomerusHymenoptera_F_Eurytoma:0.0043818303,Ximenia_caffra_Lepidoptera_F_ThaumatotibiaDiptera_F_Ceratitis:0.0048170756):0.0724702659):0.0110131778):0.0079519814,(((((Annona_senegalensis_Lepidoptera_F_ThaumatotibiaLepidoptera_F_SpatulipalpiaLepidoptera_F_nanHymenoptera_F_DiachasmimorphaHymenoptera_F_PsyttaliaHymenoptera_F_FopiusDiptera_F_LonchaeidaeDiptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_Ceratitis:0.0322394710,Uvaria_lucida_Lepidoptera_F_ThaumatotibiaLepidoptera_F_SpatulipalpiaLepidoptera_F_nanDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_Phanerotoma:0.0179113048):0.0592888572,Xymalos_monospora_Diptera_F_nanHymenoptera_F_nan:0.0775910096):0.0192906935,Commelina_benghalensis_Hymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nan:0.2518223166):0.0174297617,Faurea_saligna_Diptera_F_Allobacha:0.0988429616):0.0036784995,(Cissampelos_pareira_Diptera_F_Trirhithrum:0.0557588274,Tiliacora_funifera_Lepidoptera_F_ThaumatotibiaDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_Tetrastichus:0.0059057125):0.0863286405):0.0443500016):0.0051193018,(Cissus_rotundifolia_Hymenoptera_F_Chelonus:0.0488933319,Cyphostemma_cyphopetalum_Hymenoptera_F_UtetesHymenoptera_F_PsyttaliaDiptera_F_TrirhithrumHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_Bracon:0.0434507779):0.0492163076):0.0175933002,((((((Adenia_gummifera_Hymenoptera_F_FopiusHymenoptera_F_PsyttaliaDiptera_F_DacusDiptera_F_DacusDiptera_F_Dacus:0.1093697053,(Dovyalis_caffra_Diptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_AsobaraHymenoptera_F_Leptopilina:0.0066034510,(Flacourtia_indica_Diptera_F_CeratitisDiptera_F_Trirhithrum:0.0074797224,Oncoba_spinosa_Lepidoptera_F_nanColeoptera_F_Phenolia:0.0090322637):0.0036701235):0.0492773119):0.0063240833,Rawsonia_lucida_Lepidoptera_F_ThaumatotibiaLepidoptera_F_HydrillodesHymenoptera_F_FopiusHymenoptera_F_FopiusHymenoptera_F_RhynchosteresHymenoptera_F_RhynchosteresDiptera_F_nanDiptera_F_TrirhithrumDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_Ceratitis:0.0322028447):0.0091013891,((((Bridelia_cathartica_Lepidoptera_F_Thaumatotibia:0.0015277982,Bridelia_micrantha_Lepidoptera_F_ThaumatotibiaHymenoptera_F_nan:0.0041267063):0.0821213625,(Flueggea_virosa_Hymenoptera_F_PsyttaliaDiptera_F_CeratitisDiptera_F_Trirhithrum:0.0601465212,Phyllanthus_reticulatus_Lepidoptera_F_AgroteraLepidoptera_F_ThaumatotibiaHymenoptera_F_PsyttaliaHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_ApantelesHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nan:0.0309155912):0.0305675835):0.0360361574,(Calophyllum_inophyllum_Lepidoptera_F_nan:0.0631293945,Garcinia_livingstonei_Lepidoptera_F_ThaumatotibiaHymenoptera_F_nan:0.0886195330):0.0667995386):0.0042589238,(((Croton_sylvaticus_Lepidoptera_F_Thaumatotibia:0.0546800327,Ricinus_communis_Lepidoptera_F_Thaumatotibia:0.0403665976):0.0196608539,Hirtella_zanzibarica_Lepidoptera_F_Thaumatotibia:0.1235565163):0.0020740559,Erythroxylum_emarginatum_Diptera_F_Trirhithrum:0.1085399302):0.0093420907):0.0000022288):0.0018956463,Drypetes_gerrardii_Hymenoptera_F_PsyttaliaDiptera_F_nanDiptera_F_CarpophthoromyiaDiptera_F_CarpophthoromyiaDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_BraconHymenoptera_F_AsobaraHymenoptera_F_nanHymenoptera_F_nan:0.0339124424):0.0311812126,Mystroxylon_aethiopicum_Diptera_F_CeratitisHymenoptera_F_OrgilusHymenoptera_F_nan:0.1145283683):0.0110404454,((((((((Antiaris_toxicaria_Hymenoptera_F_DiachasmimorphaHymenoptera_F_PsyttaliaHymenoptera_F_UtetesHymenoptera_F_SternaulopiusHymenoptera_F_PsyttaliaDiptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_AsobaraHymenoptera_F_Tetrasti:0.0301813013,Trilepisium_madagascariense_Hymenoptera_F_Psyttalia:0.0159895507):0.0065805709,Milicia_excelsa_Lepidoptera_F_nan:0.0197372598):0.0222024525,(Celtis_mildbraedii_Hymenoptera_F_Bracon:0.0361095640,Chaetachme_aristata_Lepidoptera_F_Thaumatotibia:0.0401012053):0.0332511781):0.0203603453,((Maesopsis_eminii_Diptera_F_nanDiptera_F_LonchaeidaeDiptera_F_nanHymenoptera_F_AsobaraHymenoptera_F_Phaenocarpa:0.0143454827,Scutia_myrtina_Hymenoptera_F_SycophilaHymenoptera_F_EurytomaHymenoptera_F_Pseudotorymus:0.0125784992):0.0360639668,(Ziziphus_abyssinica_Lepidoptera_F_ThaumatotibiaColeoptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_EntedonHymenoptera_F_BruchophagusHymenoptera_F_Aprostocetus:0.0040043730,Ziziphus_mucronata_Coleoptera_F_nan:0.0046387510):0.0523953551):0.0100239021):0.0159284983,(Prunus_africana_Lepidoptera_F_ThaumatotibiaDiptera_F_nanDiptera_F_BactroceraDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_PhaenocarpaHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nan:0.0100040463,Prunus_padus_Diptera_F_CeratitisDiptera_F_Ceratitis:0.0033937040):0.0656618097):0.0146019324,((Cordyla_africana_Lepidoptera_F_nanLepidoptera_F_nanHymenoptera_F_PsyttaliaDiptera_F_PtecticusDiptera_F_CeratitisHymenoptera_F_DiolcogasterHymenoptera_F_Phanerotoma:0.0533626719,Entada_abyssinica_Lepidoptera_F_Giaura:0.0536583976):0.0087482798,Tamarindus_indica_Coleoptera_F_nanHymenoptera_F_nan:0.0677168346):0.0635202669):0.0000020840,((Coccinia_trilobata_Hymenoptera_F_DiachasmimorphaHymenoptera_F_DiachasmimorphaDiptera_F_nanDiptera_F_DacusDiptera_F_Dacus:0.0014285190,Peponium_vogelii_Diptera_F_DacusDiptera_F_Dacus:0.0050653040):0.0068724926,Kedrostis_foetidissima_Diptera_F_Dacus:0.0112629714):0.0760916025):0.0095893632,Balanites_aegyptiaca_Lepidoptera_F_nanLepidoptera_F_nanColeoptera_F_CarpophilusHymenoptera_F_nan:0.0904768174):0.0012853228):0.0096548970):0.0020792350,((Psidium_guajava_Lepidoptera_F_ThaumatotibiaHymenoptera_F_FopiusHymenoptera_F_FopiusDiptera_F_CeratitisDiptera_F_Ceratitis:0.0231477606,((Syzygium_cordatum_Lepidoptera_F_ThaumatotibiaColeoptera_F_CtenomerusHymenoptera_F_TriaspisHymenoptera_F_nanHymenoptera_F_nan:0.0013020736,Syzygium_guineense_Lepidoptera_F_ThaumatotibiaColeoptera_F_CarpophilusColeoptera_F_UrophorusColeoptera_F_AraecerusColeoptera_F_CtenomerusHymenoptera_F_SycophilaHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nan:0.0013076147):0.0039297741,Syzygium_cumini_Lepidoptera_F_Thaumatotibia:0.0037362401):0.0062699070):0.0306407455,Terminalia_catappa_Diptera_F_Ptecticus:0.0706530375):0.0358353607):0.0014753793,((((Allophylus_africanus_Hymenoptera_F_nanHymenoptera_F_TriaspisHymenoptera_F_nan:0.0332058917,(Blighia_unijugata_Lepidoptera_F_Thaumatotibia:0.0077058505,Litchi_chinensis_Lepidoptera_F_Thaumatotibia:0.0075856750):0.0046251855):0.0416467357,Filicium_decipiens_Diptera_F_CeratitisDiptera_F_Ceratitis:0.0504217951):0.0220057903,((Clausena_anisata_Hymenoptera_F_PsyttaliaDiptera_F_Ceratitis:0.0300165597,(Ekebergia_capensis_Hymenoptera_F_PsyttaliaHymenoptera_F_FopiusDiptera_F_nanDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_Ceratitis:0.0148269308,Vepris_nobilis_Lepidoptera_F_ThaumatotibiaLepidoptera_F_DolicharthriaHymenoptera_F_PsyttaliaColeoptera_F_PhenoliaColeoptera_F_nanColeoptera_F_Metialma_Diptera_F_CeratitisDiptera_F_CeratitisDiptera_F_CeratitisHymenoptera_F_nanHymenoptera_F_EurytomaHymenop:0.0232599520):0.0059296054):0.0301564407,Turraea_floribunda_Lepidoptera_F_nan:0.0722304027):0.0188615562):0.0007237397,((Harpephyllum_caffrum_Hymenoptera_F_PsyttaliaDiptera_F_CeratitisDiptera_F_CeratitisDiptera_F_Ceratitis:0.0000010000,Sclerocarya_birrea_Lepidoptera_F_ThaumatotibiaLepidoptera_F_nanDiptera_F_PtecticusDiptera_F_CeratitisHymenoptera_F_Diolcogaster:0.0041996740):0.0239267261,(Mangifera_indica_Diptera_F_Ceratitis:0.0224407834,(Ozoroa_obovata_Hymenoptera_F_MegastigmusHymenoptera_F_nanHymenoptera_F_nan:0.0108618525,(Searsia_natalensis_Hymenoptera_F_MegastigmusHymenoptera_F_nan:0.0094516130,Sorindeia_madagascariensis_Diptera_F_PtecticusHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_nanHymenoptera_F_AscogasterHymenoptera_F_PhanerotomaHymenoptera_F_nanHymenoptera_F_ChelonusHymenoptera_F_Pristomerus:0.0090649007):0.0024905592):0.0026218683):0.0202232809):0.0126415087):0.0355090757):0.0198977691,(Azima_tetracantha_Diptera_F_Ceratitis:0.0556865466,((Boscia_angustifolia_Diptera_F_CapparimyiaHymenoptera_F_Pseudotorymus:0.0087787165,((Maerua_angolensis_Hymenoptera_F_PsyttaliaDiptera_F_CapparimyiaHymenoptera_F_Eurytoma:0.0119015954,Maerua_triphylla_Hymenoptera_F_BraconHymenoptera_F_nan:0.0092671013):0.0000020756,Thilachium_africanum_Coleoptera_F_nanColeoptera_F_nanHymenoptera_F_TriaspisHymenoptera_F_Eurytoma:0.0042850241):0.0017862366):0.0093719145,(Capparis_sepiaria_Diptera_F_CeratitisHymenoptera_F_Bracon:0.0027136182,Capparis_tomentosa_Diptera_F_Themarictera:0.0067198203):0.0126347757):0.0687576125):0.0611193694):0.0599613316,(Melhania_ovata_Hymenoptera_F_Bracon:0.0374009785,Sterculia_africana_Lepidoptera_F_MometaLepidoptera_F_Giaura:0.0202474555):0.0028135150):0.0063844086,(Hibiscus_calyphyllus_Lepidoptera_F_GiauraHymenoptera_F_nan:0.0064122736,Hibiscus_micranthus_Lepidoptera_F_nanHymenoptera_F_Apanteles:0.0028586208):0.0138317369);";
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
