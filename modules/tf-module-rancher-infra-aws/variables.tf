# Variables for AWS infrastructure module


variable "aws_region" {
  type        = string
  description = "AWS region used for all resources"
  default     = "us-east-1"
}

variable "route53_zone" {
  type        = string
  description = "AWS route53 zone"
  default     = ""
}

variable "route53_name" {
  type        = string
  description = "AWS route53 domain name"
  default     = "rancher"
}

variable "deploy_lb" {
  type        = bool
  description = "Deploy AWS nlb in front of worker nodes"
  default     = false
}

variable "prefix" {
  type        = string
  description = "Prefix added to names of all resources"
  default     = "rancher-infra-aws"
}

variable "node_master_count" {
  type        = number
  description = "Master nodes count"
  default     = 0
}

variable "node_worker_count" {
  type        = number
  description = "Worker nodes count"
  default     = 0
}

variable "node_all_count" {
  type        = number
  description = "All roles nodes count"
  default     = 1
}

variable "node_username" {
  type        = string
  description = "Instance type used for all EC2 instances"
  default     = "ubuntu"
}

variable "instance_type" {
  type        = string
  description = "Instance type used for all EC2 instances"
  default     = "t3.large"
}

variable "roles" {
   type        = string
   default     = "controlplane,etcd,worker"
}

variable "ami_id" {
  type        = string
  description = "AMI_ ID to use"
  default = "ami-071884cefc7e770ba"
}

variable "docker_version" {
  type        = string
  description = "Docker version to install on nodes"
  default     = "19.03"
}

variable "ssh_key_file" {
  type        = string
  description = "File path and name of SSH private key used for infrastructure"
  default     = "~/.ssh/id_rsa"
}

variable "ssh_pub_file" {
  type        = string
  description = "File path and name of SSH public key used for infrastructure"
  default     = ""
}

variable "register_command" {
  type        = string
  description = "Register command for nodes"
  default     = ""
}

variable "user_data" {
  type = string
  description = "AWS vm's userdata to cloud-init"
  default = ""
}
