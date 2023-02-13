exports.handler =  async function(event, context) {
  let result = ""

  const query = parseInt(JSON.parse(event.body).query)

  if (query % 3 == 0) {
    result += "Fizz"
  }

  if (query % 5 == 0) {
    result += "Buzz"
  }

  if(result.length == 0) {
    result = "Nothing to report"
  }

  return {
    "statusCode": 200,
    "headers": {
        "Content-Type": "application/json"
    },
    "isBase64Encoded": false,
    "body": JSON.stringify({"result": result})
  }
}