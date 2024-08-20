# packer-ubuntu-vagrant

## How to use Packer to create Ubuntu 18.04 Vagrant boxes

```
I have windows 11 os, install below tools with versions

D:\PACKER\UBUNTU-PACKER>vagrant --version
Vagrant 2.2.16

D:\PACKER\UBUNTU-PACKER>packer --version
1.7.7

virtual box version: 6.1.22


Requirements:
vagrant
virtual box
packer
```

- Clone the repo code into D:\PACKER\UBUNTU-PACKER folder

```
Goto this folder and open gitbash from here

D:\PACKER\UBUNTU-PACKER

```
- Download the iso file from
- http://cdimage.ubuntu.com/ubuntu/releases/bionic/release/ubuntu-18.04.6-server-amd64.iso

```
packer validate build.json
```

```
packer build build.json
```

- Here, packer will download the iso file and bring up a virtual machine, installs ubuntu18.04 in it and executes our scripts, required packages, forms vagrant box in outputs folder and exits
- To view the background output of build process, we can view from virtual box gui

- During the build process we can enter into machine by virtualbox gui show option, now virtual machine will be destroyed after installing required packages, 
- username: vagrant
- password: vagrant

- Now we have vagrant box image in outputs folder -> virtualbox-ubuntu2004.box
- We need to add this box to vagrant


