
# Docker-Nginx
A lightweight configurable Nginx docker image using the `edge` alpine image as a base. Compiled to support only modern TLS versions (`1.2`, `1.3`), `http2` support and `brotli` compression by default.


```sh
docker pull xigen/nginx
docker run -it -p 80:80 -p 443:443 xigen/nginx
```

You now have an nginx container running on both port 80 and 443 but nothing have been configured yet. Try pointing your browser to http://localhost. You should automatically get redirected to https and required to accept the invalid certificate.

# Recommended usage
The recommended way to run this image is via docker-compose. You will need to have an understanding of that before continuing. Here's a basic example
of using this image to proxy requests to the fpm service. As part of the containers
entrypoint it will check connection to the container for an fpm service and inject the required config to get it working. This is configurable via the use of environment variables within the service definition. Ideally you would create an image for both nginx and the application.

```sh
version: '3.4'

services:
    fpm:
        image: xigen/php:fpm-73
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
docker inspect --format="{{json .State.Health}}" nginx
```
