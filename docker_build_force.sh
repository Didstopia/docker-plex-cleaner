#!/bin/bash

set -e
set -o pipefail

docker build --no-cache -t didstopia/plex-cleaner:latest .
