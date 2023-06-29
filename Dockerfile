FROM node AS builder
WORKDIR /opt/front
COPY . .
RUN npm install
FROM nginx
WORKDIR /var/www/front
COPY --from=build /opt/front/dist/ .
COPY nginx.conf /etc/nginx/
