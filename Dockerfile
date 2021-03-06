FROM centos:7
MAINTAINER rajesh salian <rajesh.salian@nuance.com>

RUN yum install -y make
RUN yum install -y openssh-clients
COPY sshpass-1.05-1.el6.x86_64.rpm /.
RUN rpm -Uvh /sshpass-1.05-1.el6.x86_64.rpm
#RUN yum localinstall -y sshpass-1.05-1.el6.x86_64.rpm

RUN mkdir ~/.ssh/ && touch ~/.ssh/known_hosts
COPY entrypoint-sshpass.sh /

#ENTRYPOINT [ "/usr/bin/sshpass -p $(PASSWD) ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -n root@$(HOST) " ]
#ENTRYPOINT [ 'exec' ]
#ENTRYPOINT [ '/entrypoint-sshpass.sh' ]
#ENTRYPOINT [ '/usr/bin/sshpass' ]
