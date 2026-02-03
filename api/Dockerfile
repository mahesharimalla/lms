FROM node:18-bullseye

WORKDIR /app

# Prisma needs OpenSSL
RUN apt-get update -y && \
    apt-get install -y openssl && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .

# Generate Prisma client at build time
RUN npx prisma generate

# Build TypeScript at build time
RUN npm run build

EXPOSE 8081

# ✅ START APP ONLY
CMD ["node", "build/index.js"]


