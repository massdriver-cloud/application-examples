import logging
import pytesseract
from PIL import Image
import azure.functions as func
import os
# import requests

def main(req: func.HttpRequest) -> func.HttpResponse:

    logging.info('Python HTTP trigger function processed a request.')

    # # test code for OCR
    try:
        file = req.files.get('file')
        file.save('/tmp/1.jpg')
    except ValueError:
        pass

    text = ''
    if file:
        text = str(pytesseract.image_to_string(Image.open('/tmp/1.jpg')))

    return func.HttpResponse('text Extracted from Image: {}'.format(text))

# def download_image(url, file_name):
#     # Send GET request
#     response = requests.get(url)

#     # Save the image
#     if response.status_code == 200:
#         with open(file_name, "wb") as f:
#             f.write(response.content)
#     else:
#         print(response.status_code)