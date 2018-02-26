# python 3.5.2 enviroment
FROM alpine:3.5
LABEL maintainer="xenos <xenos.lu@gmail.com>"

ENV PS1 '\h:\w\$ '
ENV TZ 'Asia/Shanghai'

RUN apk add --no-cache \
            tzdata \
            python3 \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -rf /var/cache/* /root/.cache

CMD ["/bin/sh"]
