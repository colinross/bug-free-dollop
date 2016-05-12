#!/usr/bin/env sh
PG_ROOT = dirname ${PGDATA:='/var/lib/postgresql/data'}

mkdir -p $PG_ROOT && \
chown -R postgres:postgres $PG_ROOT && \
sudo -u postgres pg_ctl initdb -D $PGDATA && \
sudo -u postgres pg_ctl start -D $PGDATA && \
export DATABASE_URL='postgresql://postgres@localhost/'
