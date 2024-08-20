############################################################################
###############  INSTALLATION OF PACKAGES & CREATION OF USER ###############
############################################################################

#!/bin/bash
set -e
set -v

sudo apt install -y links rsync
sudo apt-get install -y openvswitch-switch
sudo apt install network-manager -y

# Update package index
sudo apt-get update

# Variables
USERNAME="Yogi"
PASSWORD="Yogi"

# Create user with password
echo "Creating user $USERNAME..."
useradd -m -s /bin/bash "$USERNAME"

# Set password for the user
echo "$USERNAME:$PASSWORD" | chpasswd

# Add user to sudo group (optional, if you want to give sudo privileges)
usermod -aG sudo $USERNAME

echo "User $USERNAME created successfully with password $PASSWORD."

echo "rcxdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/Yogi
chmod 440 /etc/sudoers.d/Yogi

# Update package index
sudo apt-get update

# Installing awscli-v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

# Update package index
sudo apt-get update

# Installing Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt install docker -y
sudo usermod -aG docker Yogi
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Installing java
sudo apt install openjdk-21-jdk -y

# Check if pip3 is installed or not
if ! command -v pip3 &> /dev/null; then
    echo "Installing pip3..."

    # Install pip3
    sudo apt update
    sudo apt install -y python3-pip

else
    echo "pip3 is already installed."
fi

# Check pip3 version
pip3 --version

# Installing Upgrade yaml 
pip install --upgrade pyyaml

# Update package index
sudo apt-get update

#installing iproute2
sudo apt install iproute2

# Update package index
sudo apt-get update
