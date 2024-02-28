#!/bin/sh

mkdir -p /dev/net/
mknod /dev/net/tun c 10 200 
chmod 600 /dev/net/tun

openvpn --daemon --config /etc/openvpn/client/alpineVM.ovpn