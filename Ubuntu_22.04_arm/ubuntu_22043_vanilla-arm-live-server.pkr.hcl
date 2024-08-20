##############################################################################
# Packer Virtualbox-iso documentation: 
# Prepared by YOGI
# https://developer.hashicorp.com/packer/plugins/builders/virtualbox/iso
##############################################################################
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

# https://github.com/Parallels/packer-plugin-parallels
# This is the init block needed to initialize the plugin
packer {
  required_plugins {
    parallels = {
      version = "> 1.1.0"
      source  = "github.com/Parallels/parallels"
    }
    vagrant = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}


source "parallels-iso" "vanilla-server" {
  # https://github.com/chef/bento/blob/main/packer_templates/ubuntu/ubuntu-20.04-arm64.json
  # For 20.04 Ubuntu Server
  #boot_command          = ["<esc>", "linux /casper/vmlinuz"," quiet"," autoinstall"," ds='nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/'","<enter>","initrd /casper/initrd <enter>","boot <enter>"]
  # For 22.04 Ubuntu Server
  boot_command          = ["<esc>", "c", "linux /casper/vmlinuz"," quiet"," autoinstall"," ds='nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/'","<enter>","initrd /casper/initrd <enter>","boot <enter>"]
  boot_wait               = "5s"
  disk_size               = 15000
  parallels_tools_flavor  = "lin"
  guest_os_type           = "ubuntu"
  hard_drive_interface    = "sata"
  http_directory          = "subiquity/http"
  http_port_max           = 9200
  http_port_min           = 9001
  iso_checksum            = ["${var.iso_checksum}"]
  iso_urls                = ["${var.iso_url}"] 
  shutdown_command        = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_wait_timeout        = "1800s"
  ssh_password            = "${var.SSHPW}"
  ssh_timeout             = "20m"
  ssh_username            = "vagrant"
  parallels_tools_mode    = "upload"
  ssh_handshake_attempts  = "300"
  # Hint to fix the problem of "initramfs unpacking failed" error
  # https://askubuntu.com/questions/1269855/usb-installer-initramfs-unpacking-failed-decoding-failed]
  memory                  = "${var.memory_amount}"
  prlctl                  = [["set", "{{.Name}}", "--bios-type", "efi-arm64" ]]
  prlctl_version_file     = ".prlctl_version"
  vm_name                 = "ubuntu-server-vanilla"
}

build {
  sources = ["source.parallels-iso.vanilla-server"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -E -S sh '{{ .Path }}'"
    script          = "../Scripts/Post_Install_Packages.sh"
 
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -E -S sh '{{ .Path }}'"
    script          = "../Scripts/Post_Install_Samba.sh"
 
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -E -S sh '{{ .Path }}'"
    script          = "../Scripts/Post_Install_Vagrant.sh"
 
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -E -S sh '{{ .Path }}'"
    script          = "../Scripts/Post_Install_Vagrant-Database.sh"
    environment_vars = ["DBUSER=${var.db_user}","DBPASS=${var.db_pass}"]

  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -E -S sh '{{ .Path }}'"
    script          = "../Scripts/Post_Install_Mongo4.2.sh"
 
  }

  post-processor "vagrant" {
    keep_input_artifact = false
    output              = "${var.build_artifact_location}{{ .BuildName }}-arm.box"
  }
}
