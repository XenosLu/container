# meinheld
FROM alpine:3.5
LABEL maintainer="xenos <xenos.lu@gmail.com>"

ENV PS1 '[\u@\h \W]\$'
ENV TZ 'Asia/Shanghai'

RUN apk add --no-cache tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apk add --no-cache python3 \
    && apk add --no-cache --virtual .fetch-deps \
       gcc \
       libc-dev \
       python3-dev \
    && pip3 install meinheld==0.6.1 \
    && apk del .fetch-deps \
    && rm -rf /var/cache/*
    # && rm -rf /var/cache/apk/* /tmp/* /root/.cache
        
CMD ["/bin/sh"]
