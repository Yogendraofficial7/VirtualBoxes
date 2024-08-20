#######################################################################
###############  INSTALLATION & CONFIGURATION OF SAMBA  ###############
#######################################################################


#!/bin/bash

# Set non-interactive mode for apt-get
export DEBIAN_FRONTEND=noninteractive

set -e  # Exit immediately if a command exits with a non-zero status

# Update repositories using apt-get
sudo apt-get update -y

# Install Samba using apt-get
sudo apt-get install -y samba

# Add existing system user 'yogi' to Samba and set password non-interactively
sudo smbpasswd -a rcxdev << EOF
yogi
yogi
EOF

# Configure Samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.orig  # Backup original config
sudo bash -c 'cat <<EOF > /etc/samba/smb.conf
[global]
   workgroup = WORKGROUP
   server string = Samba Server %v
   log file = /var/log/samba/log.%m
   max log size = 1000
   logging = file
   panic action = /usr/share/samba/panic-action %d
   security = user
   map to guest = bad user
   encrypt passwords = yes
   obey pam restrictions = yes
   smb passwd file = /etc/samba/smbpasswd

[share]
   comment = Samba on Ubuntu
   path = /home/yogi/samba-share
   valid users = yogi
   read only = no
   browseable = yes
   writable = yes
   create mask = 0644
   directory mask = 0755

[homes]
   comment = Home Directories
   browseable = yes
   writable = yes
   read only = no
   create mask = 0700
   directory mask = 0700
   valid users = %S
   force user = %S
   force group = %S
EOF'

# Restart Samba service
sudo systemctl restart smbd

# Restart Samba service
sudo systemctl restart smbd

# Verify Samba user 'yogi' is added
sudo pdbedit -L -v

echo "Samba configuration completed successfully."
