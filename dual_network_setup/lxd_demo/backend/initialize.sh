#!/usr/bin/env bash

lxc launch images:debian/12 backend
lxc network attach br-back backend eth0
lxc config device set backend eth0 ipv4.address 172.31.20.30
