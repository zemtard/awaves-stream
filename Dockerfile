FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
#WORKDIR /app

WORKDIR /usr/src/app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]

#BUILD: docker build -t <NAME> .

#RUN FROM CLI LIKE THIS: docker run -p 8080:8080 -d zemtard/awavesstream

##problem might be because npm build creates index.html with undefined paths. ??how to fix??

##changing publicPath:'./' un vue.config.js and rebuilding project seems to work