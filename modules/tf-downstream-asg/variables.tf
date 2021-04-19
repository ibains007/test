variable "rke_instance_type" {
  type	      = string
  description = "EC2 instance type for RKE"
  default     = "t3.medium"
}

variable "rke_ami_name" {
  type        = string
  description = "EC2 AMI  image name"
}

variable "prefix" {
  type         = string
  description  = "Prefix added to names of all resources"
  default      = "kubernetes.io/cluster/"
}

variable "multi_az" {
  type        = bool
  description = "Deploy ASG across AZ's"
  default     = false 
}

variable "asg_count" {
  type         = number
  description  = "Control ASG count"
  default      = 3
}

variable "root_volume_size" {
  type         = number
  description  = "EC2 root volume size"
  default      = 16
}

variable "root_volume_type" {
  type         = string
  description  = "EC2 root volume type"
  default      = "gp2"
}

variable "root_volume_delete_on_termination" {
  type         = bool
  description  = "EC2 root volume deletion on termination"
  default      = true
}

variable "ssh_pub_file" {
  type        = string
  description = "SSH public key file path"
}


variable "rke_cluster_name" {
  type        = string
  description = "RKE cluster name"
  default     = "RKE_Cluster"
}

variable "rke_cluster_id" {
  type        = string
  description = "RKE cluster ID"
  default     = "C-3328"
}

variable "rke_control_node_command" {
  type        = string
  description = "RKE node joining command"
}

variable "rke_command_roles"{
  type        = string
  description = "RKE node joining roles"
  default     = "--etcd --controlplane"
}

variable "asg_prefix"{
  type        = string
  description = "RKE node name prefix"
  default     = "control"
}

variable "docker_version" {
  type        = string
  description = "Docker version"
  default     = "19.03"
}

variable "ec2_user" {
  type        = string
  description = "EC2 user name"
  default     = "ubuntu"
}

variable "aws_vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "aws_subnet_ids" {
  type        = list
  description = "VPC subnet id"
}

variable "asg_max_size" {
  type         = number
  description  = "Control ASG maximum size"
  default      = 1
}

variable "asg_min_size" {
  type         = number
  description  = "Control ASG minimum size"
  default      = 1
}

variable "asg_desired_capacity" {
  type         = number
  description  = "Control ASG desired capacity"
  default      = 1
}

variable "asg_healthcheck_type" {
  type         = string
  description  = "Control health check type"
  default      = "ELB"
}

variable "asg_name" {
  type        = string
  default     = "asg_control"
}

variable "control_sg_name" {
  type        = string
  default     = "control_sg"
}

variable "rke_launch_config_name" {
  type        = string
  default     = "rke_launch_config"
}

variable "rke_prefix" {
  type        = string
  default     = "demo"
} 

variable "instance_profile" {
  type        = string
  description    = "instance profile name"
}

variable "cluster_id" {
  type        = string
  default     = ""
}
