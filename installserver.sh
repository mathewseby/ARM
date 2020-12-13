#!/bin/bash

#var1=$(az vmss nic list -g boney-test --vmss-name cassandra --query [].{ip:ipConfigurations[0].privateIpAddress} -o tsv | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/')

#echo "simply put, just so: $var1" > /opt/test.txt
sed -i 's/seeds: .\+/seeds: '10.42.2.10'/g' /etc/cassandra/conf/cassandra.yaml
