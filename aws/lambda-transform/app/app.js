exports.handler =  function(event, context) {
  var AWS = require('aws-sdk');
  console.log("EVENT: ", JSON.stringify(event))
  message = event["Records"][0]["body"]
  result = parseInt(message) + parseInt(process.env.ADDEND)

  console.log("The result: ", result)
  var params = {
    Message: result.toString(),
    TopicArn: process.env.SNS_TOPIC_ARN
  };

  sns = new AWS.SNS()

  console.log("Publishing sns message")

  sns.publish(params,
    function(err, data) {
      if(err) {
        console.error('error publishing to sns')
        context.fail(err)
      } else {
        console.info('message published to sns')
        context.succeed(null, data)
      }
    }
  )

  return result
}
