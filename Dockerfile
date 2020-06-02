# xenocider/container:ubuntu-uam
FROM elementary/docker:juno-stable

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

RUN apt-get install -y x2goserver

RUN apt-get install -y xfce4
# RUN apt-get install -y language-pack-zh-hans
# RUN apt-get install -y language-pack-gnome-zh-hans

RUN apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-croscore fonts-droid-fallback  fonts-kacst fonts-kacst-one fonts-noto fonts-noto-cjk fonts-noto-color-emoji   fonts-noto-hinted fonts-noto-mono fonts-noto-unhinted fonts-open-sans fonts-opendyslexic fonts-roboto fonts-roboto-hinted fonts-sil-mondulkiri fonts-sil-padauk fonts-ubuntu

RUN sed -i s/mesg/tty\ -s\ \\\&\\\&\ mesg/ /root/.profile

ADD start /

RUN sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

CMD ["/bin/sh", "/start"]
