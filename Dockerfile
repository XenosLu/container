# python 3.6.5 centos 6.9
FROM centos:6.9
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y wget &&\
    yum install -y gcc &&\
    yum install -y zlib-devel &&\
    yum install -y openssl-devel &&\
    wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz &&\
    tar zxvf Python-3.6.5.tgz &&\
    cd Python-3.6.5 &&\
    ./configure &&\
    make &&\
    make install &&\
    cd .. &&\
    rm -rf Python-3.6.5*

CMD ["/bin/bash"]
