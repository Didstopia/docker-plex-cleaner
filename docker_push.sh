#!/bin/bash

set -e
set -o pipefail

docker tag didstopia/plex-cleaner:latest didstopia/plex-cleaner:latest
docker push didstopia/plex-cleaner:latest
