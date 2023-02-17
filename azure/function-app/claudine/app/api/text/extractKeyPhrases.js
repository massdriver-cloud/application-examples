
async function extractKeyPhrases(client, request) {
  const prompt = request.query.prompt || "Ce document est rédigé en Français.";
  const languageResult = await client.extractKeyPhrases([prompt]);

  const results = [];
  languageResult.forEach(document => {
    console.log(`\tPrimary Language ${document.primaryLanguage.name}`)
    results.push(document);
  });
  return results;
}

export {
  extractKeyPhrases,
};
