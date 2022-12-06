// Imports the Google Cloud Tasks library.
const {CloudTasksClient} = require('@google-cloud/tasks');

// Instantiates a client.
const client = new CloudTasksClient();

async function createHttpTaskWithToken() {
  const project = 'md-demos';
  const queue = process.env.TASK_QUEUE || 'my-queue';
  const location = 'us-west2';
  const url = 'https://example.com/taskhandler';
  const serviceAccountEmail = 'client@md-demos.iam.gserviceaccount.com';
  const payload = 'Hello, World!';

  // Construct the fully qualified queue name.
  const parent = client.queuePath(project, location, queue);

  const task = {
    httpRequest: {
      headers: {
        'Content-Type': 'text/plain',
      },
      httpMethod: 'POST',
      url,
      oidcToken: {
        serviceAccountEmail,
      },
    },
  };

  if (payload) {
    task.httpRequest.body = Buffer.from(payload).toString('base64');
  }

  console.log('Sending task:');
  console.log(task);
  // Send create task request.
  const request = {parent: parent, task: task};
  const [response] = await client.createTask(request);
  const name = response.name;
  console.log(`Created task ${name}`);
}
createHttpTaskWithToken();
