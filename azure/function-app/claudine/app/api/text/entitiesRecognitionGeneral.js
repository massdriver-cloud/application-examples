

async function entitiesRecognitionGeneral(client, request) {
  const prompt = request.query.prompt || "Ce document est rédigé en Français.";
  const languageResult = await client.entitiesRecognitionGeneral([prompt]);

  const results = [];
  languageResult.forEach(document => {
    console.log(`\tPrimary Language ${document.primaryLanguage.name}`)
    results.push(document);
  });
  return results;
}

export {
  entitiesRecognitionGeneral,
};
