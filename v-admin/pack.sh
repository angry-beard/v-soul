echo -------------------
echo -     自动脚本     -
echo -------------------
echo 开始pull版本
git stash
git pull origin master
echo 开始编译文件
mvn clean package -Dmaven.test.skip=true
echo 正在停止当前服务
docker stop leave
echo 移除服务镜像
docker rmi leave
echo docker build...
docker build -t 'leave' -f './docker/Dockerfile' .
# 运行 docker
echo 开始运行
docker run -m 256MB --privileged=true --name leave -p 8001:8001 \
 --rm -e TZ=Asia/Shanghai -d v-admin --spring.profiles.active=dev
