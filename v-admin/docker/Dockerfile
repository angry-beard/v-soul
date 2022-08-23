FROM openjdk:11-jre
# 预先编译好项目，然后直接找到 jar 进行 push
MAINTAINER angry_beard
## 复制文件到容器 leave-preview-7.01.jar
ADD ./target/v-admin-0.0.1.jar /v-admin.jar
ENV TZ=Asia/Shanghai
## 声明需要暴露的端口
EXPOSE 8001
# 修改JVM 参数
ENV JAVA_OPTS="\
-server \
-Xmx4g \
-Xms4g \
-Xmn128m \
-XX:SurvivorRatio=1 \
-XX:MetaspaceSize=64m \
-XX:MaxMetaspaceSize=64m \
-XX:ParallelGCThreads=4 \
-XX:+PrintGCDetails \
-XX:+PrintTenuringDistribution \
-XX:+PrintGCTimeStamps \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=/ \
-Xloggc:/logs/gc.log \
-XX:+UseGCLogFileRotation \
-XX:NumberOfGCLogFiles=5 \
-XX:+DisableExplicitGC \
-XX:+UseConcMarkSweepGC \
-XX:+UseParNewGC \
-XX:+CMSParallelRemarkEnabled \
-XX:+CMSClassUnloadingEnabled \
-XX:LargePageSizeInBytes=64M \
-XX:+UseFastAccessorMethods \
-XX:+UseCMSInitiatingOccupancyOnly \
-XX:CMSInitiatingOccupancyFraction=80 \
-XX:SoftRefLRUPolicyMSPerMB=0 \
-XX:+PrintClassHistogram \
-XX:+PrintHeapAtGC \
-XX:+UnlockDiagnosticVMOptions \
-XX:+UnlockExperimentalVMOptions \
-XX:+PrintFlagsFinal\
-XX:GCLogFileSize=10M\
-Dspring.profiles.active=dev"
## 配置容器启动后执行的命令 # 执行jar包
ENTRYPOINT ["java","-Dspring.profiles.active=dev","-jar","-Xmx128m","-Xms128m","/v-admin.jar"]