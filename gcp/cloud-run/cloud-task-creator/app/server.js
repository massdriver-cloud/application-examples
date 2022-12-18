const bodyParser = require('body-parser');
const express = require('express');
createHttpTaskWithToken = require('./create.js').createHttpTaskWithToken;

const app = express();
app.enable('trust proxy');

app.get('/', async (req, res) => {
  await createHttpTaskWithToken();
  res.send('Task created!').end();
});

const PORT = process.env.PORT || 4000;
app.listen(process.env.PORT || 4000, () => {
  console.log(`App listening on port ${PORT}`);
  console.log('Press Ctrl+C to quit.');
});
