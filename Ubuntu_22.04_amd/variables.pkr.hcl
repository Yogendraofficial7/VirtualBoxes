variable "headless_build" {
  type =  bool
  default = false
}

variable "memory_amount" {
  type =  string
  default = "4096"
}

  variable "user-ssh-password" {
  type = string
  sensitive = true
  default = "vagrant"
}
  
variable "build_artifact_location" {
 
 # If building on your local laptop use the ../build path
  type = string
  default = "../build/"
}

variable "iso_checksum" {
  type = string
  default = "45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
}

variable "iso_url" {
  type = string 
  default = "http://mirrors.edge.kernel.org/ubuntu-releases/22.04.3/ubuntu-22.04.3-live-server-amd64.iso"
}

variable "db_user" {
    type = string
    default = "yogi"
}

variable "db_pass" {
  type = string
  sensitive = true
  default = "yogi"
}
