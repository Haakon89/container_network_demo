#!/usr/bin/env bash

lxc exec backend -- bash -lc '
apt-get update && apt-get install -y python3-pip
pip3 install flask
cat >/srv/app.py <<EOF
from flask import Flask, jsonify
import socket
app = Flask(__name__)
@app.get("/data")
def data():
    return jsonify({"service":"backend","message":"Hello from backend (back_net only)","hostname":socket.gethostname()})
app.run(host="0.0.0.0", port=5000)
EOF
nohup python3 /srv/app.py >/srv/backend.log 2>&1 &
'
