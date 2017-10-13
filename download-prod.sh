#!/bin/bash
echo "Fetch database env from Heroku"
DATABASE_URL="$(heroku config:get DATABASE_URL)"
echo "Create destination folder docker-src/db for db dump"
mkdir -p docker-src/db
echo "Downloading database dump from Heroku. This might take a couple of minutes"
docker run -v $(pwd)/docker-src/db:/container-dump postgres:9.6.4 \
  pg_dump -c -f /container-dump/craft-dump.sql $DATABASE_URL
echo "Finished downloading file, starting import into postgres"
docker run --rm --net=host -v $(pwd)/docker-src:/docker-src postgres:9.6.4 \
  sh -c 'psql postgresql://craft3beta:secret@localhost:5433/craft3beta < /docker-src/db/craft-dump.sql'
echo "Done with work"
