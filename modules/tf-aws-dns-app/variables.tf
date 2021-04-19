
variable "zone_id" {
  type = string
  description = "The R53 zone in which to create the A records" 
}

variable "name" {
  type = string
  description = "Record name to be used" 
}

variable "value" {
  type = string
  description = "Record value to be used" 
}
