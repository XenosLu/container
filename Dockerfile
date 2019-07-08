# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apt-get update &&\
    apt-get install -y python3 &&\
    apt-get install -y ruby ruby-dev &&\
    apt-get install -y g++ &&\
    gem install cf-uaac &&\
    wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - &&\
    echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list &&\
    apt-get install -y cf-cli &&\
    apt-get install -y python3-pip &&\
    apt-get install -y git

COPY requirements.txt /
RUN pip3 install -r /requirements.txt

CMD ["/bin/bash"]
