FROM didstopia/base:alpine-3.5

MAINTAINER Didstopia <support@didstopia.com>

# Plex Cleaner URL
ENV PLEX_CLEANER_URL="https://github.com/ngovil21/Plex-Cleaner/archive/f4c3fe2cc4352bb67fdab5c4f36357f2186abfca.zip"

# Use root user by default
USER root

# Install dependencies
RUN apk --no-cache add \
    busybox-suid \
    unzip \
    python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

# Ensure Python was correctly installed
RUN python3 --version

# Install Plex Cleaner
ADD ${PLEX_CLEANER_URL} /tmp/plexcleaner.zip
RUN mkdir -p /plexcleaner && \
    unzip -j /tmp/plexcleaner.zip -d /plexcleaner && \
    chown -R docker:docker /plexcleaner && \
    rm -f /tmp/plexcleaner.zip

# Setup scheduled running of Plex Cleaner
COPY plexcleaner.cron /tmp/plexcleaner.cron
RUN crontab -u docker /tmp/plexcleaner.cron

# Setup volumes
RUN mkdir -p /config && \
    chown -R docker:docker /config
VOLUME /config

# Set the entry point
ENTRYPOINT crond -fS
