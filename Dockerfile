# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm build
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-docker-example /usr/share/nginx/html
