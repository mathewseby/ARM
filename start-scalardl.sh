#!/bin/bash

#export values for docker-compose
export SCALAR_IMAGE=scalarlabs/scalar-ledger:2.0.7
export SCALAR_DB_STORAGE=cassandra
export SCALAR_DB_CONTACT_POINTS=cassandra-000000.internal.scalar-labs.com
export SCALAR_DB_CONTACT_PORT=9042
export SCALAR_DB_USERNAME=cassandra
export SCALAR_DB_PASSWORD=cassandra

#run docker compose for scalardl
cd /opt/scalardl ; docker-compose up -d

#run docker compose for load-schema
cd /opt/load-schema ; docker-compose up -d
