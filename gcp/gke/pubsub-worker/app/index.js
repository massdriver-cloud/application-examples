// sample-metadata:
//   title: Listen For Messages
//   description: Listens for messages from a subscription.
//   usage: node listenForMessages.js <subscription-name-or-id> [timeout-in-seconds]

function main(
  timeout = 600
) {
  timeout = Number(timeout);
  const {PubSub} = require('@google-cloud/pubsub');
  const pubSubClient = new PubSub();

  function listenForMessages() {
    const subscription = pubSubClient.subscription(process.env.SUBSCRIPTION_ID);
    let messageCount = 0;
    const messageHandler = message => {
      console.log(`Received message ${message.id}:`);
      console.log(`\tData: ${message.data}`);
      console.log(`\tAttributes: ${message.attributes}`);
      messageCount += 1;
      message.ack();
    };

    // Listen for new messages until timeout is hit
    subscription.on('message', messageHandler);

    setTimeout(() => {
      subscription.removeListener('message', messageHandler);
      console.log(`${messageCount} message(s) received.`);
    }, timeout * 1000);
  }

  listenForMessages();
}

main(...process.argv.slice(2));
