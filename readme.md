# Nginx
Nginx docker image based off the office docker image. Compiled to support only modern TLS versions (`1.2`, `1.3`), `http2` support and `brotli` compression.

[![](https://images.microbadger.com/badges/image/xigen/nginx.svg)](https://microbadger.com/images/xigen/nginx:latest) [xigen/nginx](https://git.xigen.co.uk/docker/nginx/blob/master/Dockerfile)

```sh
docker pull xigen/nginx
```

# Usage
The recommended way to run this image is via docker-compose. Here is an example
of using this image to proxy requests to the fpm image. As part of the containers
entrypoint it will check connection to the fpm container and inject the required
config to get it working. You need to make sure the service has been defined with
a name of `fpm`. Ideally you would create an image for the fpm service.

```sh
version: '3.1'

services:
    fpm:
        image: xigen/php:fpm-7
    nginx:
        image: xigen/nginx
        depends_on:
            - fpm
        ports:
            - "80:80"
            - "443:443"
```

# Building
```sh
docker build --no-cache --pull --squash -t xigen/nginx .
```

# Testing
```sh
docker run --rm -t xigen/nginx nginx -t
docker-compose up
```
