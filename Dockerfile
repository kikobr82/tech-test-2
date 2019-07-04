FROM node:12.3.1-stretch
WORKDIR /usr/app/
ADD src ./src
ADD package.json .

ARG BUILD_DESCRIPTION
ENV BUILD_DESCRIPTION=${BUILD_DESCRIPTION:-unknown}

WORKDIR /usr/app

ARG BUILD_SHA
ENV BUILD_SHA=${BUILD_SHA:-unknown}

ARG BUILD_VERSION
ENV BUILD_VERSION=${BUILD_VERSION:-unknown}

RUN npm install


CMD ["node", "/usr/app/src/index.js"]