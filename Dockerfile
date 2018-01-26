## you-get 0.4.1011
FROM alpine:3.7
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
    && pip3 install pycrypto==2.6.1 \
    # && pip3 install pycryptodome==3.4.7 \
    && apk del .fetch-deps \
    # && pip3 install you-get \
    && apk add --no-cache git \
    && git clone -b develop https://github.com/soimort/you-get.git \
    # && python3 /you-get setup.py install \
    && apk add --no-cache ffmpeg \
    && apk add --no-cache curl \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache

# 
    
# download script
COPY d  /usr/local/bin
RUN chmod +x  /usr/local/bin/d

#hotfix
RUN curl -L https://github.com/XenosLu/you-get/raw/develop/src/you_get/extractors/netease.py > /usr/lib/python3.6/site-packages/you_get/extractors/netease.py

CMD ["/bin/sh"]
