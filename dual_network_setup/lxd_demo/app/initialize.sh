#!/usr/bin/env bash

lxc launch images:debian/12 app
lxc network attach br-front app eth0
lxc config device set app eth0 ipv4.address 172.31.10.20
lxc network attach br-back app eth1
lxc config device set app eth1 ipv4.address 172.31.20.20