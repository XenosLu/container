# xenocider/container:ubuntu-uam
FROM ubuntu:18.04
LABEL maintainer="xenos <xenos.lu@gmail.com>"

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN sudo apt-get update &&\
    sudo apt-get install -y python3 &&\
    sudo apt-get install -y ruby ruby-dev &&\
    sudo apt-get install -y g++ &&\
    sudo gem install cf-uaac &&\
    wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add - &&\
    echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list &&\
    sudo apt-get install -y cf-cli &&\
    sudo apt-get install -y python3-pip &&\
    sudo apt-get install -y git

COPY requirements.txt /
RUN sudo pip3 install -r /requirements.txt

CMD ["/bin/bash"]
