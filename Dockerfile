# python 3.7.4 environment
FROM alpine:3.10
LABEL maintainer="xenos <xenos.lu@gmail.com>"

ENV PS1 '\h:\w\$ '
ENV TZ 'Asia/Shanghai'

RUN apk add --no-cache \
            tzdata \
            python3 &&\
    pip3 install --upgrade pip==19.2.3 &&\
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    rm -rf /root/.cache

CMD ["/bin/sh"]
