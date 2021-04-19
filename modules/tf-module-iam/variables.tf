variable "K8sMasterRole_name" {
  type         = string
  default      = "K8sMasterRole"
}

variable "K8sMasterProfile_name" {
  type         = string
  default      = "K8sMasterProfile"
}
variable "control_profile_name" {
  type         = string
  default      = "control_profile"
}

variable "worker_profile_name" {
  type         = string
  default      = "worker_profile"
}

variable "K8sWorkerProfile_name" {
  type	      = string
  default     = "K8sWorkerProfile"
}

variable "K8sWorkerRole_name" {
  type	      = string
  default     = "K8sWorkerRole"
}

variable "K8sAutoscalerProfile_name" {
  type         = string
  default      = "K8sAutoscalerProfile"
}