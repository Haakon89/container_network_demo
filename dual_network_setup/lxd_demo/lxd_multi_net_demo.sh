#!/usr/bin/env bash

lxc network create br-front ipv4.address=172.31.10.1/24 ipv4.nat=true ipv6.address=none
lxc network create br-back  ipv4.address=172.31.20.1/24 ipv4.nat=true ipv6.address=none

./frontend/initialize.sh
./backend/initialize.sh
./app/initialize.sh

./backend/build.sh
./app/build.sh
./frontend/build.sh