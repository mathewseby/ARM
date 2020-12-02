#!/bin/bash
  
apt-get -y update
apt-get -y install git
# install terraform
apt-get -y update
apt-get -y install unzip
apt-get -y update
apt-get -y install wget
wget https://releases.hashicorp.com/terraform/0.12.8/terraform_0.12.8_linux_amd64.zip
unzip terraform_0.12.8_linux_amd64.zip
cp terraform /usr/local/bin/

# clone scalar-terraform
git clone https://github.com/scalar-labs/scalar-terraform.git
cp -ar scalar-terraform /opt/

# create bastion server
cd scalar-terraform/examples/azure/network
ssh-keygen -b 2048 -t rsa -f ./example_key -q -N ""
chmod 400 example_key
ssh-add example_key
terraform init
