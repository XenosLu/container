#!/bin/sh
cd /etc/wireguard
sysctl -p

wg genkey | tee server_privatekey | wg pubkey > server_publickey
wg genkey | tee client_privatekey | wg pubkey > client_publickey

echo "
  [Interface]
    PrivateKey = $(cat server_privatekey)
    Address = 10.0.0.1/24
    PostUp   = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -D FORWARD -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
    ListenPort = 50814
    DNS = 8.8.8.8
    MTU = 1420

  [Peer]
    PublicKey = $(cat client_publickey)
    AllowedIPs = 10.0.0.2/32 " > wg0.conf
