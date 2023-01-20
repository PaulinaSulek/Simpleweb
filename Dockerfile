# syntax=docker/dockerfile:1.4
# Specify a base image
FROM node:alpine
WORKDIR /lab3
COPY package.json /lab3
# install ssh client and git
RUN apk add --no-cache openssh-client git
# download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# clone private repository
RUN --mount=type=ssh git clone git@github.com:PaulinaSulek/simpleweb.git lab2.v1
RUN npm install
COPY . /lab3
# Default command
CMD ["npm", "start"]