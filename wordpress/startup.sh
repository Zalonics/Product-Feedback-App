#!/bin/bash

contains() {
    if [[ "$1" =~ (^|[[:space:]])"$2"($|[[:space:]]) ]] ; then
        return 0
    else
        return 1
    fi
}

args=$@

if `contains "$args" build` ; then
    echo "Building Images & Starting Containers"
    docker-compose up -d --build
else 
    echo "Starting Containers"
    docker-compose up -d
fi

if `contains "$args" install` ; then
    echo "Installing Plugins"
    docker-compose exec wordpress composer install
fi