# How I created this example repo
Here's the session where I ran create-remix:
```
% npx create-remix@latest

R E M I X

💿 Welcome to Remix! Let's get you set up with a new project.

? Where would you like to create your app? ./create-remix-docker
? Where do you want to deploy? Choose Remix if you're unsure, it's easy to change deployment targets. Express Server
? TypeScript or JavaScript? TypeScript
? Do you want me to run `npm install`? Yes

> postinstall
> remix setup node

Successfully setup Remix for node.

added 443 packages, and audited 444 packages in 15s

142 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
💿 That's it! `cd` into "create-remix-docker" and check the README for development and deploy instructions!
```

I then left everything else alone and added the Dockerfile 

# Error I get when running docker_build_run.sh
```
=> [internal] load build definition from Dockerfile                                                                                                                                                  0.0s
 => => transferring dockerfile: 663B                                                                                                                                                                  0.0s
 => [internal] load .dockerignore                                                                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                                                                       0.0s
 => [internal] load metadata for docker.io/library/node:lts-alpine3.14@sha256:60ef0bed1dc2ec835cfe3c4226d074fdfaba571fd619c280474cc04e93f0ec5b                                                        0.0s
 => [internal] load build context                                                                                                                                                                     9.0s
 => => transferring context: 119.46MB                                                                                                                                                                 8.9s
 => [1/6] FROM docker.io/library/node:lts-alpine3.14@sha256:60ef0bed1dc2ec835cfe3c4226d074fdfaba571fd619c280474cc04e93f0ec5b                                                                          0.0s
 => CACHED [2/6] RUN apk add dumb-init                                                                                                                                                                0.0s
 => CACHED [3/6] WORKDIR /usr/src/app                                                                                                                                                                 0.0s
 => [4/6] COPY --chown=node:node . ./                                                                                                                                                                 1.5s
 => [5/6] COPY package*.json ./                                                                                                                                                                       0.1s
 => ERROR [6/6] RUN npm install                                                                                                                                                                       4.1s
------
 > [6/6] RUN npm install:
#10 3.991 
#10 3.991 > postinstall
#10 3.991 > remix setup node
#10 3.991 
#10 4.003 sh: remix: not found
#10 4.006 npm notice 
#10 4.006 npm notice New minor version of npm available! 8.1.0 -> 8.3.0
#10 4.007 npm notice Changelog: <https://github.com/npm/cli/releases/tag/v8.3.0>
#10 4.007 npm notice Run `npm install -g npm@8.3.0` to update!
#10 4.009 npm notice 
#10 4.011 npm ERR! code 127
#10 4.011 npm ERR! path /usr/src/app
#10 4.014 npm ERR! command failed
#10 4.014 npm ERR! command sh -c remix setup node
#10 4.028 
#10 4.028 npm ERR! A complete log of this run can be found in:
#10 4.028 npm ERR!     /root/.npm/_logs/2022-01-04T21_23_49_168Z-debug.log
------
executor failed running [/bin/sh -c npm install]: exit code: 127
```

# Other variations I tried

1. use `npm install` instead of `npm ci --only=production`
  This still resulted  in the above error