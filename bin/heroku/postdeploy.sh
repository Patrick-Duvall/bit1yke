#!/usr/bin/env bash

echo $HEROKU_APP_NAME
echo '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
heroku config:set DOMAIN_NAME=https://$HEROKU_APP_NAME.herokuapp.com