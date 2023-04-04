import KsectorValues from "./KsectorValues";
import { Box } from '@mui/system';
import UKWFValues from "./ukwfareas/ukwfvalues";
export default function KsectorUKWFValues({ukwf_area_data,k_sector_data}){
    return(
        <Box sx={{display:"column"}}>
             <Box>
             <KsectorValues k_sector_data={k_sector_data}/>
            </Box>
            <Box>
            <UKWFValues ukwf_area_data={ukwf_area_data}/>
            </Box>
        </Box>
    )
}