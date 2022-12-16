import pytesseract
import logging
from PIL import Image
from io import BytesIO
import azure.functions as func
import requests

# this function can be triggered using 'curl <function-url>?image_url=<image-url>'
def main(req: func.HttpRequest) -> func.HttpResponse:

    logging.info('Python HTTP trigger function processed a request.')

    # get the image URL from the request
    image_url = req.params.get('image_url')
    
    # download the image from the URL
    response = requests.get(image_url)
    img_bytes = BytesIO(response.content)
    
    # use Pytesseract to extract the text from the image
    text = pytesseract.image_to_string(Image.open(img_bytes))

    # return the text as an HTTP response
    return func.HttpResponse('text Extracted from Image: {}'.format(text))