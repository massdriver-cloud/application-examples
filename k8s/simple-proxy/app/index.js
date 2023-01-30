/* eslint-disable no-console */
import express from 'express';
import request from 'request';
import { initBackends } from './backends.js';
import { logger } from './logger.js';

const app = express();
const port = process.env.PORT || 4000;
let backends = [];

// I tried HAProxy for an hour...
app.get('/', (req, res) => {
  const theOne = backends[Math.floor(Math.random() * backends.length)];
  logger.info(`Winner winner, you pick your dinner. I'm sending the requst to: ${theONe}`);

  request.get(theOne, (err, response, body) => {
    if (!err) {
      res.send(body);
    } else {
      res.send('error');
    }
  });
});

app.get('/health', (req, res) => {
  res.send('200: OK');
});

app.listen(port, () => {
  backends = initBackends();
  logger.info(`\nBackends are: \n${backends.join("\n")}`);
  logger.info(`Faster than Rust (https://learning-rust.github.io) server listening on port: ${port}`);
});
