# Create an image for the learn-travis
FROM node AS source
RUN mkdir -p /node/learn-travis
ADD src/ /node/learn-travis
WORKDIR /node/learn-travis
RUN npm install

FROM node:alpine
ARG APP_VERSION=V1.1
LABEL org.label-schema.version=$APP_VERSION
ENV NODE_ENV="production"
COPY --from=source /node/learn-travis /node/learn-travis
WORKDIR /node/learn-travis
EXPOSE 3000
ENTRYPOINT ["./bin/www"]
