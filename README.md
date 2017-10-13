# Docker-based Craft 3 starter

Out of the box Craft 3 with Nginx, Postgres and Memcached.

## Prerequisites
 - Install [Docker for Mac](https://www.docker.com/docker-mac).
 - Install [Node.js](https://nodejs.org). Recommend using [node version manager](https://github.com/creationix/nvm/) to install.

## Development

1. Inside the root project folder run `docker-compose up`. This will start a web server, a database and a memcache database. All magically behind the scenes.
1. Run `npm install` to install development dependencies.
1. Run `npm run dev` and then go visit [http://localhost/admin](http://localhost/admin), and get to work.

## How to make a copy of remote database

Prerequisite: Install Heroku CLI and ensure that your user has access.

1. Run `heroku git:remote -a vaaler-kommune` in the project folder in order point the code towards Heroku.
1. Run `./download-prod.sh` in the project folder. The database needs to be running for this script to be able to push data into the database.  

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
