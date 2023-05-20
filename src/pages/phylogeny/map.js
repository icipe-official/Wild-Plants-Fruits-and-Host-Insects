import React, { useEffect, useRef } from "react";
import "ol/ol.css";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";
import VectorLayer from "ol/layer/Vector";
import VectorSource from "ol/source/Vector";
import Point from "ol/geom/Point";
import Feature from "ol/Feature";
import { fromLonLat } from "ol/proj";

export default function OpenLayersMap() {
  const mapRef = useRef(null);

  useEffect(() => {
    const map = new Map({
      target: mapRef.current,
      layers: [
        new TileLayer({
          source: new OSM(),
        }),
      ],
      view: new View({
        center: fromLonLat([38, 1]),
        zoom: 6.5,
      }),
    });

    const vectorLayer = new VectorLayer({
      source: new VectorSource({
        features: [
          // new Feature({
          //   geometry: new Point(fromLonLat([36.81667, -1.28333])),
          // }),
          // new Feature({
          //   geometry: new Point(fromLonLat([34.6698, 0.0712])),
          // }),
          // new Feature({
          //   geometry: new Point(fromLonLat([35.7483, 0.2973])),
          // }),
          new Feature({
            geometry: new Point(fromLonLat([34.56055, 0.5635])),
          }),
        ],
      }),
    });

    map.addLayer(vectorLayer);

    return () => {
      map.setTarget(null);
    };
  }, []);

  return <div ref={mapRef} style={{ width: "100%", height: "800px" }} />;
}
