exports.handler =  async function(event, context) {
  console.log("EVENT: \n" + JSON.stringify(event, null, 2))
  console.log("CONTEXT: \n" + JSON.stringify(context, null, 2))

  let result = ""

  const query = parseInt(JSON.parse(event.body).query)
  console.log("QUERY: \n" + query)

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
