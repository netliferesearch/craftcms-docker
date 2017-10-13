#!/bin/bash

SOURCE_DIR=/craft-tmp-build
TARGET_DIR=/usr/share/nginx/app
ls /config
# check if we need to install Craft
if [ "$(ls -A $TARGET_DIR)" ]; then
     echo "Can't install Craft because $TARGET_DIR is not empty"
else
    echo "Moving craft from $SOURCE_DIR into $TARGET_DIR so that it's visible on host"
    # We move the files inside the docker container into mounted folder so that
    # they'll re-emerge on the user's host pc from within the bowels of the container.
    cp -a $SOURCE_DIR/. $TARGET_DIR
fi

# Start nginx
./start.sh
