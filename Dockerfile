FROM node:20 AS builder

WORKDIR /app

COPY package*.json .

RUN npm i

COPY . .

FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/node_modules ./

COPY --from=builder /app .


EXPOSE 8000

CMD ["node","app.js"]


