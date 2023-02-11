import { TextAnalyticsClient } from "@azure/ai-text-analytics";
import { DefaultAzureCredential } from '@azure/identity';

async function languageDetection(request) {
  const endpoint = process.env.COGNITIVE_SERVICES_ENDPOINT;
  if (!endpoint) throw Error('value for COGNITIVE_SERVICES_ENDPOINT not found');
  const client = new TextAnalyticsClient(endpoint, new DefaultAzureCredential());
  const prompt = request.query.prompt || "Ce document est rédigé en Français.";
  const languageResult = await client.detectLanguage([prompt]);

  const results = [];
  languageResult.forEach(document => {
    console.log(`\tPrimary Language ${document.primaryLanguage.name}`)
    results.push(document);
  });
  return results;
}

export {
  languageDetection,
};
