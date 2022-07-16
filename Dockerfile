FROM node:16.10-alpine3.11 AS build
WORKDIR /app
COPY package.json package.json
RUN yarn install
COPY . .
RUN yarn build
