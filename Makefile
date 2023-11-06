# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adpachec <adpachec@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/31 13:09:36 by adpachec          #+#    #+#              #
#    Updated: 2023/11/06 12:25:01 by adpachec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

# Construir todos los contenedores
build:
		@sudo mkdir -p /home/adpachec/data/wordpress
		@sudo mkdir -p /home/adpachec/data/mysql
		docker-compose -p docker-compose.yml build --no-cache

# Iniciar todos los contenedores en segundo plano
up:
		@sudo mkdir -p /home/adpachec/data/wordpress
		@sudo mkdir -p /home/adpachec/data/mysql
		docker-compose -p docker-compose.yml up -d

# Detener y eliminar todos los contenedores, redes y volúmenes
down:
		docker-compose -p docker-compose.yml down

# Detener todos los contenedores sin eliminarlos
stop:
		docker-compose -p  docker-compose.yml stop

# Restart the Docker Compose services
restart:
		docker compose -p docker-compose.yml restart

# Listar todos los contenedores en ejecución
ps:
		docker-compose -p docker-compose.yml ps

# Ver registros de todos los contenedores
logs:
		docker-compose -p docker-compose.yml logs

# Destroy the Docker Compose services
destroy:
		docker compose -p srcs/docker-compose.yml down --rmi all

# Clean up Docker
clean:
		docker compose -p srcs/docker-compose.yml down --rmi all
		docker volume rm mariadb wordpress
		docker system prune -p
		@sudo rm -rf /home/adpachec/data/wordpress
		@sudo rm -rf /home/adpachec/data/mysql

.PHONY: all up down build start destroy stop restart clean ps logs