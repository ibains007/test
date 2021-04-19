# Kubernetes provider
terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    rancher2 = {
      source = "rancher/rancher2"
    }
  }
}

provider "kubernetes" {

  host = var.rancher_k8s.host
  client_certificate     = var.rancher_k8s.client_certificate
  client_key             = var.rancher_k8s.client_key
  cluster_ca_certificate = var.rancher_k8s.cluster_ca_certificate

}

# Helm provider
provider "helm" {

  kubernetes {
    host = var.rancher_k8s.host
    client_certificate     = var.rancher_k8s.client_certificate
    client_key             = var.rancher_k8s.client_key
    cluster_ca_certificate = var.rancher_k8s.cluster_ca_certificate

  }
}

# Rancher provider
provider "rancher2" {
  alias     = "bootstrap"
  api_url   = "https://${var.rancher_hostname}"
  bootstrap = true
  insecure  = true
}
