#!/usr/bin/env bash

lxc exec frontend -- bash -lc '
apt-get update && apt-get install -y nginx
cat >/etc/nginx/sites-available/default <<EOF
server {
  listen 80;
  location / {
    proxy_pass http://172.31.10.20:8080;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
  }
}
EOF
systemctl restart nginx
'
