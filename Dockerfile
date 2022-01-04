# based on:
# https://snyk.io/blog/10-best-practices-to-containerize-nodejs-web-applications-with-docker/
# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
FROM node:lts-alpine3.14@sha256:60ef0bed1dc2ec835cfe3c4226d074fdfaba571fd619c280474cc04e93f0ec5b
RUN apk add dumb-init
ENV NODE_ENV production
ENV NODE_PATH /usr/src/app
WORKDIR /usr/src/app
COPY --chown=node:node . ./
COPY package*.json ./
# RUN npm install  <- tried this, it didn't work
RUN npm ci --only=production
USER node

EXPOSE 3000

CMD ["dumb-init", "node", "./server/index.js"]

# silence annoying snyk message by running this in bash
# export DOCKER_SCAN_SUGGEST=false 
#
