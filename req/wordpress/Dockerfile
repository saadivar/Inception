FROM debian:12

RUN  apt update -y && apt upgrade -y
RUN  apt install php -y
RUN  apt install php-fpm -y
RUN  apt install php-mysqli -y
RUN apt install wget -y
RUN apt install unzip -y
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
RUN service php8.2-fpm start
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY wp-config.php /var/www/wordpress
COPY script.sh /
CMD ["sh", "/script.sh"]