const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  webpack(config) {
    config.module.rules.push({
      test: /\.svg$/i,
      issuer: /\.[jt]sx?$/,
      use: ["@svgr/webpack"],
    });

    // Exclude ////console.log statements in production
    if (config.mode === "production") {
      config.optimization.minimizer.forEach((minimizer) => {
        if (minimizer.constructor.name === "TerserPlugin") {
          minimizer.options.terserOptions.compress.drop_console = true;
        }
      });
    }

    return config;
  },
  // page redirect
  async rewrites() {
    return [
      {
        source: "/",
        destination: process.env.NEXT_PUBLIC_API_BASE_URL,
      },
    ];
  },
  // server: {
  //   host: "0.0.0.0",
  // },
  images: {
    unoptimized: true,
  },
};

module.exports = nextConfig;
