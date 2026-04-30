#!/bin/sh

docker compose -f docker-compose.yml up -d
docker logs -f db-games-flyway-1
