##############################################################################
# Packer Virtualbox-iso documentation: 
# Prepared by YOGI
# https://developer.hashicorp.com/packer/plugins/builders/virtualbox/iso
##############################################################################
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

packer {
  required_plugins {
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = ">= 1.0.5"
    }
    vagrant = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "virtualbox-iso" "ubuntu-22043-server" {
    boot_command = [
        "e<wait>",
        "<down><down><down>",
        "<end><bs><bs><bs><bs><wait>",
        "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
        "<f10><wait>"
      ]
  boot_wait               = "5s"
  disk_size               = 35000
  guest_additions_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
  guest_os_type           = "Ubuntu_64"
  http_directory          = "subiquity/http"
  http_port_max           = 9200
  http_port_min           = 9001
  firmware                = "efi"
  hard_drive_interface    = "virtio"
  rtc_time_base           = "UTC"
  # https://www.virtualbox.org/manual/ch06.html
  nic_type                = "virtio"
  iso_checksum            = ["${var.iso_checksum}"]
  iso_urls                = ["${var.iso_url}"]
  shutdown_command        = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_username            = "vagrant"
  ssh_password            = "${var.user-ssh-password}"
  ssh_timeout             = "30m"
  cpus                    = 2
  memory                  = "${var.memory_amount}"
  # Change to --nat-localhostreachable1 forced by https://github.com/hashicorp/packer/issues/12118
  vboxmanage              = [["modifyvm", "{{.Name}}", "--nat-localhostreachable1", "on"]]
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "Yogi-server"
  headless                = "${var.headless_build}"
}

build {
  sources = ["source.virtualbox-iso.ubuntu-22043-server"]

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
    output              = "${var.build_artifact_location}{{ .BuildName }}-${local.timestamp}.box"
  }
}
