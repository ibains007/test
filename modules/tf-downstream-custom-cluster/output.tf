output "token" {
  value = rancher2_cluster.rancher2-custom-cluster.cluster_registration_token.0.node_command
}

output "cluster_id" {
  value = rancher2_cluster.rancher2-custom-cluster.cluster_registration_token.0.cluster_id
}

output "custom_cluster_kube_config" {
  //value = rancher2_cluster_sync.custom_sync.kube_config
  value = rancher2_cluster.rancher2-custom-cluster.kube_config
}

output "custom_cluster_rke_config" {
  value = rancher2_cluster.rancher2-custom-cluster.rke_config
}

