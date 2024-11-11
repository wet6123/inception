SRCS = srcs

all: dir
				@docker compose -f ./${SRCS}/docker-compose.yml up --build -d

re: clean
				@docker compose -f ./${SRCS}/docker-compose.yml up -d

clean: down
				@docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm

fclean: down
				@docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm
				@docker network prune --force
				@docker volume prune --force
				@docker system prune --all --force
				@bash ${SRCS}/requirements/tools/make_dir.sh --delete

dir:
				@bash ${SRCS}/requirements/tools/make_dir.sh

down:
				@docker compose -f ./${SRCS}/docker-compose.yml down -v

.phony: all re clean fclean build dir down