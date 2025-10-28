from flask import Flask, jsonify
import os, requests

app = Flask(__name__)
BACKEND_URL = os.environ.get("BACKEND_URL", "http://backend:5000/data")

@app.get("/")
def root():
    # Fan out to the backend over the *back_net*
    try:
        r = requests.get(BACKEND_URL, timeout=2)
        r.raise_for_status()
        backend_json = r.json()
    except Exception as e:
        backend_json = {"error": str(e)}

    return jsonify({
        "service": "app",
        "message": "Hello from app (reachable via front_net)",
        "fetched_from_backend_over_back_net": backend_json
    })

@app.get("/health")
def health():
    return jsonify({"status": "ok"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
