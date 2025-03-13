FROM node:19-bullseye

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install --save-dev @next/eslint-plugin-next

COPY . .

RUN npm run build

# Production
FROM node:19-bullseye

WORKDIR /app

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/package*.json ./

RUN npm ci --only=production

EXPOSE 3000

CMD ["npm", "run", "start"]
