variable "api_url" {
  type        = string
  description = "rancher2 api_url"
}

variable "token_key" {
  type        = string
}

variable "access_type" {
  type        = string
  description = "rancher members's access_type"
  default     = "owner"
}

variable "user_principal_id" {
  type        = string
  description = "rancher members's user_principal_id"
  default     = "local://"
}

variable "kubernetes_version" {
  type        = string
  description = "kubernetes_version"
  default     = "v1.18.17-rancher1-1"
}

variable "ingress_provider" {
  type        = string
  description = "ingress_provider"
  default     = "nginx"
}

variable "kube_api_port_range" {
  type        = string
  description = "kube api port range"
  default     = "30000-32767"
}

variable "monitoring_provider" {
  type        = string
  description = "monitoring provider"
  default     = "metrics-server"
}

variable "monitoring_replicas" {
  type        = number
  description = "Number of monitoring replicas"
  default     = 1
}

variable "network_plugin" {
  type        = string
  description = "network plugin's name"
  default     = "canal"
}

variable "cloud_provider_name" {
  type        = string
  description = "cloud provider name"
  default     = "aws"
}

variable "etcd_creation_time" {
  type        = string
  description = "etcd creation time in hours"
  default     = "6h"
}

variable "etcd_retention_time" {
  type        = string
  description = "etcd retention time in hours"
  default     = "24h"
}

variable "etcd_backup_interval" {
  type        = number
  description = "etcd backup interval"
  default     = 12
}

variable "etcd_backup_retention" {
  type        = number
  description = "etcd backup retention"
  default     = 6
}

