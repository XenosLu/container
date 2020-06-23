# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG "C.UTF-8"

ENV TZ 'Asia/Shanghai'

ENV DEBIAN_FRONTEND 'noninteractive'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    apt-get update &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository -y ppa:team-xbmc/ppa &&\
    apt-get install -y kodi kodi-pvr-iptvsimple &&\
    apt-get install -y --no-install-recommends xorg &&\
    apt-get install -y xserver-xorg-video-fbdev &&\
    apt-get install -y xserver-xorg-video-vesa &&\
    apt-get clean

RUN apt-get install -y tigervnc-scraping-server &&\
    apt-get install -y novnc &&\
    apt-get clean

RUN mkdir -p /var/run/dbus &&\
    sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

ADD xorg.conf /etc/X11/
ADD start /

CMD ["/bin/sh", "/start"]
