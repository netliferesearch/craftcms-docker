#!/bin/bash

DIR=/usr/share/nginx/app
ls /config
# check if we need to install Craft
if [ "$(ls -A $DIR)" ]; then
     echo "Can't install Craft because $DIR is not empty"
else
    echo "INSTALLING CRAFT"
    composer create-project craftcms/craft $DIR -s beta
    cp /.env $DIR
    cp /config/general.php $DIR/config/general.php
    cp /config/memcache.php $DIR/config/memcache.php
fi

# Start nginx
./start.sh
