# syntax=docker/dockerfile:1.4

FROM node:alpine


WORKDIR /usr/app


RUN apk add --no-cache openssh-client git

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts


RUN --mount=type=ssh git clone git@github.com:PaulinaSulek/simpleweb.git 

WORKDIR /usr/app/simpleweb

RUN npm install

CMD ["npm", "start"]
