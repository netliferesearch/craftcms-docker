#!/bin/bash

DIR=/usr/share/nginx/app
ls /config
# check if we need to install Craft
if [ "$(ls -A $DIR)" ]; then
     echo "Can't install Craft because $DIR is not empty"
else
    echo "INSTALLING CRAFT"
    composer create-project craftcms/craft $DIR -s beta
    composer install -d $DIR
    # We move the files inside the docker container into mounted folder so that
    # they'll re-emerge on the user's host pc from within the bowels of the container.
    cp /.env $DIR
    cp /config/general.php $DIR/config/general.php
    cp /config/memcache.php $DIR/config/memcache.php
    cp /config/db.php $DIR/config/db.php
fi

# Start nginx
./start.sh
