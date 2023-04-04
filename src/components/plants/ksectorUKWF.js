import KsectorUKWFKeys from "./distribution/ukwfareas/ksectorukwfKeyValues";
import { Box } from '@mui/system';
import KsectorUKWFValues from "./distribution/KsectorukwfValues";
export default function KsectorUKFKeyValues({k_sector_data,ukwf_area_data}){
    return(
        <Box sx={{display:"flex",marginLeft:2}}>
            <Box>
             <KsectorUKWFKeys/>
           </Box>
            <Box>
           <KsectorUKWFValues
           k_sector_data={k_sector_data}
           ukwf_area_data={ukwf_area_data}
           />
           </Box>

        </Box>
    )
}