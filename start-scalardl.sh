#!/bin/bash

az login --service-principal -u 960959df-1788-474c-b123-5a7fd0283579 -p F~dH1suJmZdYZ~wUi6ySSNibZtb~0Dj2Pi --tenant d4ecf981-1f8f-4d2f-8521-1aa55568601e

var1= $(az cosmosdb show --name mathew-cosmos-test --resource-group mathew-arm-test | jq '.documentEndpoint')
var2= $(az cosmosdb keys list --name mathew-cosmos-test --resource-group mathew-arm-test --subscription b647bf0e-0566-4b28-ac8c-37b24f3b7061 --type keys | jq '.primaryMasterKey')

#export values for docker-compose
#export SCALAR_IMAGE=scalarlabs/scalar-ledger:2.0.7
#export SCALAR_DB_STORAGE=cassandra
#export SCALAR_DB_CONTACT_POINTS=cassandra-000000.internal.scalar-labs.com
#export SCALAR_DB_CONTACT_PORT=9042
#export SCALAR_DB_USERNAME=cassandra
#export SCALAR_DB_PASSWORD=cassandra
export dbContactPoints= $var1
export dbpassword= $var2


#Replace load-schemadocker compose values
sed -i 's/dbContactPoints= .\+/dbContactPoints= '$var1'/g' /opt/load-schema/docker-compose.yml
sed -i 's/dbpassword= .\+/dbpassword= '$var2'/g' /opt/load-schema/docker-compose.yml

#Replace scalardl docker compose values
sed -i 's/image: .\+/image: scalarlabs/scalar-ledger:2.1.0/g' /opt/load-schema/docker-compose.yml
sed -i 's/SCALAR_DB_STORAGE= .\+/SCALAR_DB_STORAGE= cosmos/g' /opt/scalardl/docker-compose.yml
sed -i 's/SCALAR_DB_CONTACT_POINTS= .\+/SCALAR_DB_CONTACT_POINTS= '$var1'/g' /opt/scalardl/docker-compose.yml
sed -i 's/SCALAR_DB_PASSWORD= .\+/SCALAR_DB_PASSWORD= '$var2'/g' /opt/scalardl/docker-compose.yml


#run docker compose for scalardl
cd /opt/scalardl ; docker-compose up -d

#run load-schema 
cd /opt/load-schema ; docker-compose up -d
