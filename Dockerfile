# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG="C.UTF-8"

ENV TZ 'Asia/Shanghai'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    apt-get update &&\
    apt-get install -y openssh-server\
                       firefox
                       
RUN apt-get install -y docker.io
                       
RUN mkdir /run/sshd &&\
    sed -i s/#\\?X11UseLocalhost.*/X11UseLocalhost\ no/ /etc/ssh/sshd_config

# RUN apt-get install -y lightdm
# RUN apt-get install -y -q --no-install-recommends ubuntu-desktop


RUN sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

CMD ["/usr/sbin/sshd", "-D"]
