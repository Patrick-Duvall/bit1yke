#!/usr/bin/env bash

echo '!!!'
heroku config:set DOMAIN_NAME=https://$HEROKU_APP_NAME.herokuapp.com
echo "Setting DOMAIN_NAME to $DOMAIN_NAME"