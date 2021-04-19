output "rke_template_id" {
  value = rancher2_cluster_template.RKE_Template.id
}

output "rke_template_revisions_id" {
  value = rancher2_cluster_template.RKE_Template.template_revisions.0.id
}
