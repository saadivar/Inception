all:
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

status:
	docker ps
clear:
	sudo rm -rf /home/sel-biyy/data/*
	mkdir /home/sel-biyy/data/wordpress
	mkdir /home/sel-biyy/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml down -v
	docker-compose -f ./srcs/docker-compose.yml down --rmi all