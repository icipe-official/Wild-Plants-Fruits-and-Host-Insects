// // import join from "path";
// // import { readFileSync } from "fs";

// // export const serverOptions = {
// //   https: {
// //     key: readFileSync(join(__dirname, "/key.pem")),
// //     cert: readFileSync(join(__dirname, "/cert.pem")),
// //   },
// // };

// // const withTM = require('next-transpile-modules')(['@ionic/react', '@ionic/core', '@stencil/core', 'ionicons']);

// // module.exports = withTM({
// //   reactStrictMode: true,
// //   images: {
// //     loader: 'imgix',
// //     path: '/',
// //   },
// // });
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  webpack(config) {
    config.module.rules.push({
      test: /\.svg$/i,
      issuer: /\.[jt]sx?$/,
      use: ["@svgr/webpack"],
    });

    return config;
  },
  async rewrites() {
    return [
      {
        source: "/",
        destination: process.env.NEXT_PUBLIC_API_BASE_URL,

        // destination: "http://192.168.43.93:3000",
      },
    ];
  },
  // server: {
  //   host: "0.0.0.0",
  // },
};
// module.exports = {
//   images: {
//     unoptimized: true,
//   },
// };
// module.exports = withTM({
//   webpack: (config, options) => {
//     return config;
//   },
// });
// next.config.js
module.exports = nextConfig;
module.exports = {
  basePath: '/wpfhi',
  images: {
    unoptimized: true,
  },
};

// module.exports = {
//   async headers() {
//     return [
//       {
//         // matching all API routes
//         source: "*",
//         headers: [
//           { key: "Access-Control-Allow-Credentials", value: "true" },
//           { key: "Access-Control-Allow-Origin", value: "*" },
//           {
//             key: "Access-Control-Allow-Methods",
//             value: "GET,OPTIONS,PATCH,DELETE,POST,PUT",
//           },
//           {
//             key: "Access-Control-Allow-Headers",
//             value:
//               "X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version",
//           },
//         ],
//       },
//     ];
//   },
// // };
// module.exports = {
//   async headers() {
//     return [
//       {
//         source: "*",
//         headers: [
//           { key: "Access-Control-Allow-Credentials", value: "true" },
//           {
//             key: "Access-Control-Allow-Origin",
//             value: "http://localhost:3000",
//           },
//           {
//             key: "Access-Control-Allow-Methods",
//             value: "GET, POST, PUT, DELETE, OPTIONS",
//           },
//           {
//             key: "Access-Control-Allow-Headers",
//             value: "X-Requested-With, Content-Type, Authorization",
//           },
//         ],
//       },
//     ];
//   },
// };
// // configure nextjs app to handle html files

// // const withMDX = require("@next/mdx")();
// // module.exports = withMDX({
// //   pageExtensions: ["js", "jsx", "md", "mdx", "html"],
// //   webpack: (config, { isServer }) => {
// //     if (!isServer) {
// //       // Add a rule to handle HTML files
// //       config.module.rules.push({
// //         test: /\.html$/i,
// //         use: "raw-loader",
// //       });
// //     }
// //     return config;
// //   },
// // });

// export default nextConfig;

// // module.exports = {
// //   // env: {
// //   //   NEXT_PUBLIC_API_BASE_URL: "http://localhost:3000",
// //   //   TARGET_URL: process.env.TARGET_URL || "http://localhost:3000",
// //   // },
// //   // images: {
// //   //   unoptimized: true,
// //   // },
// //   async rewrites() {
// //     return [
// //       {
// //         source: "/",
// //         destination: "http://localhost:3000",
// //       },
// //     ];
// //   },
// // };
// export const images = {
//   unoptimized: true,
// };
// const nextConfig = {
//   reactStrictMode: true,
//   swcMinify: true,
//   webpack(config) {
//     config.module.rules.push({
//       test: /\.svg$/i,
//       issuer: /\.[jt]sx?$/,
//       use: ["@svgr/webpack"],
//     });

//     return config;
//   },

//   async rewrites() {
//     return [
//       {
//         source: "/",
//         destination: "http://localhost:3000",
//       },
//     ];
//   },
//   server: {
//     host: '0.0.0.0',
//   },
//     images: {
//       unoptimized: true,
//     },

// };

// export default nextConfig;

// const nextConfig = {
//   reactStrictMode: true,
//   swcMinify: true,
//   webpack(config) {
//     config.module.rules.push({
//       test: /\.svg$/i,
//       issuer: /\.[jt]sx?$/,
//       use: ["@svgr/webpack"],
//     });

//     return config;
//   },

//   async rewrites() {
//     return [
//       {
//         source: "/",
//         destination: "http://localhost:3000",
//       },
//     ];
//   },
//   server: {
//     host: '0.0.0.0',
//   },
//   images: {
//     unoptimized: true,
//   },
// };

// export default nextConfig;
