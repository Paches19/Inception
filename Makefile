# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adpachec <adpachec@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/31 13:09:36 by adpachec          #+#    #+#              #
#    Updated: 2023/11/10 13:36:06 by adpachec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE=./srcs/docker-compose.yml
DATA_DIR=/home/adpachec/data

# Directorios de datos para WordPress y MariaDB
WP_DATA_DIR=$(DATA_DIR)/wordpress
MDB_DATA_DIR=$(DATA_DIR)/mariadb

all: run

# Construir todos los contenedores
build:
	@sudo mkdir -p $(WP_DATA_DIR)
	@sudo mkdir -p $(MDB_DATA_DIR)
	docker-compose -f $(COMPOSE_FILE) build --no-cache

# Iniciar todos los contenedores
run: 
	@sudo mkdir -p $(WP_DATA_DIR)
	@sudo mkdir -p $(MDB_DATA_DIR)
	docker-compose -f $(COMPOSE_FILE) up --build

# Iniciar todos los contenedores en segundo plano
up:
	@sudo mkdir -p $(WP_DATA_DIR)
	@sudo mkdir -p $(MDB_DATA_DIR)
	docker-compose -f $(COMPOSE_FILE) up -d --build

# Detener y eliminar todos los contenedores, redes y volúmenes
down:
	docker-compose -f $(COMPOSE_FILE) down

# Detener todos los contenedores sin eliminarlos
stop:
	docker-compose -f $(COMPOSE_FILE) stop

# Reiniciar los servicios de Docker Compose
restart:
	docker-compose -f $(COMPOSE_FILE) restart

# Listar todos los contenedores en ejecución
ps:
	docker-compose -f $(COMPOSE_FILE) ps

# Ver registros de todos los contenedores
logs:
	docker-compose -f $(COMPOSE_FILE) logs

# Limpiar Docker
clean:
	@sudo rm -rf $(WP_DATA_DIR)
	@sudo rm -rf $(MDB_DATA_DIR)
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	docker system prune -a -f
	
.PHONY: all build run up down stop restart clean ps logs