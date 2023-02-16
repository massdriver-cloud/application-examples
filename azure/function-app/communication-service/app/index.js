import { EmailClient } from "@azure/communication-email";
import { DefaultAzureCredential } from "@azure/identity";
import express from "express";

// environment variables
const port = process.env.PORT || 80;
const endpoint = process.env.ENDPOINT;

// set up the expressJS server, apply middleware
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const credential = new DefaultAzureCredential();
const client = new EmailClient(endpoint, credential);

// https://learn.microsoft.com/en-us/javascript/api/overview/azure/communication-email-readme?view=azure-node-preview
async function main(request) {
  const {
    // string
    senderEmail,
    // array of objects: [{ email: "test@gmail.com", displayName: "Sr Test" }]
    recipients,
    // string
    subject,
    // string
    emailPlainText,
    // string
    emailHTML,
  } = request.body;

  const recipientObjects = [];
  recipients.forEach((recipient) => {
    recipientObjects.push(
      { email: recipient.email, displayName: recipient.displayName },
    );
  });

  const emailMessage = {
    sender: senderEmail,
    content: {
      subject,
      plainText: emailPlainText,
      html: emailHTML,
    },
    recipients: {
      to: recipientObjects,
    },
  };

  const messageId = await client.send(emailMessage);
  return messageId;
}

// POST so we can send large json bodies
app.post('/', (request, res) => {
  main(request)
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
})

app.get('/health', (request, res) => {
  res.send('200: OK');
})

app.listen(port, () => {
  console.log(`Application listening on port ${port}`);
})

// POST w/ application/json header
// {
//   "subject": "Hello world",
//   "senderEmail": "sender@gmail.com",
//   "recipients": [{
//       "email": "me@me.com",
//       "displayName": "Me Me"
//   }],
//   "emailPlainText": "Hello world, please respond if you're reading this."
// }
