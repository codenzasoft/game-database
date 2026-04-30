#!/bin/sh

docker compose -f docker-compose.yml down
docker volume rm game-database_db
