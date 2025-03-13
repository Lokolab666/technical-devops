/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "standalone",
  images: {
    unoptimized: true,
  },
  extends: [
    'plugin:@next/next/recommended',
  ],
};

module.exports = nextConfig;
