# docker-workspace
FROM xenocider/image:python3.8.3
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN apk add --no-cache \
            docker-cli \
            # docker \
            curl \
            git \
            vim \
            tree \
            openssh-client \
            openssh-server\
            nethogs \
            tmux \
            rsync \
            &&\
    apk add --no-cache \
            python3-dev \
            libffi-dev \
            openssl-dev \
            gcc \
            libc-dev \
            make &&\
    apk add --no-cache \
            nodejs \
            yarn &&\
    rm -rf /root/.cache

RUN wget https://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz &&\
    tar -zxvf lrzsz-0.12.20.tar.gz &&\
    cd lrzsz-0.12.20 &&\
    ./configure &&\
    make &&\
    make install &&\ 
    ln -s /usr/local/bin/lrz /usr/bin/rz &&\
    ln -s /usr/local/bin/lsz /usr/bin/sz &&\
    rm -rf /lrzsz-0.12.20.tar.gz

RUN ssh-keygen -A && \
    echo "root:$RANDOM" | chpasswd &&\
    sed -i s/#\\?PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config &&\
    sed -i s/#\\?#PasswordAuthentication.*/PasswordAuthentication\ no/ /etc/ssh/sshd_config &&\
    sed -i s/X11Forwarding.*/X11Forwarding\ yes/ /etc/ssh/sshd_config &&\
    sed -i s/AllowTcpForwarding.*/AllowTcpForwarding\ yes/ /etc/ssh/sshd_config &&\
    sed -i s/#\\?X11UseLocalhost.*/X11UseLocalhost\ no/ /etc/ssh/sshd_config &&\
	echo StrictHostKeyChecking no>> /etc/ssh/ssh_config

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl &&\
    chmod +x ./kubectl &&\
    mv ./kubectl /usr/local/bin/kubectl

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ADD start /

CMD ["/bin/sh", "/start"]
