exports.handler = async function (event, context) {
  let result = "";

  console.log(event.body);

  try {
    // Ensure event.body exists and is valid JSON
    const body = event.body ? JSON.parse(event.body) : null;

    // Check if 'query' exists and is a valid number
    if (body && typeof body.query === 'number') {
      const query = parseInt(body.query);

      if (query % 3 === 0) {
        result += "Fizz";
      }

      if (query % 5 === 0) {
        result += "Buzz";
      }

      if (result.length === 0) {
        result = "Nothing to report";
      }
    } else {
      throw new Error("Invalid input: 'query' must be a number");
    }
  } catch (error) {
    console.error("Error parsing request or processing: ", error);

    // Return a 400 error if there's an issue with the input or processing
    return {
      statusCode: 400,
      headers: {
        "Content-Type": "application/json",
      },
      isBase64Encoded: false,
      body: JSON.stringify({ error: error.message }),
    };
  }

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
    },
    isBase64Encoded: false,
    body: JSON.stringify({ result }),
  };
};
