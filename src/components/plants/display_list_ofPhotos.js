import { shape } from "@mui/system";
import Image from "next/image";
//This component will be receiving data from getstaticprops
export default function Photos({photo_data}){
    console.log('photosss');
   console.log(photo_data)
   const photos=photo_data.map((plant=>(
     plant.plant_photo.map((y)=>(
      y.photo_name
     )
    ))))[0]
  

   console.log('photos array')
 
   console.log((photos[0][1]))
   console.log(photos.length)

   //.map(family => family.name)));
  //  return (
  //    <div>
  //         {photo_data.map((specie) => (
  //           <li key={specie.id}>
  //           {/* <br></br>
  //           Images
  //           <br></br> */}
  //           {specie.plant_photo.map((photo =>{ 
  //           return(
  //             <Image 
  //             //loader={myLoader}
  //             src={`/plants/${photo.photo_name}`}
  //             alt="Pic  ture of the plant"
  //             width={500}
  //             height={400}
  //           /> )
  //           }))},
  //            </li>
  //         ))}
  //          </div>)
  //  }
}