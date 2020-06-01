# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"
ENV LANG="C.UTF-8"

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    apt-get update &&\
    apt-get install -y openssh-server\
                       firefox \
                       xauth &&\
RUN ssh-keygen -A && \
    echo "root:$RANDOM" | chpasswd &&\
    sed -i s/#\\?PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config &&\
    sed -i s/X11Forwarding.*/X11Forwarding\ yes/ /etc/ssh/sshd_config &&\
    sed -i s/AllowTcpForwarding.*/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config &&\
    sed -i s/#\\?X11UseLocalhost.*/X11UseLocalhost\ no/ /etc/ssh/sshd_config &&\
	echo StrictHostKeyChecking no>> /etc/ssh/ssh_config

# RUN apt-get install -y -q --no-install-recommends ubuntu-desktop

RUN sed -i "s/^\(deb.*http:\/\/\).*\(\/ubuntu\)/\1mirrors.163.com\2/g" /etc/apt/sources.list

CMD ["/usr/sbin/sshd", "-D"]
