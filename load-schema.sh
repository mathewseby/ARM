#!/bin/bash
#Export Home
#export $HOME=/home/centos

#load schema
#docker run -e CASSANDRA_HOST=cassandra-000000.internal.scalar-labs.com -e CASSANDRA_PORT=9042 -e CASSANDRA_USERNAME=cassandra -e CASSANDRA_PASSWORD=cassandra -e CASSANDRA_REPLICATION_FACTOR=3 scalarlabs/scalardl-schema-loader-cassandra:1.0.0
#install azure cli
#sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
#echo -e "[azure-cli]
#name=Azure CLI
#baseurl=https://packages.microsoft.com/yumrepos/azure-cli
#enabled=1
#gpgcheck=1
#gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
#sudo yum install azure-cli -y

#install jq
#sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#sudo yum install jq -y

var1= $(az cosmosdb show --name mathew-cosmos-test --resource-group mathew-arm-test | jq '.documentEndpoint')
var2= $(az cosmosdb keys list --name mathew-cosmos-test --resource-group mathew-arm-test --subscription b647bf0e-0566-4b28-ac8c-37b24f3b7061 --type keys | jq '.primaryMasterKey')
docker run --rm scalarlabs/scalardl-schema-loader:1.3.0 --cosmos -h $var1 -p $var2
