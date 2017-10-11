#!/bin/bash

DIR=/usr/share/nginx/app

# check if we need to install Craft
if [ "$(ls -A $DIR)" ]; then
     echo "Can't install Craft because $DIR is not empty"
else
    composer create-project craftcms/craft $DIR -s beta
    cp /.env $DIR
fi

# Start nginx
./start.sh
