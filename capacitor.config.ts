import { CapacitorConfig } from "@capacitor/cli";

const config: CapacitorConfig = {
  appId: "com.example.app",
  appName: "PlantsFruitsInsects",
  webDir: "out",
  bundledWebRuntime: false,
  server: {
    url: "http://127.0.0.1:3000",
    // url: "127.0.0.1:3000",
  },
  plugins: {
    CapacitorHttp: {
      enabled: true,
    },
  },
};

export default config;
