#!/bin/bash

#var1=$(az vmss nic list -g boney-test --vmss-name cassandra --query [].{ip:ipConfigurations[0].privateIpAddress} -o tsv | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/')

systemctl stop cassandra
rm -rf /commitlog/*
rm -rf /data/*

#echo "simply put, just so: $var1" > /opt/test.txt
sed -i 's/seeds: .\+/seeds: 'cassandra-0.internal.scalar-labs.com,cassandra-1.internal.scalar-labs.com,cassandra-2.internal.scalar-labs.com'/g' /etc/cassandra/conf/cassandra.yaml
systemctl start cassandra

for i in 0 1 2
do
ip=$(az vm show -g $1 -n cassandra-$i --query privateIps -d --out tsv)
az network dns record-set a add-record -g $1 -z interal.scalar-labs.com -n cassandra-lb -a $ip
done
