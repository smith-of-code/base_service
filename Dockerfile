FROM amd64/alpine

RUN apk update && apk upgrade
RUN apk add openrc
RUN apk add nginx
RUN apk add php81 php81-fpm php81-opcache
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/http.d/default.conf

COPY ./scripts /usr/share/nginx/html

CMD php-fpm81 -D ; nginx
EXPOSE 80