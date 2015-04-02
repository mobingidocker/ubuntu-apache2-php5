#!/bin/bash

echo "installing" > /var/log/container_status

bash /tmp/init/init.sh

echo "complete" > /var/log/container_status

/usr/bin/supervisord
