import { TextAnalyticsClient } from "@azure/ai-text-analytics";
import { DefaultAzureCredential } from '@azure/identity';

async function analyzeSentiment(request) {
  const endpoint = process.env.COGNITIVE_SERVICES_ENDPOINT;
  if (!endpoint) throw Error('value for COGNITIVE_SERVICES_ENDPOINT not found');
  const client = new TextAnalyticsClient(endpoint, new DefaultAzureCredential());
  const prompt = request.query.prompt || "I'm very upset";
  const languageResult = await client.analyzeSentiment([prompt]);

  const results = [];
  languageResult.forEach(document => {
    results.push(document);
  });
  return results;
}

export {
  analyzeSentiment,
};
