// Show only map of kenya
import Map from 'ol/Map';
import View from 'ol/View';
import { Tile as TileLayer } from 'ol/layer';
import { XYZ } from 'ol/source';

const initMap = () => {
  // Create the map
  const map = new Map({
    target: 'map',
    layers: [
      new TileLayer({
        source: new XYZ({
          url: 'https://{a-c}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          maxZoom: 19,
          attribution: 'Map data © OpenStreetMap contributors',
        }),
      }),
    ],
    view: new View({
      center: [37.906193, 0.023559], // set center of kenya
      zoom: 6,
    }),
  });
  return map;
};

function Mapregions() {
  const map = initMap();
  return <div id="map" style={{ height: '400px', width: '100%' }} />;
}

export default Mapregions;
