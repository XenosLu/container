## jupyter lab
FROM xenocider/container:python3.7.3
LABEL maintainer="xenos <xenos.lu@gmail.com>"
    
RUN apk add --no-cache --virtual .fetch-deps \
        python3-dev \
        libc-dev \
        libffi-dev  \
        g++ &&\
    pip3 install jupyterlab &&\
    apk del .fetch-deps &&\
    rm -rf /var/cache/* /root/.cache

EXPOSE 8888

CMD ["/usr/bin/jupyter", "lab", "--ip=0.0.0.0" "--allow-root"]
