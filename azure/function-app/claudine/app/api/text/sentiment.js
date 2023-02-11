
async function sentiment(client, request) {
  const prompt = request.query.prompt || "I'm very upset";
  const languageResult = await client.sentiment([prompt]);

  const results = [];
  languageResult.forEach(document => {
    results.push(document);
  });
  return results;
}

export {
  sentiment,
};
