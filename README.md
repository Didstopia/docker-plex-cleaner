# Plex Cleaner for Docker

Run [Plex Cleaner](https://github.com/ngovil21/Plex-Cleaner) inside a Docker container.

## Usage

Mount `/data` on the host system to access the configuration file for Plex Cleaner.

You'll also want to link with Plex Media Server, first editing the `Host` setting in the configuration file to point to `plex`, then exposing Plex inside the container as `plex` (eg. `my-plex-server:plex`).

Finally you'll need to mount your media, so Plex Cleaner can access them, as well as edit the configuration file to match these paths inside the container.

Note that Plex Cleaner runs daily by default.