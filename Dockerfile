#Build Phase-----------------

FROM node:alpine as buildPhase

WORKDIR /usr/src/app/frontend/

COPY ./package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Ngnix Run Phase

FROM nginx

COPY --from=buildPhase /usr/src/app/frontend/build /usr/share/nginx/html

CMD [ "nginx","-g","daemon off;" ]
