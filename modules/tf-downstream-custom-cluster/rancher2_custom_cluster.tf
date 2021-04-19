resource "rancher2_cluster" "rancher2-custom-cluster" {
  name = var.rancher2_custom_cluster_name
  cluster_template_id = var.rke_template_id
  cluster_template_revision_id = var.rke_template_revisions_id
  enable_cluster_monitoring = var.enable_cluster_monitoring
  cluster_monitoring_input {
    answers = {
      "exporter-kubelets.https" = var.exporter_kubelets_https
      "exporter-node.enabled" = var.exporter_node_enabled
      "exporter-node.ports.metrics.port" = var.exporter_node_ports_metrics_port
      "exporter-node.resources.limits.cpu" = var.exporter_node_resources_limits_cpu
      "exporter-node.resources.limits.memory" = var.exporter_node_resources_limits_memory
      "grafana.persistence.enabled" = var.grafana_persistence_enabled
      "grafana.persistence.size" = var.grafana_persistence_size
      "grafana.persistence.storageClass" = var.grafana_persistence_storageClass
      "operator.resources.limits.memory" = var.operator_resources_limits_memory
      "prometheus.persistence.enabled" = var.prometheus_persistence_enabled
      "prometheus.persistence.size" = var.prometheus_persistence_size
      "prometheus.persistence.storageClass" = var.prometheus_persistence_storageClass
      "prometheus.persistent.useReleaseName" = var.prometheus_persistent_useReleaseName
      "prometheus.resources.core.limits.cpu" = var.prometheus_resources_core_limits_cpu,
      "prometheus.resources.core.limits.memory" = var.prometheus_resources_core_limits_memory
      "prometheus.resources.core.requests.cpu" = var.prometheus_resources_core_requests_cpu
      "prometheus.resources.core.requests.memory" = var.prometheus_resources_core_requests_memory
      "prometheus.retention" = var.prometheus_retention
    }
  }
}


