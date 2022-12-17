const subscription = pubsubClient.subscription(subscriptionName);

let messageCount = 0;

const messageHandler = message => {
  console.log(`message received ${message.id}`);
  console.log(`Data: ${message.data}`);
  messageCount += 1;

  message.ack();
};

subscription.on(`message`, messageHandler);
setTimeout(() => {
  subscription.removeListener('message', messageHandler);
  console.log(`${messageCount} message(s) received`);
}, timeout * 1000);
