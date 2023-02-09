import { TextAnalyticsClient } from "@azure/ai-text-analytics";
import { DefaultAzureCredential } from '@azure/identity';
import express from 'express';

const app = express()
const port = process.env.PORT || 80

// Example method for detecting the language of text
async function languageDetection(request) {
  const endpoint = process.env.COGNITIVE_SERVICES_ENDPOINT;
  if (!endpoint) throw Error('value for COGNITIVE_SERVICES_ENDPOINT not found');
  const client = new TextAnalyticsClient(endpoint, new DefaultAzureCredential());
  const prompt = request.params || "Ce document est rédigé en Français.";
  const languageResult = await client.detectLanguage(prompt);

  const results = [];
  languageResult.forEach(document => {
    console.log(`ID: ${document.id}`);
    console.log(`\tPrimary Language ${document.primaryLanguage.name}`)
    results.push(document);
  });
  return results;
}

app.get('/', (req, res) => {
  languageDetection(req)
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
})

app.get('/health', (req, res) => {
  res.send('200: OK');
})

app.listen(port, () => {
  console.log(`Application listening on port ${port}`)
})
