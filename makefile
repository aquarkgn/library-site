PROJECT_PATH = $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

# 启动项目
start: git-update docker-compose-up

# 停止项目
stop: docker-compose-down

git-update:
	git pull
	git submodule update --init --remote

# 运行 docker-compose
docker-compose-up:
	docker-compose up -d

# 停止 docker-compose
docker-compose-down:
	docker-compose down