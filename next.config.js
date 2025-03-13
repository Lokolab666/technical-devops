/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "standalone",
  extends: [
    'plugin:@next/next/recommended',
  ],
};

module.exports = nextConfig;
