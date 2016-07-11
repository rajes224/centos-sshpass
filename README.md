## This is a centos 7 image with sshpass package installed.

Where it can be useful:
   use this container anywhere you need to ssh to remote host and run command through ssh in automation process where you dont want to enter password

## How to use:
  1. Pull docker image:
      docker pull rsalian/centos-sshpass
  2. run docker run command to execute some command in remote host, best way is pre-define environment variable PASSWORD instead of passing ssh password in commandline. In below command, password is passed as environment variable to container
      export PASSWORD='yourpassowrd'
      docker run -e PASSWD=$PASSWORD rsalian/centos-sshpass sshpass -p $PASSWD ssh -o StrictHostKeyChecking=no \
         -o UserKnownHostsFile=/dev/null -n root@your.host@domain.com ls -lrt /var/log/

