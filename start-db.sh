#!/bin/sh

docker compose -f docker-compose.yml up -d
docker logs -f game-database-flyway-1
