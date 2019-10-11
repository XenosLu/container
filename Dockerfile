# xenocider/container:wireguard
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG="C.UTF-8"

RUN sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    apt-get update &&\
    apt-get install software-properties-common -y &&\
    add-apt-repository ppa:wireguard/wireguard -y &&\
    apt-get update &&\
    apt-get install wireguard-dkms wireguard-tools -y
    
# RUN apt-get install resolvconf -y
RUN apt-get install net-tools -y
RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
# sysctl -p
WORKDIR /etc/wireguard
RUN wg genkey | tee server_privatekey | wg pubkey > server_publickey &&\
    wg genkey | tee client_privatekey | wg pubkey > client_publickey
RUN echo "
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

CMD ["/bin/bash"]
