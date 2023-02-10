const { DefaultAzureCredential } = require("@azure/identity");
const { EmailClient } = require("@azure/communication-email");

const express = require("express");
const app = express();
const port = process.env.PORT || 4000;
const credential = new DefaultAzureCredential();
console.log(process.env)
const endpoint = process.env.ENDPOINT;
const client = new EmailClient(endpoint, credential);
const sender = process.env.SENDER_EMAIL;

const emailContent = {
  subject: "The Tragedy of Darth Plagueis the Wise",
  plainText: "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It’s not a story the Jedi would tell you. It’s a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.",
  html: "<html><head><title>ACS Email as a Service</title></head><body><h1>ACS Email as a Service - Html body</h1><h2>This email is part of testing of email communication service</h2></body></html>",
};
const toRecipients = {
  to: [
    { email: process.env.RECIPIENT_EMAIL, displayName: process.env.RECIPIENT_NAME },
  ],
};

async function main() {
  try {
    const emailMessage = {
      sender: sender,
      content: emailContent,
      recipients: toRecipients,
    };

    const sendResult = await client.send(emailMessage);

    if (sendResult && sendResult.messageId) {
      // check mail status, wait for 5 seconds, check for 60 seconds.
      const messageId = sendResult.messageId;
      if (messageId === null) {
        console.log("Message Id not found.");
        return;
      }

      console.log("Send email success, MessageId :", messageId);

      let counter = 0;
      const statusInterval = setInterval(async function () {
        counter++;
        try {
          const response = await client.getSendStatus(messageId);
          if (response) {
            console.log(`Email status for {${messageId}} : [${response.status}]`);
            if (response.status.toLowerCase() !== "queued" || counter > 12) {
              clearInterval(statusInterval);
            }
          }
        } catch (e) {
          console.log("Error in checking send mail status: ",e);
        }
      }, 5000);
    } else {
      console.error("Something went wrong when trying to send this email: ", sendResult);
    }
  } catch (e) {
    console.log("################### Exception occurred while sending email #####################", e);
  }
}

app.get('/', (req, res) => {
  main()
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
})