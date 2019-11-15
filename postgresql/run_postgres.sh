#!/bin/bash

NAME="postgres10.3"
CID=$(docker ps | awk '{if($NF=="'${NAME}'")print $1}')
if [[ $CID"x" != "x" ]];then
    docker rm --force $CID
fi

docker run -i -t -d \
 --privileged --restart=always --name=postgres10.3 \
-v /data/postgres_docker:/var/lib/postgresql/data \
-v /etc/localtime:/etc/localtime \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=123456 \
-e PGDATA=/var/lib/postgresql/data \
-p 54321:5432 \
postgres:10.3
