# xenocider/container:python3.6.5-centos6.9
FROM centos:6.9
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y wget &&\
    yum install -y gcc &&\
    yum install -y zlib-devel &&\
    yum install -y openssl-devel &&\
    yum install -y openldap-devel &&\
    yum install -y readline-devel
RUN wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz &&\
    tar zxvf Python-3.7.3.tgz &&\
    cd Python-3.7.3 &&\
    ./configure &&\
    make &&\
    make install &&\
    cd .. &&\
    rm -rf Python-3.7.3*

COPY requirements.txt /
RUN pip3 install -r /requirements.txt

CMD ["/bin/bash"]
