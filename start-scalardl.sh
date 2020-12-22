#!/bin/bash

#export values for docker-compose
export SCALAR_IMAGE=scalarlabs/scalar-ledger:2.0.7
export SCALAR_DB_STORAGE=cassandra
export SCALAR_DB_CONTACT_POINTS=cassandra-000000.internal.scalar-labs.com
export SCALAR_DB_CONTACT_PORT=9042
export SCALAR_DB_USERNAME=cassandra
export SCALAR_DB_PASSWORD=cassandra

#run docker compose
cd /opt ; docker-compose up -d

#Load schema
docker run -e CASSANDRA_HOST=cassandra-000000.internal.scalar-labs.com -e CASSANDRA_PORT=9042 -e CASSANDRA_USERNAME=cassandra -e CASSANDRA_PASSWORD=cassandra -e CASSANDRA_REPLICATION_FACTOR=3 scalarlabs/scalardl-schema-loader-cassandra:1.0.0
