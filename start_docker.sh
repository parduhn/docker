#! /bin/bash


docker_restart () {
    export DOCKER=$docker
    screen -S $DOCKER -X stuff "cd /home/hayo/timeover/docker/$DOCKER
    "
    screen -S $DOCKER -X stuff "docker-compose down
    "
    sleep 10

    screen -D -RR rabbitmq -X quit || true
    sleep 5
    screen -dmS $DOCKER sh

    screen -S $DOCKER -X stuff "cd /home/hayo/timeover/docker/$DOCKER
    "
    screen -S $DOCKER -X stuff "docker-compose up
    "
}

# --------------- rabbitmq  -----------------
docker=rabbitmq
docker_restart

