#!/bin/bash

# Update system and install Python3, Pip, and Git
sudo apt update -y
sudo apt install -y python3-pip git
pip3 install --upgrade pip
pip3 install Flask boto3

# Installing Docker 
#!/bin/bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 777 /var/run/docker.sock
