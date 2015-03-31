#!/bin/bash

echo "complete" > /var/log/container_status

/usr/bin/supervisord
