#!/bin/bash
set -e
# pesquisar if not exists
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    create role chirpstack_as with login password 'dbpassword';
    create role chirpstack_ns with login password 'dbpassword';

    create database chirpstack_as with owner chirpstack_as;
    create database chirpstack_ns with owner chirpstack_ns;

    CREATE USER med WITH PASSWORD 'pass';
    ALTER USER med WITH SUPERUSER;
    \du
    CREATE DATABASE medicoes WITH OWNER med;
    \q

EOSQL
