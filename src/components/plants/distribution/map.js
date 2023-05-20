import React, { useRef, useEffect, useState } from "react";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";
import VectorLayer from "ol/layer/Vector";
import VectorSource from "ol/source/Vector";
import { Circle, Fill, Style } from "ol/style";
import { fromLonLat } from "ol/proj";
import Feature from "ol/Feature";
import Point from "ol/geom/Point";
import { FullScreen, Zoom, ZoomSlider } from "ol/control";

const OpenLayersMap = ({ coordinates }) => {
  const [coleopteraData, setcoleopteraData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  const mapRef = useRef(null);

  // const fetcher = (url) => fetch(url).then((r) => r.json());
  // const species = router.query.speciesName;
  // const { data, error: plantsPageError } = useSWR(
  //   `/api/plantsPage/${species}`,
  //   fetcher
  // );
  const circleStyle = new Style({
    image: new Circle({
      fill: new Fill({
        color: "green",
      }),
      radius: 6,
    }),
  });
  useEffect(() => {
    if (coordinates && coordinates.length > 0) {
      // const points = data.map((specie) =>
      //   specie.plants_regions.map((region) => region.regions)
      // );
      console.log("points length");
      console.log(coordinates[0].length);
      console.log(coordinates[0][0]);


      // console.log(points);
      // const coordinates = location_data.map((specie) =>
      //   specie.plants_regions.map((region) => {
      //     const latitude = parseFloat(region.regions.latitude);
      //     const longitude = parseFloat(region.regions.longitude);
      //     return [longitude, latitude];
      //   })
      // );
      // console.log("coordinates");
      // console.log(
      //   coordinates.map((c) => {
      //     return c;
      //   })
      // );

      // const features = coordinates.flatMap((coordinate) => {
      //   if (Array.isArray(coordinate) && coordinate.length > 1) {
      //     return coordinate.map((co) => {
      //       console.log(co);
      //       return new Feature({
      //         geometry: new Point(fromLonLat([co[0], co[1]])),
      //       });
      //     });
      //   }
      //   return []; // Return an empty array for invalid coordinates
      // });
      const features =
      coordinates[0].length > 1
        ? coordinates.flatMap((coordinate) => {
            if (Array.isArray(coordinate) && coordinate.length > 1) {
              return coordinate.map((co) => {
                console.log(co);
                return new Feature({
                  geometry: new Point(fromLonLat([co[0], co[1]])),
                });
              });
            }
            return []; // Return an empty array for invalid coordinates
          })
        : coordinates[0].length === 1
        ? [new Feature({ geometry: new Point(fromLonLat(coordinates[0][0])) })]
        : [];

      console.log("features", features);
      setcoleopteraData(features);
      setLoaded(true);
    }
  }, [coordinates]);

  useEffect(() => {
    if (loaded && coleopteraData) {
      if (mapRef.current) {
        const map = new Map({
          target: mapRef.current,
          layers: [new TileLayer({ source: new OSM() })],
          view: new View({
            center: fromLonLat([38, 1]),
            zoom: 5.5,
          }),
          controls: [
            // ss
            new Zoom(),
            new ZoomSlider(),
          ],
        });
        // // create a button to trigger the full screen mode
        // const fullScreenButton = document.createElement("button");
        // fullScreenButton.textContent = "View Full Screen";
        // fullScreenButton.addEventListener("click", () => {
        //   const mapElement = map.getTargetElement();
        //   if (mapElement.requestFullscreen) {
        //     mapElement.requestFullscreen();
        //   } else if (mapElement.webkitRequestFullscreen) {
        //     /* Safari */
        //     mapElement.webkitRequestFullscreen();
        //   } else if (mapElement.msRequestFullscreen) {
        //     /* IE11 */
        //     mapElement.msRequestFullscreen();
        //   }
        // });

        // // add the button to the map's target element
        // const mapTargetElement = map.getTargetElement();
        // mapTargetElement.appendChild(fullScreenButton);

        const vectorLayer = new VectorLayer({
          source: new VectorSource({
            features: coleopteraData,
          }),
          style: circleStyle,
        });

        map.addLayer(vectorLayer);

        return () => {
          map.setTarget(null);
        };
      }
    }
  }, [coleopteraData, loaded, mapRef]);

  // // create a button or link to trigger the full screen mode
  // const fullScreenButton = document.createElement("button");
  // fullScreenButton.textContent = "View Full Screen";
  // fullScreenButton.addEventListener("click", () => {
  //   const mapElement = map.getTargetElement();
  //   if (mapElement.requestFullscreen) {
  //     mapElement.requestFullscreen();
  //   } else if (mapElement.webkitRequestFullscreen) {
  //     /* Safari */
  //     mapElement.webkitRequestFullscreen();
  //   } else if (mapElement.msRequestFullscreen) {
  //     /* IE11 */
  //     mapElement.msRequestFullscreen();
  //   }
  // });

  // append the button to your page
  // document.body.appendChild(fullScreenButton);

  return <div ref={mapRef} style={{ width: "100%", height: "40vh" ,marginBottom:"2rem"}}></div>;
};

export default OpenLayersMap;
