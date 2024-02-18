FROM alpine

RUN apk add openssl
RUN apk add openvpn
RUN apk add iptables
RUN apk add tcpdump
RUN apk add easy-rsa

WORKDIR /root

RUN ln -s /usr/share/easy-rsa /root/easy-rsa
RUN mkdir ovpn_clients

WORKDIR /root/ovpn_clients
COPY src/ca_server .
RUN mkdir keys
RUN mkdir files

WORKDIR /root

