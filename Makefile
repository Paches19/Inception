# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adpachec <adpachec@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/31 13:09:36 by adpachec          #+#    #+#              #
#    Updated: 2023/11/06 12:42:44 by adpachec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_FILE = ./srcs/docker-compose.yml

all: run

# Construir todos los contenedores
build:
		@sudo mkdir -p /home/adpachec/data/wordpress
		@sudo mkdir -p /home/adpachec/data/mysql
		docker-compose -f $(DOCKER_FILE) build --no-cache

run: 
		@sudo mkdir -p /home/adpachec/data/wordpress
		@sudo mkdir -p /home/adpachec/data/mysql
		docker-compose -f $(COMPOSE_FILE) up --build
	
# Iniciar todos los contenedores en segundo plano
up:
		@sudo mkdir -p /home/adpachec/data/wordpress
		@sudo mkdir -p /home/adpachec/data/mysql
		docker-compose -f $(DOCKER_FILE) up -d --build

# Detener y eliminar todos los contenedores, redes y volúmenes
down:
		docker-compose -f $(DOCKER_FILE) down

# Detener todos los contenedores sin eliminarlos
stop:
		docker-compose -f  $(DOCKER_FILE) stop

# Restart the Docker Compose services
restart:
		docker compose -f $(DOCKER_FILE) restart

# Listar todos los contenedores en ejecución
ps:
		docker-compose -f $(DOCKER_FILE) ps

# Ver registros de todos los contenedores
logs:
		docker-compose -f $(DOCKER_FILE) logs

# Destroy the Docker Compose services
destroy:
		docker compose -f $(DOCKER_FILE) down --rmi all

# Clean up Docker
clean:
		docker compose -f $(DOCKER_FILE) down --rmi all
		docker volume rm mariadb wordpress
		docker system prune -p
		@sudo rm -rf /home/adpachec/data/wordpress
		@sudo rm -rf /home/adpachec/data/mysql

.PHONY: all up down build start destroy stop restart clean ps logs