#!/bin/bash
#export values
export ENVOY_IMAGE=envoyproxy/envoy
export ENVOY_TAG=v1.14.1
export ENVOY_PORT=50051
export ENVOY_PRIVILEGED_PORT=50052

#run docker compose
cd /opt ; docker-compose up -d