```
$ packer build build.json
virtualbox-iso: output will be in this color.

==> virtualbox-iso: Retrieving Guest additions
==> virtualbox-iso: Trying C:\Program Files\Oracle\VirtualBox/VBoxGuestAdditions.iso
==> virtualbox-iso: Trying file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
==> virtualbox-iso: file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso => C:/Program Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
==> virtualbox-iso: Retrieving ISO
==> virtualbox-iso: Trying ubuntu-18.04.6-server-amd64.iso
==> virtualbox-iso: Trying ubuntu-18.04.6-server-amd64.iso?checksum=sha256%3Af5cbb8104348f0097a8e513b10173a07dbc6684595e331cb06f93f385d0aecf6
==> virtualbox-iso: ubuntu-18.04.6-server-amd64.iso?checksum=sha256%3Af5cbb8104348f0097a8e513b10173a07dbc6684595e331cb06f93f385d0aecf6 => D:/PACKER/UBUNTU-PACKER-18.04/ubuntu-18.04.6-server-amd64.iso
==> virtualbox-iso: Starting HTTP server on port 8165
==> virtualbox-iso: Creating virtual machine...
==> virtualbox-iso: Creating hard drive output-virtualbox-iso\packer-ubuntu-18.04-amd64.vdi with size 20000 MiB...
==> virtualbox-iso: Mounting ISOs...
    virtualbox-iso: Mounting boot ISO...
==> virtualbox-iso: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 2939)
==> virtualbox-iso: Executing custom VBoxManage commands...
    virtualbox-iso: Executing: modifyvm packer-ubuntu-18.04-amd64 --memory 1024
    virtualbox-iso: Executing: modifyvm packer-ubuntu-18.04-amd64 --cpus 1
==> virtualbox-iso: Starting the virtual machine...
    virtualbox-iso: The VM will be run headless, without a GUI. If you want to
    virtualbox-iso: view the screen of the VM, connect via VRDP without a password to
    virtualbox-iso: rdp://127.0.0.1:5956
==> virtualbox-iso: Waiting 10s for boot...
==> virtualbox-iso: Typing the boot command...
==> virtualbox-iso: Using SSH communicator to connect: 127.0.0.1
==> virtualbox-iso: Waiting for SSH to become available...
==> virtualbox-iso: Connected to SSH!
==> virtualbox-iso: Uploading VirtualBox version info (6.1.22)
==> virtualbox-iso: Uploading VirtualBox guest additions ISO...
==> virtualbox-iso: Provisioning with shell script: scripts/init.sh
==> virtualbox-iso: [sudo] password for vagrant:
==> virtualbox-iso: Pausing 1m0s after this provisioner...
==> virtualbox-iso: Uploading keys/id_rsa.pub => ~/.ssh/
==> virtualbox-iso: Provisioning with shell script: scripts/install.sh
==> virtualbox-iso: grep: /home/vagrant/.ssh/authorized_keys: No such file or directory
    virtualbox-iso: Your public key is:
    virtualbox-iso: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJfx17B+GECYi3t9EOW+Djv78NYa9pBW/8Xai5eXuC2HvUuV4f/yE1kyMVq/rgzFoIBrIxB192U7EiZvb3NDAHb7TxoYTi3SaGhCXepVQZPa8PaFt2F2jsSFeDWdX1q67LH3aevkZg2zDck7GidtCnaHCvQcAHTWlK8/XSMiTuKlJrSS1JieX+h8tVJP0YfiNREZknXr48Rt6kSNwnLYwflOxtCTI4ZhmfNMVmQBuGF8L/parG0J2rRiDUhekUN9TYbLL90n/2nnZMrEGqS6PtOUMs1MgpPutTRok7Mqfvrwgt6Hi5IMRkabsPGyQnR2CKttXsW1jwHh/P/sLD3swliiF+aWU/qsjvf1jAXrLu5JhfeOzt0odqNi1dYonvhrva4Wqk3t8ZtUJyvGfXLQR2DkrkwncuXaWmdzLm94yIaDd5d9AbkXU4GP9OhutJgtS8dJ9AzzED94K+hbbOgC7ta8KKUSDV5iYz81xH87aWtMJpJImzpr8GHotQiVSgA8Dgd0VG51tNJFf5XSLhP+Vd+bV9aaineeg60t46tJP22BRZt4XaNm+v2lwWaqsYu7Jm94kgYl8HcCXyzQGgtIaqy1T2m878ZhcMqc7qixS52/MMjek4zXkQ6+PF5A1HREEgPUZFvmP+xS+rrFZatcFGaoEM/9Xm+z1ZaDFj7VDVfQ== your_email@example.com
==> virtualbox-iso:
==> virtualbox-iso: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> virtualbox-iso:
    virtualbox-iso: Hit:1 http://us.archive.ubuntu.com/ubuntu bionic InRelease
    virtualbox-iso: Hit:2 http://security.ubuntu.com/ubuntu bionic-security InRelease
    virtualbox-iso: Hit:3 http://us.archive.ubuntu.com/ubuntu bionic-updates InRelease
    virtualbox-iso: Hit:4 http://us.archive.ubuntu.com/ubuntu bionic-backports InRelease
    virtualbox-iso: Reading package lists...
    virtualbox-iso: Building dependency tree...
    virtualbox-iso: Reading state information...
    virtualbox-iso: 118 packages can be upgraded. Run 'apt list --upgradable' to see them.
==> virtualbox-iso:
==> virtualbox-iso: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> virtualbox-iso:
    virtualbox-iso: Reading package lists...
    virtualbox-iso: Building dependency tree...
    virtualbox-iso: Reading state information...
    virtualbox-iso: The following additional packages will be installed:
    virtualbox-iso:   git-man libcurl3-gnutls liberror-perl libnghttp2-14 librtmp1
    virtualbox-iso: Suggested packages:
    virtualbox-iso:   git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk
    virtualbox-iso:   gitweb git-cvs git-mediawiki git-svn
    virtualbox-iso: The following NEW packages will be installed:
    virtualbox-iso:   git git-man libcurl3-gnutls liberror-perl libnghttp2-14 librtmp1
    virtualbox-iso: 0 upgraded, 6 newly installed, 0 to remove and 118 not upgraded.
    virtualbox-iso: Need to get 5,168 kB of archives.
    virtualbox-iso: After this operation, 35.3 MB of additional disk space will be used.
    virtualbox-iso: Get:1 http://us.archive.ubuntu.com/ubuntu bionic/main amd64 libnghttp2-14 amd64 1.30.0-1ubuntu1 [77.8 kB]
    virtualbox-iso: Get:2 http://us.archive.ubuntu.com/ubuntu bionic/main amd64 librtmp1 amd64 2.4+20151223.gitfa8646d.1-1 [54.2 kB]
    virtualbox-iso: Get:3 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libcurl3-gnutls amd64 7.58.0-2ubuntu3.24 [219 kB]
    virtualbox-iso: Get:4 http://us.archive.ubuntu.com/ubuntu bionic/main amd64 liberror-perl all 0.17025-1 [22.8 kB]
    virtualbox-iso: Get:5 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 git-man all 1:2.17.1-1ubuntu0.18 [804 kB]
    virtualbox-iso: Get:6 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 git amd64 1:2.17.1-1ubuntu0.18 [3,990 kB]
==> virtualbox-iso: debconf: unable to initialize frontend: Dialog
==> virtualbox-iso: debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
==> virtualbox-iso: debconf: falling back to frontend: Readline
==> virtualbox-iso: debconf: unable to initialize frontend: Readline
==> virtualbox-iso: debconf: (This frontend requires a controlling tty.)
==> virtualbox-iso: debconf: falling back to frontend: Teletype
==> virtualbox-iso: dpkg-preconfigure: unable to re-open stdin:
    virtualbox-iso: Fetched 5,168 kB in 6s (823 kB/s)
    virtualbox-iso: Selecting previously unselected package libnghttp2-14:amd64.
    virtualbox-iso: (Reading database ... 68003 files and directories currently installed.)
    virtualbox-iso: Preparing to unpack .../0-libnghttp2-14_1.30.0-1ubuntu1_amd64.deb ...
    virtualbox-iso: Unpacking libnghttp2-14:amd64 (1.30.0-1ubuntu1) ...
    virtualbox-iso: Selecting previously unselected package librtmp1:amd64.
    virtualbox-iso: Preparing to unpack .../1-librtmp1_2.4+20151223.gitfa8646d.1-1_amd64.deb ...
    virtualbox-iso: Unpacking librtmp1:amd64 (2.4+20151223.gitfa8646d.1-1) ...
    virtualbox-iso: Selecting previously unselected package libcurl3-gnutls:amd64.
    virtualbox-iso: Preparing to unpack .../2-libcurl3-gnutls_7.58.0-2ubuntu3.24_amd64.deb ...
    virtualbox-iso: Unpacking libcurl3-gnutls:amd64 (7.58.0-2ubuntu3.24) ...
    virtualbox-iso: Selecting previously unselected package liberror-perl.
    virtualbox-iso: Preparing to unpack .../3-liberror-perl_0.17025-1_all.deb ...
    virtualbox-iso: Unpacking liberror-perl (0.17025-1) ...
    virtualbox-iso: Selecting previously unselected package git-man.
    virtualbox-iso: Preparing to unpack .../4-git-man_1%3a2.17.1-1ubuntu0.18_all.deb ...
    virtualbox-iso: Unpacking git-man (1:2.17.1-1ubuntu0.18) ...
    virtualbox-iso: Selecting previously unselected package git.
    virtualbox-iso: Preparing to unpack .../5-git_1%3a2.17.1-1ubuntu0.18_amd64.deb ...
    virtualbox-iso: Unpacking git (1:2.17.1-1ubuntu0.18) ...
    virtualbox-iso: Setting up git-man (1:2.17.1-1ubuntu0.18) ...
    virtualbox-iso: Setting up libnghttp2-14:amd64 (1.30.0-1ubuntu1) ...
    virtualbox-iso: Setting up liberror-perl (0.17025-1) ...
    virtualbox-iso: Setting up librtmp1:amd64 (2.4+20151223.gitfa8646d.1-1) ...
    virtualbox-iso: Setting up libcurl3-gnutls:amd64 (7.58.0-2ubuntu3.24) ...
    virtualbox-iso: Setting up git (1:2.17.1-1ubuntu0.18) ...
    virtualbox-iso: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    virtualbox-iso: Processing triggers for libc-bin (2.27-3ubuntu1.4) ...
==> virtualbox-iso:
==> virtualbox-iso: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> virtualbox-iso:
    virtualbox-iso: Reading package lists...
    virtualbox-iso: Building dependency tree...
    virtualbox-iso: Reading state information...
    virtualbox-iso: The following NEW packages will be installed:
    virtualbox-iso:   net-tools
    virtualbox-iso: 0 upgraded, 1 newly installed, 0 to remove and 118 not upgraded.
    virtualbox-iso: Need to get 194 kB of archives.
    virtualbox-iso: After this operation, 803 kB of additional disk space will be used.
    virtualbox-iso: Get:1 http://us.archive.ubuntu.com/ubuntu bionic/main amd64 net-tools amd64 1.60+git20161116.90da8a0-1ubuntu1 [194 kB]
==> virtualbox-iso: debconf: unable to initialize frontend: Dialog
==> virtualbox-iso: debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
==> virtualbox-iso: debconf: falling back to frontend: Readline
==> virtualbox-iso: debconf: unable to initialize frontend: Readline
==> virtualbox-iso: debconf: (This frontend requires a controlling tty.)
==> virtualbox-iso: debconf: falling back to frontend: Teletype
==> virtualbox-iso: dpkg-preconfigure: unable to re-open stdin:
    virtualbox-iso: Fetched 194 kB in 2s (114 kB/s)
    virtualbox-iso: Selecting previously unselected package net-tools.
    virtualbox-iso: (Reading database ... 68929 files and directories currently installed.)
    virtualbox-iso: Preparing to unpack .../net-tools_1.60+git20161116.90da8a0-1ubuntu1_amd64.deb ...
    virtualbox-iso: Unpacking net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...
    virtualbox-iso: Setting up net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...
    virtualbox-iso: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
==> virtualbox-iso: Gracefully halting virtual machine...
==> virtualbox-iso: Preparing to export machine...
    virtualbox-iso: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 2939)
==> virtualbox-iso: Exporting virtual machine...
    virtualbox-iso: Executing: export packer-ubuntu-18.04-amd64 --output output-virtualbox-iso\packer-ubuntu-18.04-amd64.ovf
==> virtualbox-iso: Cleaning up floppy disk...
==> virtualbox-iso: Deregistering and deleting VM...
==> virtualbox-iso: Running post-processor: vagrant
==> virtualbox-iso (vagrant): Creating a dummy Vagrant box to ensure the host system can create one correctly
==> virtualbox-iso (vagrant): Creating Vagrant box for 'virtualbox' provider
    virtualbox-iso (vagrant): Copying from artifact: output-virtualbox-iso\packer-ubuntu-18.04-amd64-disk001.vmdk
    virtualbox-iso (vagrant): Copying from artifact: output-virtualbox-iso\packer-ubuntu-18.04-amd64.ovf
    virtualbox-iso (vagrant): Renaming the OVF to box.ovf...
    virtualbox-iso (vagrant): Compressing: Vagrantfile
    virtualbox-iso (vagrant): Compressing: box.ovf
    virtualbox-iso (vagrant): Compressing: metadata.json
    virtualbox-iso (vagrant): Compressing: packer-ubuntu-18.04-amd64-disk001.vmdk
Build 'virtualbox-iso' finished after 12 minutes 33 seconds.

==> Wait completed after 12 minutes 33 seconds

==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: outputs/virtualbox-ubuntu1804.box
```


