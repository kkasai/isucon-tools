#!/bin/bash -euxo pipefail

IP_ADDR=127.0.0.1

ssh -i ~/.ssh/id_rsa isucon@${IP_ADDR} "sudo cat /var/log/nginx/access.log" > access.log  
ssh -i ~/.ssh/id_rsa isucon@${IP_ADDR} "sudo cat /var/log/mysql/mysql-slow.log" > mysql-slow.log

ssh -i ~/.ssh/id_rsa isucon@${IP_ADDR} "sudo truncate -s 0 /var/log/nginx/access.log" 
ssh -i ~/.ssh/id_rsa isucon@${IP_ADDR} "sudo truncate -s 0 /var/log/mysql/mysql-slow.log"

make alp file=access.log arg="--sort p99"

echo "==============================="

make pt file=mysql-slow.log

