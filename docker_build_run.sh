#! /bin/bash

npm run build
docker build . -t remix-app
docker run -p 3000:3000 remix-app
