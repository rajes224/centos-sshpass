FROM centos:7
MAINTAINER rajesh salian <rajesh.salian@nuance.com>

RUN yum install -y make
RUN yum install -y openssh-clients

RUN yum install -y sshpass
RUN mkdir ~/.ssh/ && touch ~/.ssh/known_hosts

ENTRYPOINT [ "sshpass ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p $(PASSWD) -n root@$(HOST) " ]
#ENTRYPOINT [ 'exec' ]
#ENTRYPOINT [ '/usr/bin/sshpass' ]
