#########################################################
###############  INSTALLATION OF MongoDB  ###############
#########################################################

#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Update repositories using apt-get
sudo apt-get update -y

# Install prerequisite packages
sudo apt-get install -y software-properties-common gnupg apt-transport-https ca-certificates

# Download mongosh with OpenSSL 1.1 libraries
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb

# Installing libssl1.1
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb

# import the MongoDB public GPG Key
curl -fsSL https://pgp.mongodb.com/server-4.2.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-4.2.gpg \
   --dearmor 

# Add package to package list
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-4.2.gpg ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Update apt sources again after adding new repository
sudo apt-get update -y

# Install MongoDB 4.2 components 
sudo apt-get install -y mongodb-org

# Start MongoDB service
sudo systemctl start mongod

# Enable MongoDB to start on boot
sudo systemctl enable mongod

# Check MongoDB service status again
sudo systemctl status mongod

echo "MongoDB installation and started successfully."

# removing the libssl1.1 deb file
sudo rm libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb
