# Outputs

output "rancher_server_url" {
  value = "https://${var.rancher_hostname}"
}

output "rancher_admin_token" {
  value = rancher2_bootstrap.admin.token
}
