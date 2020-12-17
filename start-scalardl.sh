#!/bin/bash

# Add user to docker group
sudo usermod -aG docker centos
sudo pkill docker
sudo systemctl start docker

#export values for docker-compose
export SCALAR_IMAGE=scalarlabs/scalar-ledger:2.1.0
export SCALAR_DB_STORAGE=cassandra
export SCALAR_DB_CONTACT_POINTS=cassandra-000000.internal.scalar-labs.com
export SCALAR_DB_CONTACT_PORT=9042
export SCALAR_DB_USERNAME=cassandra
export SCALAR_DB_PASSWORD=cassandra

#run docker compose
docker-compose up -d