```
vagrant box remove virtualbox-ubuntu1804
vagrant box add --name virtualbox-ubuntu1804 file:///D:/PACKER/UBUNTU-PACKER/outputs/virtualbox-ubuntu1804.box

pwd
/d/PACKER/UBUNTU-PACKER
```


```
$ vagrant box add --name virtualbox-ubuntu1804 file:///D:/PACKER/UBUNTU-PACKER-18.04/outputs/virtualbox-ubuntu1804.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'virtualbox-ubuntu1804' (v0) for provider:
    box: Unpacking necessary files from: file:///D:/PACKER/UBUNTU-PACKER-18.04/outputs/virtualbox-ubuntu1804.box
    box:
==> box: Successfully added box 'virtualbox-ubuntu1804' (v0) for 'virtualbox'!

```


- Now this box is added to local vagrant, we need to bringup virtual machine by using this vagrant box and Vagrantfile
- Below is the vagrant file

  
```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  config.vm.box = "virtualbox-ubuntu1804"

  config.vm.network "private_network", ip: "192.168.50.250"

  config.vm.network "forwarded_port", guest: 4000, host: 8000

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.name = "VAGRANT-BOX-8"
  end

  config.vm.provision "shell", inline: <<-SHELL
   sudo apt-get update -y
  SHELL
end
```

```
vagrant up
```

- You will get below output

```
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'virtualbox-ubuntu2004'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: VAGRANT-BOX-8
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 4000 (guest) => 8000 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: password
    default:
    default: Inserting generated public key within guest...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => D:/PACKER/UBUNTU-PACKER
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=900,gid=900,_netdev vagrant /vagrant

The error output from the command was:
```

```
vagrant ssh
```

```
$ vagrant ssh
==> default: The machine you're attempting to SSH into is configured to use
==> default: password-based authentication. Vagrant can't script entering the
==> default: password for you. If you're prompted for a password, please enter
==> default: the same password you have configured in the Vagrantfile.
Welcome to Ubuntu 18.04.1 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Tue Mar  5 03:59:03 2024
vagrant@vagrant:~$

vagrant@vagrant:~$ ls
VBoxGuestAdditions_6.1.22.iso  Yogi.txt
vagrant@vagrant:~$ cat Yogi.txt
Hi This is Yogi

```
