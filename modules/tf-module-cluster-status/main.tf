resource "rancher2_cluster_sync" "custom_sync" {
  cluster_id =  var.cluster_id
  //wait_monitoring = rancher2_cluster.rancher2-custom-cluster.enable_cluster_monitoring
  //state_confirm = 12
}