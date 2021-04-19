provider "rancher2" {
  api_url = var.api_url
  token_key = var.token_key
  insecure = true
}
terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
    }
  }
}
