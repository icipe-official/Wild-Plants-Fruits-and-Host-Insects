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
    "(Bactrocera_amplexa_JTB267-12_[Host_Plants<F>Olacaceae<S>Strombosia_scheffleri]:0.0898428604,(Bactrocera_munroi_MVTBI011-08_[Host_Plants<F>Oleaceae<S>Olea_welwitschii]:0.0385757729,Bactrocera_oleae_KMPMA006-18_[Host_Plants<F>Oleaceae<S>Olea_europaea]:0.0714679713)97:0.0958696204,((((((Capparimyia_melanaspis_JTB254-12_[Host_Plants<F>Capparaceae<S>Boscia_angustifolia<F>Capparaceae<S>Boscia_coriacea<F>Capparaceae<S>Maerua_angolensis]:0.0780555934,(((((Prochoristis_calamochroa_PMANK417-08_[Host_Plants<F>Capparaceae<S>Boscia_coriacea]:0.1007890362,Hydrillodes_uliginosalis_GWORD1518-08_[Host_Plants<F>Achariaceae<S>Rawsonia_lucida]:0.0958737104)42:0.0193482221,(Dolicharthria_lanceolalis_MK187475_MGABD278-11_[Host_Plants<F>Oleaceae<S>Olea_welwitschii<F>Apocynaceae<S>Vepris_nobilis]:0.0804292224,Palpita_unionalis_EPNG10203-17_[Host_Plants<F>Sapotaceae<S>Englerophytum_oblanceolatum<F>Oleaceae<S>Jasminum_fluminense]:0.1030687298)60:0.0348937689)15:0.0145141912,(Agrotera_citrina_MH415480_MIMAD252-15_[Host_Plants<F>Phyllanthaceae<S>Phyllanthus_reticulatus]:0.0974942464,(Prophantis_smaragdina_HM893029_MGABB426-10_[Host_Plants<F>Rubiaceae<S>Chassalia_umbraticola<F>Rubiaceae<S>Oxyanthus_goetzei<F>Rubiaceae<S>Oxyanthus_zanguebaricus<F>Rubiaceae<S>Polysphaeria_multiflora<F>Rubiaceae<S>Psydrax_polhillii<F>Rubiaceae<S>Tricalys:0.0566798792,Thliptoceras_xanthomeralis_PMANK891-08_[Host_Plants<F>Rubiaceae<S>Calycosiphonia_spathicalyx<F>Rubiaceae<S>Leptactina_platyphylla<F>Rubiaceae<S>Oxyanthus_speciosus<F>Rubiaceae<S>Oxyanthus_zanguebaricus<F>Rubiaceae<S>Polysphaeria_parvifolia]:0.0530393475)43:0.0158882225)15:0.0067915508)25:0.0330307820,Metendothenia:0.1732349863)58:0.0369745179,(Deudorix_dinochares_PMANL3235-14_[Host_Plants<F>Rubiaceae<S>Catunaregam_nilotica<F>Sapindaceae<S>Deinbollia_borbonica<F>Connaraceae<S>Ellipanthus_madagascariensis<F>Sapindaceae<S>Lecaniodiscus_fraxinifolius<F>Sapindaceae<S>Lepisanthes_senegalensis<F>Sapi:0.0275987710,(Megastigmus_transvaalensis_GMSAT1569-13_[Host_Plants<F>Anacardiaceae<S>Searsia_natalensis]:1.3623537371,(Psyttalia_concolor_GMSUH507-15_[Host_Plants<F>Simaroubaceae<S>Harrisonia_abyssinica<F>Oleaceae<S>Olea_europaea]:0.1966674610,Psyttalia_lounsburyi_MH841900_PSYT004-18_[Host_Plants<F>Oleaceae<S>Olea_europaea<F>Olacaceae<S>Strombosia_scheffleri]:0.0403088248)100:0.9904965800)65:0.2502944422)59:0.0498795625)99:0.2430726124)33:0.0406971975,(Celidodacus_obnubilus_JTB016-12_[Host_Plants<F>Fabaceae<S>Canavalia_africana<F>Fabaceae<S>Canavalia_cathartica]:0.1239434649,Perilampsis_pulchella_JTB215-12_[Host_Plants<F>Loranthaceae<S>Agelanthus_sp.]:0.0991950746)42:0.0244963157)13:0.0341663230,(Carpophthoromyia_dimidiata_JTB036-12_[Host_Plants<F>Putranjivaceae<S>Drypetes_gerrardii]:0.1892764224,((((((((Ceratitis_anonae_JTB201-12_[Host_Plants<F>Moraceae<S>Antiaris_toxicaria<F>Annonaceae<S>Artabotrys_monteiroae<F>Rubiaceae<S>Coffea_arabica<F>Sapotaceae<S>Englerophytum_oblanceolatum<F>Rosaceae<S>Rhaphiolepis_bibas<F>Rubiaceae<S>Leptactina_platyphylla<F>Mo:0.0050607918,Ceratitis_fasciventris_JTB287-12_[Host_Plants<F>Apocynaceae<S>Acokanthera_schimperi<F>Annonaceae<S>Annona_senegalensis<F>Moraceae<S>Antiaris_toxicaria<F>Annonaceae<S>Artabotrys_monteiroae<F>Rubiaceae<S>Coffea_arabica<F>Salicaceae<S>Dovyalis_caffra<F>Putr:0.0158529287)92:0.0102066038,Ceratitis_rosa_JTB007-12_[Host_Plants<F>Sapindaceae<S>Allophylus_pervillei<F>Fabaceae<S>Angylocalyx_braunii<F>Annonaceae<S>Annona_senegalensis<F>Rubiaceae<S>Calycosiphonia_spathicalyx<F>Apocynaceae<S>Dictyophleba_lucida<F>Putranjivaceae<S>Drypetes_natale:0.0055984440)92:0.0181138362,Ceratitis_rubivora_JTB234-12_[Host_Plants<F>Rosaceae<S>Rubus_apetalus<F>Rosaceae<S>Rubus_keniensis<F>Rosaceae<S>Rubus_niveus<F>Rosaceae<S>Rubus_pinnatus<F>Rosaceae<S>Rubus_rigidus<F>Rosaceae<S>Rubus_scheffleri<F>Rosaceae<S>Rubus_steudneri]:0.0325935691)58:0.0096043800,(Ceratitis_flexuosa_MVTBI055-08_[Host_Plants<F>Moraceae<S>Antiaris_toxicaria]:0.0454831775,Ceratitis_copelandi_MVTBI170-08_[Host_Plants<F>Sapotaceae<S>Chrysophylum_gorungosanum<F>Sapotaceae<S>Donella_viridifolia<F>Salicaceae<S>Dovyalis_abyssinica<F>Sapotaceae<S>Englerophytum_natalense<F>Annonaceae<S>Monanthotaxis_parvifolia<F>Achariaceae<S>Raw:0.0390146064)37:0.0125297245)53:0.0155771041,(((Ceratitis_caetrata_MVTBI169-08_[Host_Plants<F>Apocynaceae<S>Carissa_spinarum<F>Ebenaceae<S>Euclea_divinorum<F>Sapotaceae<S>Manilkara_butugi<F>Sapotaceae<S>Mimusops_bagshawei]:0.0026378839,Ceratitis_capitata_JTB108-12_[Host_Plants<F>Apocynaceae<S>Acokanthera_oppositifolia<F>Apocynaceae<S>Acokanthera_schimperi<F>Euphorbiaceae<S>Antidesma_venosum<F>Annonaceae<S>Artabotrys_monteiroae<F>Salvadoraceae<S>Azima_tetracantha<F>Boraginaceae<S>Bourre:0.0069051714)100:0.0729289632,Ceratitis_querita_JTB324-12_[Host_Plants<F>Sapotaceae<S>Donella_viridifolia<F>Salicaceae<S>Ludia_mauritiana<F>Loganiaceae<S>Strychnos_mitis]:0.0548671822)27:0.0197197099,((Ceratitis_cornuta_MVTBI038-08_[Host_Plants<F>Rubiaceae<S>Oxyanthus_speciosus]:0.1173675250,Ceratitis_pedestris_JTB021-12_[Host_Plants<F>Loganiaceae<S>Strychnos_madagascariensis]:0.0614974491)53:0.0272682577,(Ceratitis_gravinotata_AFRFF076-16_[Host_Plants<F>Podocarpaceae<S>Afrocarpus_gracilior]:0.0412118276,Ceratitis_podocarpi_MVTBI062-08_[Host_Plants<F>Podocarpaceae<S>Afrocarpus_gracilior]:0.0158376300)87:0.0245852200)26:0.0087278914)21:0.0158042227)35:0.0173659456,(((Ceratitis_cosyra_JTB184-12_[Host_Plants<F>Annonaceae<S>Annona_muricata<F>Annonaceae<S>Annona_senegalensis<F>Fabaceae<S>Cordyla_africana<F>Apocynaceae<S>Landolphia_sp.<F>Anacardiaceae<S>Mangifera_indica<F>Apocynaceae<S>Saba_comorensis<F>Anacardiaceae<S>Sc:0.0509279835,Ceratitis_discussa_MVTBI049-08_[Host_Plants<F>Annonaceae<S>Annona_senegalensis]:0.0290627794)97:0.0333625390,Ceratitis_striatella_AFRFF064-16_[Host_Plants<F>Apocynaceae<S>Dictyophleba_lucida]:0.0579503281)93:0.0324392727,Ceratitis_oraria_MVTBI060-08_[Host_Plants<F>Celastraceae<S>Salacia_leptoclada]:0.1053435436)70:0.0299270839)32:0.0220498730,((Ceratitis_bremii_JTB305-12_[Host_Plants<F>Sapotaceae<S>Pouteria_alnifolia<F>Sapotaceae<S>Pouteria_altissima]:0.1384628667,(((Ceratitis_cuthbertsoni_MVTBI315-09_[Host_Plants<F>Apocynaceae<S>Tabernaemontana_stapfiana]:0.0557686698,Ceratitis_edwardsi_JTB297-12_[Host_Plants<F>Apocynaceae<S>Tabernaemontana_ventricosa]:0.0557796846)52:0.0131975444,Ceratitis_millicentae_JTB035-12_[Host_Plants<F>Apocynaceae<S>Ancylobothrys_petersiana<F>Apocynaceae<S>Vepris_sp.<F>Apocynaceae<S>Tabernaemontana_elegans]:0.0327225516)72:0.0344062510,Ceratitis_ditissima_JTB349-12_[Host_Plants<F>Sapotaceae<S>Chrysophylum_albidum]:0.0825267846)59:0.0241422044)99:0.0781635893,(Ceratitis_marriotti_MVTBI172-08_[Host_Plants<F>Solanaceae<S>Solanum_anguivi<F>Solanaceae<S>Solanum_schumannianum]:0.0692916928,Trirhithrum_overlaeti_JTB246-12_[Host_Plants<F>Solanaceae<S>Solanum_terminale]:0.0973688141)87:0.0634415606)11:0.0043762525)5:0.0093593252,((Ceratitis_stictica_JTB219-12_[Host_Plants<F>Rubiaceae<S>Craterispermum_schweinfurthii]:0.0890605289,Trirhithrum_teres_MVTBI167-08_[Host_Plants<F>Rubiaceae<S>Eumachia_abrupta]:0.0736355036)43:0.0196685869,(((Trirhithrum_coffeae_JTB218-12_[Host_Plants<F>Rubiaceae<S>Coffea_arabica<F>Rubiaceae<S>Coffea_eugenioides]:0.0486531428,(Trirhithrum_fraternum_JTB188-12_[Host_Plants<F>Rubiaceae<S>Craterispermum_schweinfurthii]:0.0096309732,Trirhithrum_nigerrimum_JTB178-12_[Host_Plants<F>Vitaceae<S>Ampelocissus_africana<F>Euphorbiaceae<S>Antidesma_venosum<F>Boraginaceae<S>Bourreria_petiolaris<F>Apocynaceae<S>Carissa_tetramera<F>Vitaceae<S>Afrocayratia_gracilis<F>Rubiaceae<S>Chassalia_umbrat:0.0171283931)64:0.0121691565)96:0.0328148239,(Trirhithrum_meladiscum_JTB043-12_[Host_Plants<F>Rubiaceae<S>Chassalia_discolor<F>Rubiaceae<S>Chassalia_kenyensis<F>Rubiaceae<S>Chassalia_parvifolia<F>Rubiaceae<S>Lasianthus_kilimandscharicus<F>Rubiaceae<S>Psychotria_fractinervata<F>Rubiaceae<S>Psychotria:0.0773103660,Trirhithrum_senex_MVTBI166-08_[Host_Plants<F>Rubiaceae<S>Chassalia_umbraticola<F>Rubiaceae<S>Geophila_uniflora<F>Rubiaceae<S>Psychotria_alsophila<F>Rubiaceae<S>Psychotria_amboniana<F>Rubiaceae<S>Psychotria_capensis<F>Rubiaceae<S>Psychotria_faucicola<F>Ru:0.0789163128)70:0.0204279341)49:0.0034905881,Trirhithrum_culcasiae_MVTBI162-08_[Host_Plants<F>Araceae<S>Culcasia_falcifolia<F>Araceae<S>Culcasia_orientalis]:0.1388506753)40:0.0171646796)30:0.0147176919)22:0.0357331642)5:0.0000026106)27:0.0290490979,Munromyia_whartoni_GQ254294_LPNGM003-07_[Host_Plants<F>Oleaceae<S>Noronhia_nilotica]:0.2356421604)25:0.0204158178,Ceratitis_connexa_MVTBI275-09_[Host_Plants<F>Sapotaceae<S>Synsepalum_brevipes<F>Canellaceae<S>Warburgia_ugandensis]:0.2134972233)34:0.0195954224,(((Dacus_arcuatus_MVTBI082-08_[Host_Plants<F>Apocynaceae<S>Pergularia_daemia]:0.0798518049,Dacus_tenebricus_MVTBI153-08_[Host_Plants<F>Apocynaceae<S>Gomphocarpus_semilunatus]:0.0663913227)100:0.1282817809,Dacus_vertebratus_JTB086-12_[Host_Plants<F>Cucurbitaceae<S>Cucumis_aculeatus<F>Cucurbitaceae<S>Cucumis_dipsaceus]:0.1342259412)42:0.0359910397,(((Dacus_ciliatus_JTB174-12_[Host_Plants<F>Cucurbitaceae<S>Coccinia_trilobata<F>Cucurbitaceae<S>Corallocarpus_ellipticus<F>Cucurbitaceae<S>Cucumis_dipsaceus<F>Cucurbitaceae<S>Kedrostis_foetidissima]:0.0886481839,Dacus_frontalis_AFRFF083-16_[Host_Plants<F>Cucurbitaceae<S>Coccinia_grandis<F>Cucurbitaceae<S>Coccinia_trilobata<F>Cucurbitaceae<S>Cucumis_prophetarum]:0.0708405952)84:0.0516055388,(Dacus_limbipennis_JTB279-12_[Host_Plants<F>Cucurbitaceae<S>Momordica_cissoides<F>Cucurbitaceae<S>Momordica_foetida]:0.1401711227,(Dacus_pleuralis_JTB357-12_[Host_Plants<F>Cucurbitaceae<S>Lagenaria_sphaerica]:0.1649086967,Dacus_punctatifrons_JTB049-12_[Host_Plants<F>Cucurbitaceae<S>Cucumis_dipsaceus<F>Cucurbitaceae<S>Diplocyclos_palmatus<F>Cucurbitaceae<S>Lagenaria_sphaerica<F>Cucurbitaceae<S>Momordica_trifoliolata<F>Cucurbitaceae<S>Peponium_vogelii<F>Cucurbitaceae<S>Zehn:0.1296913888)46:0.0116840790)39:0.0238891701)37:0.0235583436,(Dacus_phloginus_MVTBI136-08_[Host_Plants<F>Cucurbitaceae<S>Zehneria_minutiflora]:0.0516876965,(Dacus_apostata_MVTBI237-08_[Host_Plants<F>Cucurbitaceae<S>Zehneria_scabra]:0.0000009996,Dacus_triater_MVTBI239-08_[Host_Plants<F>Cucurbitaceae<S>Zehneria_scabra]:0.0000009996)100:0.0590073562)100:0.0838181315)55:0.0272264282)35:0.0329986721)83:0.0815743119);";
  // When the selected organism changes, clear the previous data
  // Event handler for updating the selected organism
  // Create the URL based on the selected organism
  const url = `${base_url}/api/${selectedOrganism}/species`;

  const { data, error, isLoading } = useSWR(url, fetcher);
  console.log(data);
  const [newickData, setNewickData] = useState(
    "(Bactrocera_amplexa_JTB267-12_[Host_Plants<F>Olacaceae<S>Strombosia_scheffleri]:0.0898428604,(Bactrocera_munroi_MVTBI011-08_[Host_Plants<F>Oleaceae<S>Olea_welwitschii]:0.0385757729,Bactrocera_oleae_KMPMA006-18_[Host_Plants<F>Oleaceae<S>Olea_europaea]:0.0714679713)97:0.0958696204,((((((Capparimyia_melanaspis_JTB254-12_[Host_Plants<F>Capparaceae<S>Boscia_angustifolia<F>Capparaceae<S>Boscia_coriacea<F>Capparaceae<S>Maerua_angolensis]:0.0780555934,(((((Prochoristis_calamochroa_PMANK417-08_[Host_Plants<F>Capparaceae<S>Boscia_coriacea]:0.1007890362,Hydrillodes_uliginosalis_GWORD1518-08_[Host_Plants<F>Achariaceae<S>Rawsonia_lucida]:0.0958737104)42:0.0193482221,(Dolicharthria_lanceolalis_MK187475_MGABD278-11_[Host_Plants<F>Oleaceae<S>Olea_welwitschii<F>Apocynaceae<S>Vepris_nobilis]:0.0804292224,Palpita_unionalis_EPNG10203-17_[Host_Plants<F>Sapotaceae<S>Englerophytum_oblanceolatum<F>Oleaceae<S>Jasminum_fluminense]:0.1030687298)60:0.0348937689)15:0.0145141912,(Agrotera_citrina_MH415480_MIMAD252-15_[Host_Plants<F>Phyllanthaceae<S>Phyllanthus_reticulatus]:0.0974942464,(Prophantis_smaragdina_HM893029_MGABB426-10_[Host_Plants<F>Rubiaceae<S>Chassalia_umbraticola<F>Rubiaceae<S>Oxyanthus_goetzei<F>Rubiaceae<S>Oxyanthus_zanguebaricus<F>Rubiaceae<S>Polysphaeria_multiflora<F>Rubiaceae<S>Psydrax_polhillii<F>Rubiaceae<S>Tricalys:0.0566798792,Thliptoceras_xanthomeralis_PMANK891-08_[Host_Plants<F>Rubiaceae<S>Calycosiphonia_spathicalyx<F>Rubiaceae<S>Leptactina_platyphylla<F>Rubiaceae<S>Oxyanthus_speciosus<F>Rubiaceae<S>Oxyanthus_zanguebaricus<F>Rubiaceae<S>Polysphaeria_parvifolia]:0.0530393475)43:0.0158882225)15:0.0067915508)25:0.0330307820,Metendothenia:0.1732349863)58:0.0369745179,(Deudorix_dinochares_PMANL3235-14_[Host_Plants<F>Rubiaceae<S>Catunaregam_nilotica<F>Sapindaceae<S>Deinbollia_borbonica<F>Connaraceae<S>Ellipanthus_madagascariensis<F>Sapindaceae<S>Lecaniodiscus_fraxinifolius<F>Sapindaceae<S>Lepisanthes_senegalensis<F>Sapi:0.0275987710,(Megastigmus_transvaalensis_GMSAT1569-13_[Host_Plants<F>Anacardiaceae<S>Searsia_natalensis]:1.3623537371,(Psyttalia_concolor_GMSUH507-15_[Host_Plants<F>Simaroubaceae<S>Harrisonia_abyssinica<F>Oleaceae<S>Olea_europaea]:0.1966674610,Psyttalia_lounsburyi_MH841900_PSYT004-18_[Host_Plants<F>Oleaceae<S>Olea_europaea<F>Olacaceae<S>Strombosia_scheffleri]:0.0403088248)100:0.9904965800)65:0.2502944422)59:0.0498795625)99:0.2430726124)33:0.0406971975,(Celidodacus_obnubilus_JTB016-12_[Host_Plants<F>Fabaceae<S>Canavalia_africana<F>Fabaceae<S>Canavalia_cathartica]:0.1239434649,Perilampsis_pulchella_JTB215-12_[Host_Plants<F>Loranthaceae<S>Agelanthus_sp.]:0.0991950746)42:0.0244963157)13:0.0341663230,(Carpophthoromyia_dimidiata_JTB036-12_[Host_Plants<F>Putranjivaceae<S>Drypetes_gerrardii]:0.1892764224,((((((((Ceratitis_anonae_JTB201-12_[Host_Plants<F>Moraceae<S>Antiaris_toxicaria<F>Annonaceae<S>Artabotrys_monteiroae<F>Rubiaceae<S>Coffea_arabica<F>Sapotaceae<S>Englerophytum_oblanceolatum<F>Rosaceae<S>Rhaphiolepis_bibas<F>Rubiaceae<S>Leptactina_platyphylla<F>Mo:0.0050607918,Ceratitis_fasciventris_JTB287-12_[Host_Plants<F>Apocynaceae<S>Acokanthera_schimperi<F>Annonaceae<S>Annona_senegalensis<F>Moraceae<S>Antiaris_toxicaria<F>Annonaceae<S>Artabotrys_monteiroae<F>Rubiaceae<S>Coffea_arabica<F>Salicaceae<S>Dovyalis_caffra<F>Putr:0.0158529287)92:0.0102066038,Ceratitis_rosa_JTB007-12_[Host_Plants<F>Sapindaceae<S>Allophylus_pervillei<F>Fabaceae<S>Angylocalyx_braunii<F>Annonaceae<S>Annona_senegalensis<F>Rubiaceae<S>Calycosiphonia_spathicalyx<F>Apocynaceae<S>Dictyophleba_lucida<F>Putranjivaceae<S>Drypetes_natale:0.0055984440)92:0.0181138362,Ceratitis_rubivora_JTB234-12_[Host_Plants<F>Rosaceae<S>Rubus_apetalus<F>Rosaceae<S>Rubus_keniensis<F>Rosaceae<S>Rubus_niveus<F>Rosaceae<S>Rubus_pinnatus<F>Rosaceae<S>Rubus_rigidus<F>Rosaceae<S>Rubus_scheffleri<F>Rosaceae<S>Rubus_steudneri]:0.0325935691)58:0.0096043800,(Ceratitis_flexuosa_MVTBI055-08_[Host_Plants<F>Moraceae<S>Antiaris_toxicaria]:0.0454831775,Ceratitis_copelandi_MVTBI170-08_[Host_Plants<F>Sapotaceae<S>Chrysophylum_gorungosanum<F>Sapotaceae<S>Donella_viridifolia<F>Salicaceae<S>Dovyalis_abyssinica<F>Sapotaceae<S>Englerophytum_natalense<F>Annonaceae<S>Monanthotaxis_parvifolia<F>Achariaceae<S>Raw:0.0390146064)37:0.0125297245)53:0.0155771041,(((Ceratitis_caetrata_MVTBI169-08_[Host_Plants<F>Apocynaceae<S>Carissa_spinarum<F>Ebenaceae<S>Euclea_divinorum<F>Sapotaceae<S>Manilkara_butugi<F>Sapotaceae<S>Mimusops_bagshawei]:0.0026378839,Ceratitis_capitata_JTB108-12_[Host_Plants<F>Apocynaceae<S>Acokanthera_oppositifolia<F>Apocynaceae<S>Acokanthera_schimperi<F>Euphorbiaceae<S>Antidesma_venosum<F>Annonaceae<S>Artabotrys_monteiroae<F>Salvadoraceae<S>Azima_tetracantha<F>Boraginaceae<S>Bourre:0.0069051714)100:0.0729289632,Ceratitis_querita_JTB324-12_[Host_Plants<F>Sapotaceae<S>Donella_viridifolia<F>Salicaceae<S>Ludia_mauritiana<F>Loganiaceae<S>Strychnos_mitis]:0.0548671822)27:0.0197197099,((Ceratitis_cornuta_MVTBI038-08_[Host_Plants<F>Rubiaceae<S>Oxyanthus_speciosus]:0.1173675250,Ceratitis_pedestris_JTB021-12_[Host_Plants<F>Loganiaceae<S>Strychnos_madagascariensis]:0.0614974491)53:0.0272682577,(Ceratitis_gravinotata_AFRFF076-16_[Host_Plants<F>Podocarpaceae<S>Afrocarpus_gracilior]:0.0412118276,Ceratitis_podocarpi_MVTBI062-08_[Host_Plants<F>Podocarpaceae<S>Afrocarpus_gracilior]:0.0158376300)87:0.0245852200)26:0.0087278914)21:0.0158042227)35:0.0173659456,(((Ceratitis_cosyra_JTB184-12_[Host_Plants<F>Annonaceae<S>Annona_muricata<F>Annonaceae<S>Annona_senegalensis<F>Fabaceae<S>Cordyla_africana<F>Apocynaceae<S>Landolphia_sp.<F>Anacardiaceae<S>Mangifera_indica<F>Apocynaceae<S>Saba_comorensis<F>Anacardiaceae<S>Sc:0.0509279835,Ceratitis_discussa_MVTBI049-08_[Host_Plants<F>Annonaceae<S>Annona_senegalensis]:0.0290627794)97:0.0333625390,Ceratitis_striatella_AFRFF064-16_[Host_Plants<F>Apocynaceae<S>Dictyophleba_lucida]:0.0579503281)93:0.0324392727,Ceratitis_oraria_MVTBI060-08_[Host_Plants<F>Celastraceae<S>Salacia_leptoclada]:0.1053435436)70:0.0299270839)32:0.0220498730,((Ceratitis_bremii_JTB305-12_[Host_Plants<F>Sapotaceae<S>Pouteria_alnifolia<F>Sapotaceae<S>Pouteria_altissima]:0.1384628667,(((Ceratitis_cuthbertsoni_MVTBI315-09_[Host_Plants<F>Apocynaceae<S>Tabernaemontana_stapfiana]:0.0557686698,Ceratitis_edwardsi_JTB297-12_[Host_Plants<F>Apocynaceae<S>Tabernaemontana_ventricosa]:0.0557796846)52:0.0131975444,Ceratitis_millicentae_JTB035-12_[Host_Plants<F>Apocynaceae<S>Ancylobothrys_petersiana<F>Apocynaceae<S>Vepris_sp.<F>Apocynaceae<S>Tabernaemontana_elegans]:0.0327225516)72:0.0344062510,Ceratitis_ditissima_JTB349-12_[Host_Plants<F>Sapotaceae<S>Chrysophylum_albidum]:0.0825267846)59:0.0241422044)99:0.0781635893,(Ceratitis_marriotti_MVTBI172-08_[Host_Plants<F>Solanaceae<S>Solanum_anguivi<F>Solanaceae<S>Solanum_schumannianum]:0.0692916928,Trirhithrum_overlaeti_JTB246-12_[Host_Plants<F>Solanaceae<S>Solanum_terminale]:0.0973688141)87:0.0634415606)11:0.0043762525)5:0.0093593252,((Ceratitis_stictica_JTB219-12_[Host_Plants<F>Rubiaceae<S>Craterispermum_schweinfurthii]:0.0890605289,Trirhithrum_teres_MVTBI167-08_[Host_Plants<F>Rubiaceae<S>Eumachia_abrupta]:0.0736355036)43:0.0196685869,(((Trirhithrum_coffeae_JTB218-12_[Host_Plants<F>Rubiaceae<S>Coffea_arabica<F>Rubiaceae<S>Coffea_eugenioides]:0.0486531428,(Trirhithrum_fraternum_JTB188-12_[Host_Plants<F>Rubiaceae<S>Craterispermum_schweinfurthii]:0.0096309732,Trirhithrum_nigerrimum_JTB178-12_[Host_Plants<F>Vitaceae<S>Ampelocissus_africana<F>Euphorbiaceae<S>Antidesma_venosum<F>Boraginaceae<S>Bourreria_petiolaris<F>Apocynaceae<S>Carissa_tetramera<F>Vitaceae<S>Afrocayratia_gracilis<F>Rubiaceae<S>Chassalia_umbrat:0.0171283931)64:0.0121691565)96:0.0328148239,(Trirhithrum_meladiscum_JTB043-12_[Host_Plants<F>Rubiaceae<S>Chassalia_discolor<F>Rubiaceae<S>Chassalia_kenyensis<F>Rubiaceae<S>Chassalia_parvifolia<F>Rubiaceae<S>Lasianthus_kilimandscharicus<F>Rubiaceae<S>Psychotria_fractinervata<F>Rubiaceae<S>Psychotria:0.0773103660,Trirhithrum_senex_MVTBI166-08_[Host_Plants<F>Rubiaceae<S>Chassalia_umbraticola<F>Rubiaceae<S>Geophila_uniflora<F>Rubiaceae<S>Psychotria_alsophila<F>Rubiaceae<S>Psychotria_amboniana<F>Rubiaceae<S>Psychotria_capensis<F>Rubiaceae<S>Psychotria_faucicola<F>Ru:0.0789163128)70:0.0204279341)49:0.0034905881,Trirhithrum_culcasiae_MVTBI162-08_[Host_Plants<F>Araceae<S>Culcasia_falcifolia<F>Araceae<S>Culcasia_orientalis]:0.1388506753)40:0.0171646796)30:0.0147176919)22:0.0357331642)5:0.0000026106)27:0.0290490979,Munromyia_whartoni_GQ254294_LPNGM003-07_[Host_Plants<F>Oleaceae<S>Noronhia_nilotica]:0.2356421604)25:0.0204158178,Ceratitis_connexa_MVTBI275-09_[Host_Plants<F>Sapotaceae<S>Synsepalum_brevipes<F>Canellaceae<S>Warburgia_ugandensis]:0.2134972233)34:0.0195954224,(((Dacus_arcuatus_MVTBI082-08_[Host_Plants<F>Apocynaceae<S>Pergularia_daemia]:0.0798518049,Dacus_tenebricus_MVTBI153-08_[Host_Plants<F>Apocynaceae<S>Gomphocarpus_semilunatus]:0.0663913227)100:0.1282817809,Dacus_vertebratus_JTB086-12_[Host_Plants<F>Cucurbitaceae<S>Cucumis_aculeatus<F>Cucurbitaceae<S>Cucumis_dipsaceus]:0.1342259412)42:0.0359910397,(((Dacus_ciliatus_JTB174-12_[Host_Plants<F>Cucurbitaceae<S>Coccinia_trilobata<F>Cucurbitaceae<S>Corallocarpus_ellipticus<F>Cucurbitaceae<S>Cucumis_dipsaceus<F>Cucurbitaceae<S>Kedrostis_foetidissima]:0.0886481839,Dacus_frontalis_AFRFF083-16_[Host_Plants<F>Cucurbitaceae<S>Coccinia_grandis<F>Cucurbitaceae<S>Coccinia_trilobata<F>Cucurbitaceae<S>Cucumis_prophetarum]:0.0708405952)84:0.0516055388,(Dacus_limbipennis_JTB279-12_[Host_Plants<F>Cucurbitaceae<S>Momordica_cissoides<F>Cucurbitaceae<S>Momordica_foetida]:0.1401711227,(Dacus_pleuralis_JTB357-12_[Host_Plants<F>Cucurbitaceae<S>Lagenaria_sphaerica]:0.1649086967,Dacus_punctatifrons_JTB049-12_[Host_Plants<F>Cucurbitaceae<S>Cucumis_dipsaceus<F>Cucurbitaceae<S>Diplocyclos_palmatus<F>Cucurbitaceae<S>Lagenaria_sphaerica<F>Cucurbitaceae<S>Momordica_trifoliolata<F>Cucurbitaceae<S>Peponium_vogelii<F>Cucurbitaceae<S>Zehn:0.1296913888)46:0.0116840790)39:0.0238891701)37:0.0235583436,(Dacus_phloginus_MVTBI136-08_[Host_Plants<F>Cucurbitaceae<S>Zehneria_minutiflora]:0.0516876965,(Dacus_apostata_MVTBI237-08_[Host_Plants<F>Cucurbitaceae<S>Zehneria_scabra]:0.0000009996,Dacus_triater_MVTBI239-08_[Host_Plants<F>Cucurbitaceae<S>Zehneria_scabra]:0.0000009996)100:0.0590073562)100:0.0838181315)55:0.0272264282)35:0.0329986721)83:0.0815743119);"
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
  //handle inframe
  const iframeSrc = `/phylotree.html`;

  const handleIframeLoad = () => {
    const iframe = iframeRef.current;
    const iframeWindow = iframe.contentWindow;

    // Check if newickData is present
    if (newickData) {
      // Send a message to the iframe to load the data
      iframeWindow.postMessage(
        {
          type: "loadData",
          data: { newickData },
        },
        "*"
      );
    }
    // else {
    //   console.log("No newickData to send to iframe.");
    // }
  };
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
                    insects-COI and host plants
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
