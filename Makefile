ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# This command is only executed once to create the basic symfony stuff.
# I left it here to show you how I install my projects. Everything through docker.
init:
	@docker run -it --rm \
		-u "node:$(id -g)" \
		-v "$(shell pwd):/app" \
		-w /app \
		node:latest \
		/bin/bash "npx nuxi@latest init ."

bootup:
	./ops/scripts/bootstrap.sh

build:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} config
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} build --no-cache --progress=plain

start:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} up -d

stop: kill
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} rm -f

kill:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} kill

open:
	open "${APP_URL}:${APP_PORT}"

enter:
	docker exec -ti -u root ${CONTAINER_CODE_NAME} //bin//bash

logs:
	docker logs -f ${CONTAINER_CODE_NAME}