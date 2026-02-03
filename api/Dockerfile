FROM node:18-bullseye

WORKDIR /app

# Prisma needs OpenSSL
RUN apt-get update -y && \
    apt-get install -y openssl && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build TypeScript
RUN npm run build

EXPOSE 8081

# ONLY start the app
CMD ["node", "build/index.js"]
