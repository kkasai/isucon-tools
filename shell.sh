#!/bin/bash -euxo pipefail

PRIVATE_KEY_FILE=~/.ssh/id_rsa
USER_NAME=isucon
IP_ADDR=127.0.0.1
PORT=22

ssh -i ${PRIVATE_KEY_FILE} -p ${PORT} ${USER_NAME}@${IP_ADDR} "sudo cat /var/log/nginx/access.log" > access.log  
ssh -i ${PRIVATE_KEY_FILE} -p ${PORT} ${USER_NAME}@${IP_ADDR} "sudo cat /var/log/mysql/mysql-slow.log" > mysql-slow.log

ssh -i ${PRIVATE_KEY_FILE} -p ${PORT} ${USER_NAME}@${IP_ADDR} "sudo truncate -s 0 /var/log/nginx/access.log" 
ssh -i ${PRIVATE_KEY_FILE} -p ${PORT} ${USER_NAME}@${IP_ADDR} "sudo truncate -s 0 /var/log/mysql/mysql-slow.log"

make alp file=access.log arg="--sort p99"

echo "==============================="

make pt file=mysql-slow.log

