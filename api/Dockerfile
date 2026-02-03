FROM node:18-bullseye

WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y openssl && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 8081

CMD ["sh", "-c", "npx prisma migrate deploy && node build/index.js"]

