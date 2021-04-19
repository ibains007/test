variable "api_url" {
  type        = string
  description = "rancher2 api_url"
}

variable "rancher2_custom_cluster_name" {
  type        = string
  default     = "rancher2-custom-cluster"
}

variable "token_key" {
  type        = string
}

variable "cluster_id" {
  type        = string
}

variable "dependencies" {
}

output "custom_cluster_kube_config" {
  value = rancher2_cluster_sync.custom_sync.kube_config
}