#!/bin/bash

set -e
set -o pipefail

docker build -t didstopia/plex-cleaner:latest .
