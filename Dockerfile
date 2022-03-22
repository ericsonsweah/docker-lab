FROM node:17-alpine as builder 
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder .  /usr/share/nginx/html 
