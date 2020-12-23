#!/bin/bash
#Export Home
export $HOME=/home/centos

#load schema
docker run -e CASSANDRA_HOST=cassandra-000000.internal.scalar-labs.com -e CASSANDRA_PORT=9042 -e CASSANDRA_USERNAME=cassandra -e CASSANDRA_PASSWORD=cassandra -e CASSANDRA_REPLICATION_FACTOR=3 scalarlabs/scalardl-schema-loader-cassandra:1.0.0
