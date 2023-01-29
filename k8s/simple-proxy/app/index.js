/* eslint-disable no-console */
import express from 'express';
import request from 'request';

const app = express();
const port = process.env.PORT || 4000;

// Use a loop, use reflection, mmhmm. PRs welcome. :)
function fromConnections() {
  const backends = [];
  if (process.env.BACKEND0) {
    backends.push(process.env.BACKEND0);
  }
  if (process.env.BACKEND1) {
    backends.push(process.env.BACKEND1);
  }
  if (process.env.BACKEND2) {
    backends.push(process.env.BACKEND2);
  }
  if (process.env.BACKEND3) {
    backends.push(process.env.BACKEND3);
  }
  if (process.env.BACKEND4) {
    backends.push(process.env.BACKEND4);
  }
  if (process.env.BACKEND5) {
    backends.push(process.env.BACKEND5);
  }
  return backends;
}

// I tried HAProxy for an hour...
app.get('/', (req, res) => {
  let backends = fromConnections();
  if (process.env.BACKENDS) {
    backends = process.env.BACKENDS.split(',');
  }
  console.log('backends are', backends);
  const theOne = backends[Math.floor(Math.random() * backends.length)];
  console.log(`Winner winner, you pick your dinner. I'm sending the requst to: ${theOne}`);

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
  console.log(`Example app listening on port ${port}`);
});
