#!/bin/bash

NAME="redis"
CID=$(docker ps | awk '{if($NF=="'${NAME}'")print $1}')
if [[ $CID"x" != "x" ]];then
    docker rm --force $CID
fi

docker run -i -t -d \
--net="host" --privileged --restart=always --name=redis \
redis
