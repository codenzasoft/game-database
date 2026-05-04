#!/bin/sh

docker compose -f docker-compose.cloud.yml up --exit-code-from flyway
docker compose -f docker-compose.cloud.yml down
