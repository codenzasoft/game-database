#!/bin/sh

docker compose -f docker-compose.yml down
docker volume rm game_database_db
