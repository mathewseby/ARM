# var1=$(az vmss nic list -g $1 --vmss-name $2 --query [].{ip:ipConfigurations[0].privateIpAddress} -o tsv | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/')

sed 's/seeds: .\+/seeds: '10.42.2.4'/g' /etc/cassandra/conf/cassandra.yaml
