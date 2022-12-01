import logging
import pytesseract
from PIL import Image
import azure.functions as func
import os
def main(req: func.HttpRequest) -> func.HttpResponse:

    logging.info('Python HTTP trigger function processed a request.')

    # test code for OCR
    try:
        file = req.files.get('file')
        file.save('/tmp/1.jpg')
    except ValueError:
        pass

    text = ''
    if file:
        text = str(pytesseract.image_to_string(Image.open('/tmp/1.jpg')))

    return func.HttpResponse('text Extracted from Image: {}'.format(text))