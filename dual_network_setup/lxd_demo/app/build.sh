#!/usr/bin/env bash

lxc exec app -- bash -lc '
apt-get update && apt-get install -y python3-pip
pip3 install flask requests
cat >/app/app.py <<EOF
from flask import Flask, jsonify
import requests
BACKEND_URL="http://172.31.20.30:5000/data"
app = Flask(__name__)
@app.get("/")
def root():
    try:
        r = requests.get(BACKEND_URL, timeout=2).json()
    except Exception as e:
        r = {"error": str(e)}
    return jsonify({"service":"app","message":"Hello from app (front_net)","fetched_from_backend_over_back_net": r})
app.run(host="0.0.0.0", port=8080)
EOF
nohup python3 /app/app.py >/app/app.log 2>&1 &
'
