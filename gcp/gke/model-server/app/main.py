import os
import uuid
import threading

from diffusers import StableDiffusionPipeline
from flask import Flask, request, send_file, jsonify
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app, origins=["http://localhost:5000", "https://stable.gcp-gcp-gcp.com"])
app.config['CORS_HEADERS'] = 'Content-Type'
sem = threading.Semaphore()

@app.route("/health")
@cross_origin()
def health_check():
    return jsonify({ "healthy":true })

@app.route("/", methods=['POST', 'PUT'])
@cross_origin(methods=['POST', 'PUT'])
def infer():
    body = request.json
    phrase = body.get("phrase", "a unicorn riding a bicycle")
    model  = body.get("model", "runwayml/stable-diffusion-v1-5")
    steps = int(body.get("steps", 50))
    if steps > 500:
        return jsonify({"error": "Steps must be less than 500"})
    guidance_scale  = float(body.get("guidance_scale", 8.5))
    sem.acquire()
    print(f"phrase: {phrase}\nmodel: {model}\nsteps: {steps}\nguidance_scale: {guidance_scale}")
    pipe = StableDiffusionPipeline.from_pretrained(
      model,
      use_auth_token=os.getenv('HUGGINGFACE_TOKEN')
    ).to("cuda")
    result = pipe(phrase, num_inference_steps=steps)
    sem.release()
    image = result.images[0]
    unique_id = str(uuid.uuid4())
    img_path = f"/root/.cache/test-{unique_id}.png"
    url_path = f"https://storage.googleapis.com/md-ml-public/test-{unique_id}.png"
    image.save(img_path)
    data = {
        "img": url_path
    }
    return jsonify(data)

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
