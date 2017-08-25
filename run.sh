#!/bin/bash

echo "installing" > /var/log/container_status

# setup webserver doc roots
DOCROOT=$(echo $WEBSERVER_DOCUMENT_ROOT | sed 's/[]\/$*.^|[]/\\&/g')
sed -i -- "s/##WEBSERVER_DOCUMENT_ROOT##/$DOCROOT/g" /etc/apache2/sites-available/000-default.conf

# Clean double slashes
sed -i -- 's/html\/\//html\//g' /etc/apache2/sites-available/000-default.conf

bash /tmp/init/init.sh 2>&1 >> /var/log/startup.log 

echo "complete" > /var/log/container_status

mkdir /var/log/supervisor /var/log/apache2

/usr/bin/supervisord
