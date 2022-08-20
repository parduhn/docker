#! /bin/bash


docker_restart () {
    export DOCKER=$docker
    screen -S $DOCKER -X stuff "cd ./$DOCKER
    "
    screen -S $DOCKER -X stuff "docker-compose down
    "
    sleep 10

    screen -D -RR $DOCKER -X quit || true
    sleep 5
    screen -dmS $DOCKER sh

    screen -S $DOCKER -X stuff "cd ./$DOCKER
    "
    screen -S $DOCKER -X stuff "docker-compose up
    "
}

# --------------- rabbitmq  -----------------
docker=rabbitmq
docker_restart

