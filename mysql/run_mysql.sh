#!/bin/bash

NAME="mysql-5.7"
CID=$(docker ps | awk '{if($NF=="'${NAME}'")print $1}')
if [[ $CID"x" != "x" ]];then
    docker rm --force $CID
fi

docker run -itd \
        --name deepvideo-mysql \
        -v $(pwd)/mysql-data:/var/lib/mysql \
        -v /etc/localtime:/etc/localtime \
        -e MYSQL_ROOT_PASSWORD=12345678 \
        -p 3306:3306 \
        mysql:5.7
