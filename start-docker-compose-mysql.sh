#!/usr/bin/env bash

set -ex

docker-compose build
docker-compose run web bundle install
docker-compose run web rails db:setup
docker-compose run web rails db:migrate
docker-compose up