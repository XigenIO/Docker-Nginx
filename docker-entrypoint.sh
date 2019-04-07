#!/bin/sh



echo "Staging xigen/nginx Docker container";

echo "Checking for fpm container"
timeout 2 nc -zv fpm 9000 &> /dev/null

if [ "$?" -eq "0" ]; then
    echo "Connection successfull to connect to fpm container"
    echo "Injecting fpm config"

    cat /etc/nginx/conf/fpm.conf >> /etc/nginx/conf/pre-vhost.conf
else
    echo "Unable to connect to fpm container"
fi

nginx -c /etc/nginx/nginx.conf -g "daemon off;"
