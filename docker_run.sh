#!/bin/bash

./docker_build.sh

docker run -v $(pwd)/data:/data --name plex-cleaner -it --rm didstopia/plex-cleaner:latest
