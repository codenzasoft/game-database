#!/bin/sh

docker compose -f docker-compose.yml down
docker volume rm db-games_db
