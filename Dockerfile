#stage 1
#FROM node:11.15.0-alpine as build-step
#WORKDIR /app
#COPY package.json ./
#RUN npm install
#COPY . .
#RUN npm run build --prod

#stage 2
#FROM nginx:1.16.1-alpine as prod-stage
#COPY --from=build-step /app/dist/ok4sign-client /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
#-----------------------------------------------------------------------

#stage 1
FROM node:12.16.3 as build-step
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
#RUN npm run build
RUN npm run build-prod

#stage 2
FROM httpd:2.4.41-alpine
COPY --from=build-step /app/dist/camera-app /usr/local/apache2/htdocs/
