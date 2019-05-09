## you-get 0.4.1295
FROM xenocider/container:python3.6.4
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN apk add --no-cache \
        aria2 \
        unrar \
        curl \
        ffmpeg &&\
    # && pip3 install you-get &&\
    apk add --no-cache git &&\
    git clone -b develop https://github.com/soimort/you-get.git &&\
    cd you-get &&\
    python3 /you-get/setup.py install &&\
    rm -rf /var/cache/apk/* /tmp/* /root/.cache

# download script
COPY d /usr/local/bin
RUN chmod +x  /usr/local/bin/d

CMD ["/bin/sh", "/usr/local/bin/d"]
