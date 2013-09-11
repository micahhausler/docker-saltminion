#!/bin/bash

if [ ! $# -eq 3 ]; then
    echo "Need 3 args!"
    echo "should be docker run -d micahhausler/saltminion MASTER ID DOMAIN"
    exit 1
fi

MASTER="$1"
ID="$2"
DOMAIN="$3"

echo -e "master: $MASTER\nid: $ID\nappend_domain: $DOMAIN" > /etc/salt/minion.d/docker.conf

/usr/bin/salt-minion
