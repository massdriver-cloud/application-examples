import express from 'express';
import {
  analyzeSentiment,
  languageDetection
} from "./text/index.js";

const app = express()
const port = process.env.PORT || 80

app.get('/', (req, res) => {
  languageDetection(req)
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
})

app.get('/sentiment', (req, res) => {
  analyzeSentiment(req)
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
})

app.get('/health', (req, res) => {
  res.send('200: OK');
})

app.listen(port, () => {
  console.log(`Application listening on port ${port}`)
})
