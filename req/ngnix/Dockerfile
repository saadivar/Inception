FROM debian:12

RUN  apt update -y && apt upgrade -y 
RUN apt install nginx -y && apt install openssl -y
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/saad.crt -keyout /etc/nginx/ssl/saad.key -subj "/C=MA/ST=hhhh/L=benguerir/O=42/OU=42/CN=sel-biyy.42.fr/UID=sel-biyy"

COPY ./conf/default /etc/nginx/sites-enabled/default
EXPOSE 443
ENTRYPOINT ["nginx","-g","daemon off;"]