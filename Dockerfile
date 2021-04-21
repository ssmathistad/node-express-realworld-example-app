FROM alpine/git:v2.30.1 as builder
WORKDIR /backend
RUN git clone https://github.com/ssmathistad/node-express-realworld-example-app.git

FROM node:lts-alpine3.13
WORKDIR /backend/node-express-realworld-example-app
COPY --from=builder /backend/node-express-realworld-example-app /backend/node-express-realworld-example-app
RUN npm install \
    && apk update

EXPOSE 3000 27017 28017

ENTRYPOINT ["npm", "run", "dev"]
