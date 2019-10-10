## jupyter lab
FROM xenocider/container:python3.7.3
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN  pip3 install jupyterlab &&\
    rm -rf /tmp/* /root/.cache

EXPOSE 8888

CMD ["jupyter", "lab"]
