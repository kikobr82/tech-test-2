FROM node:12.3.1-alpine AS build
WORKDIR /usr/app/
ADD src ./src
ADD tests ./tests
ADD package.json .
ADD .eslintrc.yml .
RUN npm install


FROM node:12.3.1-alpine AS test
ARG BUILD_DESCRIPTION
ENV BUILD_DESCRIPTION=${BUILD_DESCRIPTION:-unknown}

WORKDIR /usr/app

ARG BUILD_SHA
ENV BUILD_SHA=${BUILD_SHA:-unknown}

ARG BUILD_VERSION
ENV BUILD_VERSION=${BUILD_VERSION:-unknown}

COPY --from=build /usr/app/src /usr/app/
COPY --from=build /usr/app/tests /usr/app/tests
COPY --from=build /usr/app/package.json /usr/app/
COPY --from=build /usr/app/.eslintrc.yml /usr/app/
COPY --from=build /usr/app/node_modules /usr/app/node_modules


FROM node:12.3.1-alpine AS cleanup

WORKDIR /usr/app

COPY --from=build /usr/app/src /usr/app/
COPY --from=build /usr/app/package.json /usr/app/
COPY --from=build /usr/app/node_modules /usr/app/node_modules
RUN npm prune --production


FROM node:12.3.1-alpine
ARG BUILD_DESCRIPTION
ENV BUILD_DESCRIPTION=${BUILD_DESCRIPTION:-unknown}

EXPOSE 3000

WORKDIR /usr/app

ARG BUILD_SHA
ENV BUILD_SHA=${BUILD_SHA:-unknown}

ARG BUILD_VERSION
ENV BUILD_VERSION=${BUILD_VERSION:-unknown}

COPY --from=build /usr/app/src /usr/app/
COPY --from=cleanup /usr/app/node_modules /usr/app/node_modules

CMD ["node", "/usr/app/index.js"]