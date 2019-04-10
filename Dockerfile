FROM centos:7
MAINTAINER Lars Behrens "l.behrens@openinfrastructure.de"

RUN yum update -y
RUN yum install -y git epel-release
RUN yum update -y

RUN yum install -y python36 python36-pip vim tree tig ansible zsh

RUN ln -sf /usr/bin/python3.6 /usr/bin/python3
RUN ln -sf /usr/bin/pip3.6 /usr/bin/pip3

COPY requirements.txt ./

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

COPY root /root
RUN chmod 400 /root/.ssh/id_rsa

ENV PATH="/root/scripts:${PATH}"
ENTRYPOINT [""]
CMD ["/bin/bash"]
