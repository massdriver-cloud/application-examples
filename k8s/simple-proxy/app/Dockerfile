FROM node:latest

COPY package.json package.json
RUN yarn install

COPY . .

CMD ["yarn", "start"]
