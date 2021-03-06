# Docker-based Craft 3 starter

Welcome!

Out of the box Craft 3 with Nginx, Postgres and Memcached.

Read the readme. If/when you see opportunities to improve this setup do speak your mind in an issue. :)

## Prerequisites
 - Install [Docker for Mac](https://www.docker.com/docker-mac).
 - Install [Node.js](https://nodejs.org). Recommend using [node version manager](https://github.com/creationix/nvm/) to install.

## Development

1. Inside the root project folder run `docker-compose up`. This will start a web server, a database and a memcache database. All magically behind the scenes.
1. Run `npm install` to install development dependencies.
1. Run `npm run dev` and then go visit [http://localhost/admin](http://localhost/admin), and get to work.

Where are the files to edit?

- /app has the craft installation.
- /resources houses both js and css.

## How to make a copy of remote database

Prerequisite: Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and ensure that your user has access.

1. Run `heroku git:remote -a INSERT-HEROKU-APPNAME` in the project folder in order point the code towards Heroku.
1. Run `./download-prod.sh` in the project folder. The database needs to be running for this script to be able to push data into the database.

## Deployment

1. First ensure that you have command line access to push to Heroku (see previous section).
1. Run `git push heroku`
1. Visit the app online.

## Troubleshooting

1. Delete containers with: `docker-compose down && docker-compose up --force-recreate`
1. If you want to purge and reinstall craft as well. You can delete the /app folder before running the previous step.

### Something is hogging port 80

```ERROR: for crafttest_web_1  Cannot start service web: driver failed programming external connectivity on endpoint crafttest_web_1 (bf5f12acc37ee944ffd25862ef41f8bc16e9df3b6aef935c7ce8ad720f13dde1): Error starting userland proxy: Bind for 0.0.0.0:80: unexpected error (Failure EADDRINUSE)```

You most probably have either MAMP or a local Apache server running. MAMP can be quit, and you can turn off the local apache running these two commands in terminal:

`sudo launchctl unload /System/Library/LaunchDaemons/org.apache.httpd.plist`

`killall httpd`
