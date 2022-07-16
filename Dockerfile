FROM node:16.10-alpine3.11 AS build
WORKDIR /app
COPY package.json package.json
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:1.21-alpine
COPY --from=build /app/build /opt/site
COPY nginx.conf /etc/nginx/nginx.conf