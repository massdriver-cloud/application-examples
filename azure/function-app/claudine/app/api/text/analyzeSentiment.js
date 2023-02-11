
async function analyzeSentiment(client, request) {
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
