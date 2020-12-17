#!/bin/bash

# Add user to docker group
sudo usermod -aG docker centos
sudo pkill -f centos
sudo systemctl start docker

#export values for docker-compose
export ENVOY_IMAGE=envoyproxy/envoy
export ENVOY_TAG=v1.12.3
export ENVOY_PORT=50051
export ENVOY_PRIVILEGED_PORT=50052

#run docker compose
docker-compose up -d
