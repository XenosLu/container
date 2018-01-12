## you-get 0.4.1011
FROM alpine:3.7
LABEL maintainer="xenos <xenos.lu@gmail.com>"

ENV PS1 '[\u@\h \W]\$'
ENV TZ 'Asia/Shanghai'

RUN apk add tzdata --update-cache \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apk add python3 \
    && apk add --no-cache --virtual .fetch-deps \
       gcc \
       libc-dev \
       python3-dev \
    && pip3 install pycrypto==2.6.1 \
    # && pip3 install pycryptodome==3.4.7 \
    && apk del .fetch-deps \
    && pip3 install you-get \
    && apk add ffmpeg \
    && apk add curl \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache

# download script
COPY d  /usr/local/bin
RUN chmod +x  /usr/local/bin/d

#hotfix
RUN curl -L https://github.com/XenosLu/you-get/raw/develop/src/you_get/extractors/netease.py > /usr/lib/python3.6/site-packages/you_get/extractors/netease.py

CMD ["/bin/sh"]
