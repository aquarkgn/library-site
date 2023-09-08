PROJECT_PATH = $(shell pwd)

# 启动项目
start: git-update docker-compose-up

# 停止项目
stop: docker-compose-down

git-update:
	echo "git 更新"
	git pull
	echo "git 子模块初始化，并拉取最新代码"
	git submodule update --init --remote

# 运行 docker-compose
docker-compose-up:
	echo "docker-compose up -d"
	docker-compose up -d

# 停止 docker-compose
docker-compose-down:
	echo "docker-compose down"
	docker-compose down