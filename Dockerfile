FROM node:16-alpine
WORKDIR /app
COPY package.json /app
RUN npm install && npm install -g npm@9.2.0
COPY . /app
CMD node /app/server/server.js
EXPOSE 3000
