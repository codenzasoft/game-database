#!/bin/sh

ADC="${HOME}/.config/gcloud/application_default_credentials.json"
if [ ! -f "$ADC" ]; then
  echo "Error: Google Application Default Credentials not found."
  echo "Run: gcloud auth application-default login"
  exit 1
fi

docker compose -p game-database-cloud -f docker-compose.cloud.yml up --exit-code-from flyway
docker compose -p game-database-cloud -f docker-compose.cloud.yml down
