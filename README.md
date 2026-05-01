# game-database
Database for the [game-server](https://github.com/codenzasoft/game-server).

## Overview
The PostgresQL database runs locally as a Docker container using Flyway to manage database migrations.
Shell scripts are used to start, stop, and delete the database.

To start the database and apply migrations:
```shell
./start-db.sh
```
To stop the database:
```shell
./stop-dt.sh
```
To delete the database:
```shell
./delete-db.sh
```