# python 3.6.3 environment new
FROM alpine:3.8
LABEL maintainer="xenos <xenos.lu@gmail.com>"

ENV PS1 '\h:\w\$ '
ENV TZ 'Asia/Shanghai'

RUN apk add --no-cache \
            tzdata \
            python3 &&\
    pip3 install --upgrade pip==10.0.1 &&\
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    rm -rf /var/cache/* /root/.cache

CMD ["/bin/sh"]
