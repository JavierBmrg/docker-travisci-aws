FROM node:alpine as build-app

WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=build-app /app/build /usr/share/nginx/html
