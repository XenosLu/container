# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG "C.UTF-8"

ENV TZ 'Asia/Shanghai'

# ENV DEBIAN_FRONTEND 'noninteractive'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends \
        x2goserver \
        xfce4 &&\
    apt-get install -y \
        sshfs \
        x2goserver-fmbindings \
        xubuntu-icon-theme \
        greybird-gtk-theme \
        xfce4-terminal &&\
    apt-get install -y \
        openssh-server \
        docker.io \
        vim \
        rdesktop \
        fcitx \
        fcitx-pinyin \
        gedit &&\
    apt-get clean

RUN apt-get install -y mpv
RUN apt-get install -y epiphany-browser

RUN  apt-get install -y \
        fonts-arphic-ukai \
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
        fonts-ubuntu


# RUN apt-get install -y  sshfs
# desktop-file-utils \
    # gvfs \
    # udisks2

# RUN apt-get update &&\
#     apt-get install -y software-properties-common &&\
#     add-apt-repository -y ppa:team-xbmc/ppa &&\
#     apt-get install -y kodi \
#                        kodi-pvr-iptvsimple

# apt-get install -y software-properties-common &&\
# add-apt-repository -y ppa:mozillateam/ppa &&\
# apt-get install -y  firefox-esr

RUN mkdir /run/sshd &&\
    sed -i s/#\\?X11UseLocalhost.*/X11UseLocalhost\ no/ /etc/ssh/sshd_config &&\
    mkdir -p /var/run/dbus &&\
    sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

ADD start /

CMD ["/bin/sh", "/start"]
