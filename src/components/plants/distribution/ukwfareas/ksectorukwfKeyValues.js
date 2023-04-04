import KsectorFeatureKeys from "../KsectorsKeys";
import UKWFeatureKeys from "./ukwfkeys"
import { Box } from '@mui/system';
export default function KsectorUKWFKeys(){
    return(
        <Box sx={{display:"column"}}>
             <Box>
             <KsectorFeatureKeys/>
            </Box>
            <Box>
            <UKWFeatureKeys/>
            </Box>
        </Box>
    )
}