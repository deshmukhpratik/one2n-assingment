#!/bin/bash

# Update system and install Python3, Pip, and Git
sudo apt update -y
sudo apt install -y python3-pip git
pip3 install --upgrade pip
pip3 install Flask boto3

# Install and configure Docker
sudo apt install -y docker.io
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sleep 5  # Allow Docker to restart fully
