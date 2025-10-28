from flask import Flask, jsonify
import socket

app = Flask(__name__)

@app.get("/data")
def data():
    return jsonify({
        "service": "backend",
        "message": "Hello from backend (only on back_net)",
        "hostname": socket.gethostname()
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
