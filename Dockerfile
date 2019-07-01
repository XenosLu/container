## bypy 1.6.6
FROM xenocider/container:python3.6.4
LABEL maintainer="xenos <xenos.lu@gmail.com>"


RUN apk add --no-cache --virtual .fetch-deps \
       gcc \
       libc-dev \
       python3-dev &&\
    pip3 install pycrypto==2.6.1 &&\
    pip3 install bypy &&\
    # pip3 install pycryptodome==3.4.7 &&\
    apk del .fetch-deps &&\
    # apk add --no-cache git &&\
    rm -rf /var/cache/apk/* /tmp/* /root/.cache


COPY bdsync.sh /
# RUN chmod +x  /bdsync.sh

CMD ["/bin/sh", "/bdsync.sh"]
