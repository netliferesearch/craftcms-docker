# Docker-based Craft 3 starter

Out of the box Craft 3 with Nginx, Postgres and Memcached.

## Prerequisites
 - Install [Docker for Mac](https://www.docker.com/docker-mac).
 - Install [Node.js](https://nodejs.org). Recommend using [node version manager](https://github.com/creationix/nvm/) to install.

## Development

1. Inside the root project folder run `docker-compose up`. This will start a web server, a database and a memcache database. All magically behind the scenes.
1. Run `npm install` to install development dependencies.
1. Run `npm run dev` and then go visit [http://localhost/admin](http://localhost/admin), and get to work.

## Deployment

Just push the thing to Heroku, and set some .env-stuff

When you see the Craft welcome screen in Terminal, head over to [0.0.0.0/admin/install](http://0.0.0.0/admin/install) and install Craft.

## Troubleshooting

**This is a fresh start, will delete any data in existing container**

```
docker-compose down && \
docker-compose build --no-cache && \
docker-compose up --force-recreate
```
