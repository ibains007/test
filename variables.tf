variable "ssh_pub_file" {
  type        = string
}

variable "ssh_key_file" {
  type        = string
}

variable "region" {
  type        = string
}

variable "ami_id" {
  type        = string
  default = "ami-071884cefc7e770ba"
}

variable "zone_id" {
  type      = string
  default   = "Z06924942AT5KS2GNNGTN" 
}