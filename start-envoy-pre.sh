#!/bin/bash

# Add user to docker group
sudo usermod -aG docker centos
newgrp docker
