#!/bin/bash
#Export Home
#export $HOME=/home/centos

#load schema
#docker run -e CASSANDRA_HOST=cassandra-000000.internal.scalar-labs.com -e CASSANDRA_PORT=9042 -e CASSANDRA_USERNAME=cassandra -e CASSANDRA_PASSWORD=cassandra -e CASSANDRA_REPLICATION_FACTOR=3 scalarlabs/scalardl-schema-loader-cassandra:1.0.0

var1= $(az cosmosdb show --name mathew-cosmos-test --resource-group mathew-arm-test | jq '.documentEndpoint')
var2= $(az cosmosdb keys list --name mathew-cosmos-test --resource-group mathew-arm-test --subscription b647bf0e-0566-4b28-ac8c-37b24f3b7061 --type keys | jq '.primaryMasterKey')
docker run --rm scalar-labs/scalardl-schema-loader:1.3.0 --cosmos -h $var1 -p $var2  
