# Nginx

Nginx docker image based off the office docker image. Compiled to support only modern TLS versions (`1.2`, `1.3`), `http2` support and `brotli` compression.

[![](https://images.microbadger.com/badges/image/xigen/nginx:latest.svg)](https://microbadger.com/images/xigen/nginx:latest) [xigen/php:fpm-7](https://git.xigen.co.uk/docker/nginx/blob/master/Dockerfile)


# Building
```sh
docker build --no-cache --pull --squash -t xigen/nginx .
```

# Testing
```sh
docker run --rm -t xigen/nginx nginx -t
```

# Usage

```sh
version: '3.1'

services:
    fpm:
        image: xigen/php:fpm-7
    nginx:
        image: xigen/nginx
        ports:
            - "443"
```
