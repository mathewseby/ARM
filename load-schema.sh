#!/bin/bash
#Export Home
#export $HOME=/home/centos

#load schema
#docker run -e CASSANDRA_HOST=cassandra-000000.internal.scalar-labs.com -e CASSANDRA_PORT=9042 -e CASSANDRA_USERNAME=cassandra -e CASSANDRA_PASSWORD=cassandra -e CASSANDRA_REPLICATION_FACTOR=3 scalarlabs/scalardl-schema-loader-cassandra:1.0.0

docker run --rm scalar-labs/scalardl-schema-loader:1.3.0 --cosmos -h https://mathew-cosmos-test.documents.azure.com:443/ -p JG8WtuOW3mwzXEvPAL10K4ffa8bcxzk6uN0gSZZWX80goYENaBgbM1Q4CkYsvrGu903GPptTnhj8bsH2XPhnrg== 
