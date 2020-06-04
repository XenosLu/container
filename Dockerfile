# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG "C.UTF-8"

ENV TZ 'Asia/Shanghai'

ENV DEBIAN_FRONTEND 'noninteractive'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    apt-get update &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository -y ppa:mozillateam/ppa &&\
    apt-get install -y openssh-server \
                       docker.io \
                       vim \
                       x2goserver \
                       xfce4 \
                       xfce4-terminal \
                       firefox-esr \
                       gedit &&\
    apt-get clean

RUN apt-get install -y fonts-arphic-ukai \
                       fonts-arphic-uming \
                       fonts-croscore \
                       fonts-droid-fallback \
                       fonts-kacst \
                       fonts-kacst-one \
                       fonts-noto \
                       fonts-noto-cjk \
                       fonts-noto-color-emoji \
                       fonts-noto-hinted \
                       fonts-noto-mono \
                       fonts-noto-unhinted \
                       fonts-open-sans \
                       fonts-opendyslexic \
                       fonts-roboto \
                       fonts-roboto-hinted \
                       fonts-sil-mondulkiri \
                       fonts-sil-padauk \
                       fonts-ubuntu &&\
    apt-get clean

# RUN apt-get install -y language-pack-zh-hans

RUN apt-get install -y clementine
RUN apt-get install -y mpv
# RUN apt-get install -y wine-stable

# dpkg --add-architecture i386 && apt-get update && apt-get install wine32

RUN mkdir /run/sshd &&\
    sed -i s/#\\?X11UseLocalhost.*/X11UseLocalhost\ no/ /etc/ssh/sshd_config &&\
    sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

ADD start /

CMD ["/bin/sh", "/start"]
