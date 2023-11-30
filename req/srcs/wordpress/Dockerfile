FROM debian:12

RUN  apt update -y && apt upgrade -y
RUN  apt install php-fpm -y
RUN  apt install php-mysqli -y
RUN apt install wget -y

# COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY script.sh /
CMD ["sh", "/script.sh"]