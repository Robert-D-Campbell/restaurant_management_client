FROM node:14.16.1-alpine
WORKDIR /client
COPY package*.json ./
RUN yarn install
COPY . .
CMD ["yarn", "serve"]