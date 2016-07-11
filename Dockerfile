FROM centos:7
MAINTAINER rajesh salian <rajesh.salian@nuance.com>

RUN yum install -y make
RUN yum install -y openssh-clients

RUN yum localinstall -y sshpass-1.05-1.el6.x86_64.rpm

RUN mkdir ~/.ssh/ && touch ~/.ssh/known_hosts
COPY entrypoint-sshpass.sh

#ENTRYPOINT [ "sshpass ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p $(PASSWD) -n root@$(HOST) " ]
#ENTRYPOINT [ 'exec' ]
ENTRYPOINT [ 'entrypoint-sshpass.sh' ]
#ENTRYPOINT [ '/usr/bin/sshpass' ]
