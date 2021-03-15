#!/usr/bin/env bash

echo '!!!'
HEROKU_API_KEY=`heroku authorizations:create --expires-in 600 --short`
heroku run "HEROKU_API_KEY=`heroku authorizations:create --expires-in 600 --short` heroku config:set DOMAIN_NAME=https://$HEROKU_APP_NAME.herokuapp.com --app $HEROKU_APP_NAME" -a $HEROKU_APP_NAME
# heroku config:set DOMAIN_NAME=https://$HEROKU_APP_NAME.herokuapp.com --app $HEROKU_APP_NAME
echo "Setting DOMAIN_NAME to $DOMAIN_NAME"