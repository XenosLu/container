# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG="C.UTF-8"
COPY requirements.txt /

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    apt-get update &&\
    apt-get install -y openssh-server\
                       python3-pip \
                       wget \
    echo StrictHostKeyChecking no>> /etc/ssh/ssh_config

CMD ["/bin/bash"]
