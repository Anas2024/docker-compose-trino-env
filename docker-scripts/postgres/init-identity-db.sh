#!/bin/sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE ROLE $IAM_DB_USER LOGIN PASSWORD '$IAM_DB_PASSWORD';
	CREATE DATABASE $IAM_DB_NAME;
	GRANT ALL PRIVILEGES ON DATABASE $IAM_DB_NAME TO $IAM_DB_USER;
EOSQL
