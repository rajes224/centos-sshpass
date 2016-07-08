FROM centos:7
MAINTAINER rajesh.salian@nuance.com

RUN yum install -y make
RUN yum install -y openssh-clients

RUN yum localinstall -y ./hera-installer/sshpass-1.05-1.el6.x86_64.rpm
RUN mkdir ~/.ssh/ && touch ~/.ssh/known_hosts

ENTRYPOINT [ "echo $(PASSWD) | /bin/sshpass ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -n root@$(HOST) " ]

