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
RUN apt-get install iproute2 -y

RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

ADD init.sh /

RUN chmod +x /init.sh

WORKDIR /etc/wireguard

CMD ["/bin/bash"]
