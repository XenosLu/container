# xenocider/container:wireguard
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG="C.UTF-8"

RUN sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    apt-get update &&\
    apt-get install python-software-properties -y &&\
    apt-get install software-properties-common -y &&\
    add-apt-repository ppa:wireguard/wireguard -y &&\
    apt-get update &&\
    apt-get install wireguard-dkms wireguard-tools resolvconf -y


CMD ["/bin/bash"]
