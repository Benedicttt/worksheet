#!/bin/bash

set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

apt-get update && apt-get install -y sudo

cp /app/container/pg_hba.conf /etc/postgresql/13/main/ && cp /app/container/postgresql.conf /etc/postgresql/13/main/

if service postgresql start; then
    echo "POSTGRES installed"
fi

if psql -U postgres -c "create user admin;"; then
    echo "User created"
fi

if psql -U postgres -c "alter user admin password 'admin';"; then
    echo "User created"
fi

if psql -U postgres -c "create database db_development;"; then
    echo "DATABASE created"
fi

if psql -U postgres -c "grant all privileges on database db_development to admin;"; then
    echo "User created"
fi

if psql -U postgres -c "ALTER DATABASE admin OWNER TO db_development;"; then
    echo "User created"
fi

if psql -U postgres -c "create database db_test;"; then
    echo "DATABASE created"
fi

if psql -U postgres -c "grant all privileges on database db_test to admin;"; then
    echo "User created"
fi

if psql -U postgres -c "ALTER DATABASE admin OWNER TO db_test;"; then
    echo "User created"
fi

cd /app

bundle install --jobs 20 --retry 5 --without development
RAILS_ENV=development rake db:migrate
RAILS_ENV=development rake assets:precompile

#bundle exec rails s -b 0.0.0.0
tail -f /dev/null
exec "$@"