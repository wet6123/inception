SRCS = srcs

all: dir
				@sudo -E docker compose -f ./${SRCS}/docker-compose.yml up --build -d

re: clean
				@sudo -E docker compose -f ./${SRCS}/docker-compose.yml up -d

clean: down
				@sudo -E docker images -q | xargs sudo -E docker rmi

fclean: down
				@sudo -E docker images -q | xargs sudo -E docker rmi
				@sudo -E docker network prune --force
				@sudo -E docker volume prune --force
				@sudo -E docker system prune --all --force
				@sudo -E bash ${SRCS}/requirements/tools/make_dir.sh --delete

dir:
				@bash ${SRCS}/requirements/tools/make_dir.sh

down:
				@sudo -E docker compose -f ./${SRCS}/docker-compose.yml down -v

.phony: all re clean fclean build dir down