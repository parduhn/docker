#! /bin/bash

echo '---------------------------------------- Copy Files ------------------------------------------------'
rsync -av --progress --exclude='.*' ./* hayo@10.1.2.1:/home/hayo/timeover/docker
echo '---------------------------------------- Start script ----------------------------------------'
ssh -t hayo@10.1.2.1 "bash /home/hayo/timeover/docker/start_docker.sh"
