FROM node:12 as build
ARG NPM_TOKEN

WORKDIR /usr/src/app

COPY  . /usr/src/app

RUN env NPM_TOKEN=${NPM_TOKEN} npm ci --only=production && rm -f .npmrc


FROM node:12

WORKDIR /usr/src/app

EXPOSE 8080

COPY --from=build /usr/src/app /usr/src/app

CMD [ "node", "app-template-node.js" ]
