#!/bin/bash

# 被拉取的Git仓库URL
REPO_URL="https://github.com/example/repo.git"

# 设置超时时间（秒）
TIMEOUT=10

# 记录开始时间
START_TIME=$(date +%s)

# 循环执行拉取代码的操作，直到超时或拉取成功
while true; do
    # 清空临时目录
    rm -rf temp_repo

    # 克隆代码到临时目录
    git clone $REPO_URL temp_repo

    # 检查克隆是否成功
    if [[ $? -eq 0 ]]; then
        # 拉取成功，退出循环
        echo "拉取代码成功！"
        break
    fi

    # 计算已经经过的时间
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

    # 检查是否已经超过超时时间
    if [[ $ELAPSED_TIME -ge $TIMEOUT then
        # 超时，退出循环
        echo "超时，无法拉取代码！"
        break
    fi

    # 未超时，等待一段时间后重新运行
    sleep 1
done