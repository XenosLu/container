# xenocider/container:wireguard
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG="C.UTF-8"

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    add-apt-repository ppa:wireguard/wireguard -y &&\
    apt-get update &&\
    apt-get install wireguard-dkms wireguard-tools resolvconf -y

CMD ["/bin/bash"]
