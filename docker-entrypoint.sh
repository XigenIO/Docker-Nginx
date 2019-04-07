#!/bin/sh

FPM_PORT=${FPM_PORT:-9000}
FPM_SERVICE=${FPM_SERVICE:-fpm}

echo "Staging xigen/nginx Docker container";


echo "#####################"
echo "# FPM CONFIGURATION #"
echo "#####################"
echo ""

echo "Checking for $FPM_SERVICE service"
timeout 2 nc -zv $FPM_SERVICE $FPM_PORT &> /dev/null

if [ "$?" -eq "0" ]; then
    echo "Connection successfull to connect to $FPM_SERVICE service"
    echo "Injecting fpm config"

     /etc/nginx/bin/inject-fpm-config >> /etc/nginx/conf/pre-vhost.conf
else
    echo "Unable to connect to $FPM_SERVICE service"
fi


echo ""
echo "Starting nginx..."

nginx -c /etc/nginx/nginx.conf -g "daemon off;"
