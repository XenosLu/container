# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG "C.UTF-8"

ENV TZ 'Asia/Shanghai'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends \
        x2goserver \
        xfce4 \
        gvfs \
        sshfs \
        x2goserver-fmbindings  \
        xubuntu-icon-theme \
        greybird-gtk-theme \
        xfce4-terminal \
        docker.io \
        vim \
        tmux

RUN apt-get install -y --no-install-recommends \
    rdesktop
RUN apt-get install -y --no-install-recommends \
    gedit
RUN apt-get install -y --no-install-recommends \
    fcitx fcitx-pinyin
RUN apt-get install -y --no-install-recommends \
    mpv
RUN apt-get install -y --no-install-recommends \
    epiphany-browser

#RUN apt-get install -y \
#        fcitx \
#        fcitx-pinyin &&\
#    apt-get clean


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


# RUN apt-get install -y desktop-file-utils
# gvfs

# apt-get update &&\
# apt-get install -y software-properties-common &&\
# add-apt-repository -y ppa:team-xbmc/ppa &&\
# apt-get install -y kodi \
#                    kodi-pvr-iptvsimple

# apt-get install -y software-properties-common &&\
# add-apt-repository -y ppa:mozillateam/ppa &&\
# apt-get install -y  firefox-esr

RUN mkdir /run/sshd &&\
    sed -i s/#\\?X11UseLocalhost.*/X11UseLocalhost\ no/ /etc/ssh/sshd_config &&\
    mkdir -p /var/run/dbus &&\
    sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

ADD start /

CMD ["/bin/sh", "/start"]
