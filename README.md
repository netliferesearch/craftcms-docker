# Docker-based Craft 3 starter

Out of the box Craft 3 with Nginx, Postgres and Memcached.

## Prerequisites
Install Docker for Mac

## Get started
`docker-compose up`

When you see the Craft welcome screen in Terminal, head over to [0.0.0.0/admin/install](http://0.0.0.0/admin/install) and install Craft.

## Magic Voodo if it does work

**This is a fresh start, will delete any data in existing container**

```
docker-compose down && \
docker-compose build --no-cache && \
docker-compose up --force-recreate
```
