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
  default = ""
  }
  
variable "build_artifact_location" {
 
 # If building on your local laptop use the ../build path
  type = string
  default = "../build/"

}

variable "iso_checksum" {
  type = string
  default = "24a062ff94859bf14bfed788f2530b9522bda718b62656f7853af3d78d5fdd07"
}

variable "iso_url" {
  type = string 
  default = "https://cdimage.ubuntu.com/ubuntu-server/daily-live/current/noble-live-server-amd64.iso"
}
