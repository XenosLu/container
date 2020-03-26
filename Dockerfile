## xenocider/test:sshd
FROM alpine:3.7

RUN apk upgrade --update \
    && apk --update add openssh \
	&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
	&& sed -i s/#GatewayPorts.*/GatewayPorts\ yes/ /etc/ssh/sshd_config \
	&& echo StrictHostKeyChecking no>> /etc/ssh/ssh_config \
	&& echo "root:123456" | chpasswd \
	&& rm -rf /var/cache/apk/* /tmp/*

RUN ssh-keygen -A

COPY authorized_keys /root/.ssh/
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

COPY conn /bin
RUN chmod 755 /bin/conn

CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22
# ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa
