FILE = ./srcs/docker-compose.yml
MARIA = ~/42/Inception/Inception/srcs/requirements/mariadb
NGINX = ./srcs/requirements/nginx
WORD = ./srcs/requirements/wordpress
PORT = 3306

build:
	@sudo docker-compose -f $(FILE) build  $(c)

build_no:
	@sudo docker-compose -f $(FILE) build --no-cache  $(c)

build_m:
	@sudo docker build -t mariadb $(MARIA)
d:
	@sudo docker-compose -f $(FILE) up -d --build  $(c)

down:
	@sudo docker-compose -f $(FILE) down $(c)

destroy:
	@sudo docker-compose -f $(FILE) down -v $(c)

up:
	@sudo docker-compose -f $(FILE) up  $(c)

inspect_n:
	@docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx  $(c)

inspect_w: 
	@docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wordpress $(c)

inspect_m:
	@docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb $(c)

run_n:
	@sudo docker-compose -f $(FILE) run --name nginx -p $(PORT):$(PORT) nginx

run_w:
	@sudo docker-compose -f $(FILE) run --name wordpress -p $(PORT):$(PORT) wordpress
run_m:
#	@sudo docker run -it mariadb /bin/bash
	@sudo docker-compose -f $(FILE) run --name mariadb -p $(PORT):$(PORT) mariadb

run_n-d:
	@sudo docker-compose -f $(FILE) run --name nginx -d -p $(PORT):$(PORT) nginx
run_w-d:
	@sudo docker-compose -f $(FILE) run --name wordpress -d -p $(PORT):$(PORT) wordpress
run_m-d:
	@sudo docker-compose -f $(FILE) run --name mariadb -d -p $(PORT):$(PORT) mariadb

exec_n:
	@sudo docker exec -it nginx bash
exec_w:
	@sudo docker exec -it wordpress bash
exec_m:
	@sudo docker exec -it mariadb bash

rm_n:
	@sudo docker rm nginx
rm_w:
	@sudo docker rm wordpress
rm_m:
	@sudo docker rm mariadb

stop_n:
	@sudo docker-compose -f $(FILE) stop nginx
stop_w:
	@sudo docker-compose -f $(FILE) stop wordpress
stop_m:
	@sudo docker-compose -f $(FILE) stop mariadb

clean:
	@sudo rm -rf /home/mj/data/mariadb/*
	@sudo make down
	@sudo docker system prune
	@sudo make destroy

.PHONY: build run run-it stop