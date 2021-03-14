#!/usr/bin/env bash

echo $HEROKU_APP_NAME
export DOMAIN_NAME=https://$HEROKU_APP_NAME.herokuapp.com