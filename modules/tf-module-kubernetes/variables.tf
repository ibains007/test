variable "deployment_name" {
  type         = string
  default      = "notejam"
}

variable "labels" {
    type        = map
    default     = {
        app =  "notejam"
    } 
}

variable "replicas" {
  type    = number
  default = 1 
}

variable "image" {
  type    = string
  default = "ibains007/notejam:v1.0"
}

variable "resource_limits" {
    type        = map
    default     = {
        cpu =  "0.5"
        memory = "512Mi"
    } 
}

variable "resource_requests" {
    type        = map
    default     = {
        cpu =  "250m"
        memory = "50Mi"
    } 
}

variable "kube_config" {
  type        = string
  description     = "Kube Config file for provider"
  default = "./ds_kube_config"
}

