## you-get
FROM alpine:3.7

LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV TZ 'Asia/Shanghai'

RUN apk add tzdata --update-cache \
    && apk add python3 \
    && apk add gcc libc-dev python3-dev \
    && pip3 install pycrypto==2.6.1 \
    # && pip3 install pycryptodome==3.4.7 \
    && pip3 install you-get \
    && apk add ffmpeg \
    && apk add curl \
    && apk del gcc libc-dev python3-dev \
    && mkdir /run/nginx \
    && rm -f /etc/nginx/conf.d/default.conf \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# RUN apk add py3-bottle

# copy nginx config file
COPY xlmp.conf /etc/nginx/conf.d/


# VOL /xlmp/media

CMD ["/bin/sh"]
