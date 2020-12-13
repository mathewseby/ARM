var1=$(az vmss nic list -g boney-test --vmss-name cassandra --query [].{ip:ipConfigurations[0].privateIpAddress} -o tsv | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/')

sed -i 's/seeds: .\+/seeds: '$var1'/g' /etc/cassandra/conf/cassandra.yaml
