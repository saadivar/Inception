FROM debian:12
RUN  apt update -y && apt upgrade -y
RUN  apt install mariadb-server -y
COPY script.sh /
CMD ["sh","/script.sh"]
