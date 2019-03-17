FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
ENV NGINX_PORT $PORT
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
