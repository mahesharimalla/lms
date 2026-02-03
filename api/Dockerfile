# 1️⃣ Use fixed Node version
FROM node:18-alpine

# 2️⃣ Create app directory
WORKDIR /app

# 3️⃣ Install dependencies (clean & deterministic)
COPY package*.json ./
RUN npm ci

# 4️⃣ Copy source & config
COPY tsconfig.json ./
COPY src ./src
COPY prisma ./prisma

# 5️⃣ Prisma + Build
RUN npx prisma generate
RUN npm run build

# 6️⃣ Expose API port
EXPOSE 8081

# 7️⃣ Start compiled app
CMD ["npm", "start"]
