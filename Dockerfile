FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN yarn install --upgrade
COPY ./ ./
RUN yarn build

FROM nginx
ENV NGINX_PORT $PORT
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
