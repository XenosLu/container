# python 3.7.7 environment
FROM alpine:3.12
LABEL maintainer="xenos <xenos.lu@gmail.com>"

ENV PS1 '\h:\w\$ '
ENV TZ 'Asia/Shanghai'

RUN apk add --no-cache \
            tzdata \
            python3 \
            py3-pip &&\
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    
    pip3 install --upgrade pip==20.1.1 &&\
    rm -rf /root/.cache

CMD ["/bin/sh"]
