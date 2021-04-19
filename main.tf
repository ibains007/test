###############################################################################
# main.tf                                                                     #
#                                                                             #
# This file defines the terraform configuration and generic configuration.    #
#                                                                             #
###############################################################################

terraform {
  required_version = "~> 0.14.10" 
  backend s3 {
    bucket  = "ibains007"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
  }
  required_providers {
      rke = {
      source = "rancher/rke"
    }
    aws = {
      source = "hashicorp/aws"
    }
    null = {
      source = "hashicorp/null"
    }
    
    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    rancher2 = {
      source = "rancher/rancher2"
    }

  }
}

provider "aws" {
  region                  = "eu-west-2"
}

provider "rke" {

}

provider "kubernetes"{

}

module "rancher_infra" {
  source = "./modules/tf-module-rancher-infra-aws"
  aws_region = var.region
  ami_id=var.ami_id
  ssh_pub_file = var.ssh_pub_file
  ssh_key_file = var.ssh_key_file
}

module "rancher_dns" {
  source = "./modules/tf-aws-dns"
  rke_nodes = module.rancher_infra.rancher_nodes
  zone_id = var.zone_id
}

module "iam" {
  source = "./modules/tf-module-iam"

}

module "rke-cluster" {
  source = "./modules/tf-module-rke-cluster"
  rke_nodes = module.rancher_infra.rancher_nodes
  rke = {
    cluster_name = "rancher"
    kubernetes_version = "v1.17.5-rancher1-1"
  }
}

module "rancher_server" {
  source = "./modules/tf-module-rancher-server"

  rancher_hostname = "rancher.aws.indyinc.co.uk"
  rancher_k8s = {
    host = module.rke-cluster.kubeconfig_api_server_url
    client_certificate     = module.rke-cluster.kubeconfig_client_cert
    client_key             = module.rke-cluster.kubeconfig_client_key
    cluster_ca_certificate = module.rke-cluster.kubeconfig_ca_crt
  }
}

module "downstream-rke-template" {
  source = "./modules/tf-downstream-rke-template"
  api_url = "${module.rancher_server.rancher_server_url}/v3"
  token_key = module.rancher_server.rancher_admin_token  
}

module "downstream-custom-cluster" {
  source = "./modules/tf-downstream-custom-cluster"
  api_url = "${module.rancher_server.rancher_server_url}/v3"
  token_key = module.rancher_server.rancher_admin_token 
  rke_template_id = module.downstream-rke-template.rke_template_id
  rke_template_revisions_id = module.downstream-rke-template.rke_template_revisions_id
}

module "downstream-control-asg" {
  source = "./modules/tf-downstream-asg"
  aws_vpc_id = module.rancher_infra.vpc_id
  aws_subnet_ids = module.rancher_infra.subnet_ids
  rke_control_node_command = module.downstream-custom-cluster.token
  ssh_pub_file = var.ssh_pub_file
  rke_ami_name = var.ami_id
  instance_profile = module.iam.control_instance_profile
  cluster_id = module.downstream-custom-cluster.cluster_id
}


module "downstream-worker-asg" {
  source = "./modules/tf-downstream-asg"
  aws_vpc_id = module.rancher_infra.vpc_id
  aws_subnet_ids = module.rancher_infra.subnet_ids
  rke_control_node_command = module.downstream-custom-cluster.token
  ssh_pub_file = var.ssh_pub_file
  rke_ami_name = var.ami_id
  rke_command_roles = "--worker"
  rke_prefix = "worker"
  asg_name = "worker"
  asg_count = 1
  asg_min_size = 2
  asg_desired_capacity = 2
  asg_max_size = 3
  asg_prefix = "worker"
  instance_profile = module.iam.worker_instance_profile
  multi_az = true
}

resource "local_file" "kubeconfig" {
  lifecycle {
    ignore_changes = [content]
  }

  filename = "./kubeconfig"
  content  = module.rke-cluster.kubeconfig_yaml
}

/*
module "cluster_status" {
  source = "./modules/tf-module-cluster-status"
  api_url = "${module.rancher_server.rancher_server_url}/v3"
  token_key = module.rancher_server.rancher_admin_token
  dependencies = module.downstream-worker-asg.node_dependency
  cluster_id = module.downstream-control-asg.cluster_id
}
*/

resource "local_file" "downstream_kubeconfig" {
  lifecycle {
    ignore_changes = [content]
  }

  filename = "./ds_kubeconfig"
  //content  = module.cluster_status.custom_cluster_kube_config
  content  = module.downstream-custom-cluster.custom_cluster_kube_config
}

module "notejam_deployment" {
  source = "./modules/tf-module-kubernetes"
  kube_config = local_file.downstream_kubeconfig.filename
  
}

module "app_dns" {
  source = "./modules/tf-aws-dns-app"
  zone_id = var.zone_id
  name = "notejam"
  value = module.notejam_deployment.lb_fqdn
}

