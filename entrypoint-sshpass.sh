#!/bin/bash
set -e

#export PATH=$PATH:/usr/bin

if [ "$1" = 'sshpass' ]; then
    exec /usr/bin/sshpass -p $PASSWD ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -n "$@"
fi

exec "$@"

