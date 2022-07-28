# docker-compose-redis-cluster

用于构建 Redis Cluster.
集群实现了3个主服务和对应的3个副本.

## 可选项

### 更改端口和 redis 映射本地文件路径

更改默认端口可以编辑`build-conf.sh`, 例: `6001 6006` -> `7001 7006`.

文件路径需要同时更改`build-conf.sh`和`docker-compose.yml`, 将 yml 中配置的路径与脚本创建的文件夹对应即可.

### 更改 redis 配置

修改`redis.tmpl`文件.

## 如何使用

1. `git clone https://github.com/liCells/docker-compose-redis-cluster.git`
2. `cd docker-compose-redis-cluster`
3. `./build-conf.sh`
4. `docker-compose up`或者`docker-compose up -d`
5. 连接到任意一个 redis, 执行`redis-cli -a pass --cluster create [{IP}:{PORT}...] --cluster-replicas 1`, 然后根据提示进行操作即可.

- [`docker-compose`安装](https://docs.docker.com/compose/install/#install-compose-on-linux-systems), 桌面端的docker会附带安装`docker-compose`
- `cluster-replicas`可以理解为给每一个主服务创建一个副本.
- `redis-cli`在容器的`/usr/local/bin`下

#### 更换版本

> 将 docker-compose.yml 中的 image 标签修改为所对应的版本即可, 根据对应版本修改配置文件路径

redis 5.0 的配置文件位于`/etc/redis/redis.conf`

redis 6.0/6.2.6/7.0/7.0.4 的配置文件位于`/usr/local/etc/redis/redis.conf`

### 参考文档

- [redis cluster 官方文档](https://redis.io/docs/manual/scaling/)
- [docker compose 官方文档](https://docs.docker.com/compose/)
- [docker redis image](https://hub.docker.com/_/redis)
