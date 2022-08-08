FROM node:18

RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install

COPY . .

ENV PORT 3000
ENV MONGO_USERNAME ""
ENV MONGO_PASSWORD ""
ENV MONGO_HOSTNAME mongo
ENV MONGO_PORT 27017

CMD ["npm", "start"]
