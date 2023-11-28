FROM debian:12

RUN  apt update -y && apt upgrade -y
RUN  apt install mariadb-server -y
COPY 50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh /

CMD ["sh","/script.sh"]
