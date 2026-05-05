# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository manages the PostgreSQL database schema and migrations for the [game-server](https://github.com/codenzasoft/game-server) project. It uses **Flyway** for versioned migrations and **Docker Compose** to run both PostgreSQL and the Flyway runner.

## Commands

**Local:**
```bash
./start-db.sh      # Start PostgreSQL + apply all pending Flyway migrations, then tail logs
./stop-db.sh       # Stop the running containers
./delete-db.sh     # Stop containers and delete the named Docker volume (destructive)
```

**Cloud (Google Cloud SQL):**
```bash
./migrate-cloud.sh  # Apply pending migrations to the Cloud SQL instance, then exit
```

## Architecture

### Local
- **PostgreSQL 16.3** runs on host port `5435` (mapped to internal `5432`). Credentials: `postgres/postgres`.
- **Flyway 11.0.1** runs as a second Docker service that connects to the `db` container, applies migrations from `./migrations/`, and exits. It retries up to 60 times so it tolerates PostgreSQL startup delay.
- Migration config: `config/docker-flyway.config`.

### Cloud
- **Cloud SQL instance:** `crafty-dynamics-495319-e2:us-central1:codenza-games-db` (PostgreSQL 18, `us-central1`)
- **Cloud SQL Auth Proxy** runs as a Docker service, authenticates via Application Default Credentials (ADC), and exposes the Cloud SQL instance on `cloud-sql-proxy:5432` within the Docker network.
- **Flyway** connects through the proxy using `config/cloud-flyway.config`. The `postgres` user password is read from the `CLOUD_DB_PASSWORD` environment variable (never committed — set via `.env`).
- `docker-compose.cloud.yml` defines both services; `migrate-cloud.sh` runs them as a one-shot job.

### Prerequisites for cloud migrations
1. Install the [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) and run `gcloud auth application-default login`
2. Set the `postgres` user password on the Cloud SQL instance in the GCP console
3. Copy `.env.example` to `.env` and fill in `CLOUD_DB_PASSWORD`

## Migration Conventions

Migrations follow Flyway's standard versioning scheme:

```
V{version}__{Description}.sql
```

Versions must be monotonically increasing integers. Flyway validates checksums of applied migrations — **never modify a migration that has already been applied** to any environment. Add a new migration instead.

## Schema Summary

| Table        | Purpose                                              |
|--------------|------------------------------------------------------|
| `users`      | Core user records (uuid PK, email, user_name, password) |
| `user_roles` | Many-to-many user↔role mapping (composite PK)       |

`user_roles.user_id` is a foreign key to `users.id`. Both tables carry `created_at`/`modified_at` timestamps defaulting to `NOW()`.
