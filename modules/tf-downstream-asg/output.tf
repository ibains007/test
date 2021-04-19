output "ec2_keypair" {
   value = aws_key_pair.rke_key_pair.key_name
}

output "launch-config-id" {
    value = aws_launch_configuration.launch-config.id
}

output "node_dependency" {
  value = null_resource.node_dependency_setter.id
}

output "cluster_id" {
    value = var.cluster_id
}