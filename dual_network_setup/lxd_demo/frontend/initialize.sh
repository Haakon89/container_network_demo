#!/usr/bin/env bash

lxc launch images:debian/12 frontend
lxc network attach br-front frontend eth0
lxc config device set frontend eth0 ipv4.address 172.31.10.10