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

function OpenLayersMap({ coordinates }) {
  const [coleopteraData, setColeopteraData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const mapRef = useRef(null);

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
      const features =
        coordinates[0].length > 1
          ? coordinates.flatMap((coordinate) => {
              if (Array.isArray(coordinate) && coordinate.length > 1) {
                return coordinate.map((co) => {
                  return new Feature({
                    geometry: new Point(fromLonLat([co[0], co[1]])),
                  });
                });
              }
              return []; // Return an empty array for invalid coordinates
            })
          : coordinates[0].length === 1
          ? [
              new Feature({
                geometry: new Point(fromLonLat(coordinates[0][0])),
              }),
            ]
          : [];

      setColeopteraData(features);
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
            center: fromLonLat([37, 0]),
            zoom: 5.65,
          }),
          controls: [
            new FullScreen({
              className: "ol-fullscreen",
              tipLabel: "Exit Fullscreen", // Set the tooltip for the exit fullscreen button
            }), // Add FullScreen control
            new Zoom(),
            new ZoomSlider(),
          ],
        });

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

  return (
    <div
      ref={mapRef}
      style={{ width: "100%", height: "40vh", marginBottom: "2rem" }}
    />
  );
}

export default OpenLayersMap;
