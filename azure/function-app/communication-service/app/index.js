import { EmailClient } from "@azure/communication-email";
import { DefaultAzureCredential } from "@azure/identity";
import express from "express";

const app = express();
const port = process.env.PORT || 4000;

const credential = new DefaultAzureCredential();
// console.log(process.env)
const endpoint = process.env.ENDPOINT;
const client = new EmailClient(endpoint, credential);
const sender = process.env.SENDER_EMAIL;

const emailContent = {
  subject: "The Tragedy of Darth Plagueis the Wise",
  plainText: "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.",
  html: "<html><head><title>ACS Email as a Service</title></head><body><h1>ACS Email as a Service - Html body</h1><h2>This email is part of testing of email communication service</h2></body></html>",
};
const toRecipients = {
  to: [
    { email: process.env.RECIPIENT_EMAIL, displayName: process.env.RECIPIENT_NAME },
  ],
};

// https://learn.microsoft.com/en-us/javascript/api/overview/azure/communication-email-readme?view=azure-node-preview
async function main() {
  const emailMessage = {
    sender: sender,
    content: emailContent,
    recipients: toRecipients,
  };

  const messageId = await client.send(emailMessage);
  return messageId;
}

app.get('/', (req, res) => {
  main()
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
})

app.get('/health', (req, res) => {
  res.send('200: OK');
})

app.listen(port, () => {
  console.log(`Application listening on port ${port}`);
})
