variable "rke_nodes" {
  type = list(object({
    public_ip = string
    private_ip = string
    hostname = string
    roles = list(string)
    user = string
    ssh_key = string
  }))
  description = "Node info to install RKE cluster"
}

variable "zone_id" {
  type = string
  description = "The R53 zone in which to create the A records" 
}