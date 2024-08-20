variable "memory_amount" {
  type =  string
  default = "4096"
}

variable "SSHPW" {
  sensitive = true
  type = string
  default = "vagrant"
}

variable "build_artifact_location" {
  type = string
  default = "../build/"
}

variable "iso_checksum" {
  type = string
  default = "74b8a9f71288ae0ac79075c2793a0284ef9b9729a3dcf41b693d95d724622b65"
}

variable "iso_url" {
  type = string 
  default = "https://cdimage.ubuntu.com/releases/22.04.3/release/ubuntu-22.04.3-live-server-arm64.iso"
}
