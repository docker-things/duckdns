#!/bin/bash

# Command used to launch docker
DOCKER_CMD='sudo docker'

# Where to store the backups
BACKUP_PATH="/media/brucelee/WD3TB/DockerBackups"

# The name of the docker image
PROJECT_NAME="duckdns"

# BUILD ARGS
BUILD_ARGS=(
    --build-arg DOCKER_USERID=$(id -u)
    --build-arg DOCKER_GROUPID=$(id -g)
    --build-arg DOCKER_USERNAME=$(whoami)
    )

# BUILD ARGS
RUN_ARGS=(
    # Account token
    -e UPDATE_TOKEN=""

    # Domains to update with the current IP
    -e UPDATE_DOMAINS=""

    # Update interval (seconds)
    -e UPDATE_INTERVAL="300"

    # --dns="`sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' pi-hole`"

    --memory="50m"
    --cpu-shares=128

    --rm
    -d
    )
