# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
# Estagio 0 - Será responsavel em construir nossa aplicação
# base image 
FROM node:12.2.0 AS build-node

ENV http_proxy http://axbenites@fazenda:XXXXXXXXX@XXXXXXXXXXXX@proxy.sgo.mts.gov.br:8081
ENV https_proxy https://axbenites@fazenda:XXXXXXXXX@XXXXXXXXXXXX@proxy.sgo.mts.gov.br:8081

LABEL maintainer="axel_nomore@hotmail.com" Description="Image is used to  node 12 and amgular 7"

LABEL version="1.0"
LABEL description="Angular app"
LABEL maintainer="axel_nomore@hotmail.com"

MAINTAINER Axel <axel_nomore@hotmail.com>

# Create app directory
#WORKDIR /app
WORKDIR /usr/src/app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
#COPY package.json /app/package.json
COPY package*.json ./
#RUN npm install
#RUN npm install -g @angular/cli@7.3.9



# add app
# COPY . /app
# COPY . . 
COPY ./ /usr/src/app/
# ARG env=prod
# ARG configuration=production

#RUN npm install
RUN yarn install --proxy http://axbenites@fazenda:XXXXXXXXX@XXXXXXXXXXXX@proxy.sgo.mts.gov.br:8081
# RUN yarn add --proxy http://axbenites@fazenda:XXXXXXXXX@XXXXXXXXXXXX@proxy.sgo.mts.gov.br:8081 @angular/cli
# RUN yarn install
# RUN yarn global add @angular/cli

# run tests
#RUN ng test --watch=false
#RUN ng e2e --port 4202

# generate build
# RUN ng build --output-path=dist
RUN ng build -- --output-path=./dist
# RUN npm run build -- --output-path=./dist --configuration $configuration
# CMD ng build 
# CMD ng build --output-path=dist

# Expose ports
# EXPOSE 4201:4201

# Start Angular
# CMD ng serve --host 0.0.0.0
# CMD ["yarn", "start"]

# command 
CMD ["--help"]



# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
# Estagio 2 - Será responsavel por expor a aplicação
# base image
FROM nginx:1.16.0-alpine

LABEL author="Axel Lab"

# copy artifact build from the 'build environment'

# COPY ./requirements.txt /usr/share/nginx/html
COPY --from=build-node /usr/src/app/dist /usr/share/nginx/html
# COPY --from=build-node ./dist /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

# expose port 80
# EXPOSE 4201:4201

# run nginx
# CMD ["nginx", "-g", "daemon off;"]
