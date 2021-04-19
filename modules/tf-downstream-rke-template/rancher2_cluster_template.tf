resource "rancher2_cluster_template" "RKE_Template" {
  name = "RKE_Template"
  members {
    access_type = var.access_type
  }
  template_revisions {
    name = "RKE Template Version-1"
    cluster_config {
      rke_config {

      kubernetes_version = var.kubernetes_version

      ingress {

        provider = var.ingress_provider
      }
      
      monitoring {

        provider = var.monitoring_provider
        replicas = var.monitoring_replicas
      }

      network {
        plugin = var.network_plugin
      }

      cloud_provider {
        name = var.cloud_provider_name
      }

      services {
        etcd {
          creation = var.etcd_creation_time
          retention = var.etcd_retention_time
        }

        kube_api {
          service_node_port_range = var.kube_api_port_range
        }

      }
      }
    }
    default = true
  }
  description = "RKE cluster template"
}
