#!/bin/bash

var1=$(az vmss nic list -g mathew-arm-test --vmss-name mathew-cassandra-test --query [].{ip:ipConfigurations[0].privateIpAddress} -o tsv | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/')

sed 's/seeds: .\+/seeds: '$var1'/g' ./cassandra
