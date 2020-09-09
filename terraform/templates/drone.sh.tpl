#!/bin/bash


# run drone
if [[ -z $USERNAME  ]]; then
    su ${USERNAME}
fi
docker run \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    --volume=/mnt/${DRONE_DATA_VOLUME}:/data \
    --env=DRONE_GITHUB_SERVER=https://github.com \
    --env=DRONE_GITHUB_CLIENT_ID=${DRONE_GITHUB_CLIENT_ID} \
    --env=DRONE_GITHUB_CLIENT_SECRET=${DRONE_GITHUB_CLIENT_SECRET} \
    --env=DRONE_RUNNER_CAPACITY=${DRONE_RUNNER_CAPACITY} \
    --env=DRONE_SERVER_HOST=${DRONE_SERVER_HOST} \
    --env=DRONE_SERVER_PROTO=https \
    --env=DRONE_RPC_SECRET=${DRONE_RPC_SECRET} \
    --env=DRONE_LOGS_DEBUG=${DRONE_LOGS_DEBUG} \
    --env=DRONE_TLS_AUTOCERT=true \
    --publish=80:80 \
    --publish=443:443 \
    --restart=always \
    --detach=true \
    --name=recondroid \
    drone/drone:1
