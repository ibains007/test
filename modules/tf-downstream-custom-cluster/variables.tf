variable "api_url" {
  type        = string
  description = "rancher2 api_url"
}

variable "rancher2_custom_cluster_name" {
  type        = string
  default     = "rancher2-custom-cluster"
}

variable "token_key" {
  type        = string
}

variable "rke_template_id" {
  type        = string
  description = "RKE Template id"
}

variable "rke_template_revisions_id" {
  type        = string
  description = "RKE Template Revisions id"
}


## cluster_monitoring_inputs ##

variable "enable_cluster_monitoring" {
  type        = bool
  description = "Enable the cluster monitoring"
  default     = true
}

variable "exporter_kubelets_https" {
  type        = bool
  description = "Exporter kubelets with https"
  default     = true
}

variable "exporter_node_enabled" {
  type        = bool
  description = "Exporter node enabled"
  default     = true
}

variable "exporter_node_ports_metrics_port" {
  type        = number
  description = "Exporter node metrics port number"
  default     = 9796
}

variable "exporter_node_resources_limits_cpu" {
  type        = string
  description = "Exporter node resources CPU limits"
  default     = "200m"
}

variable "exporter_node_resources_limits_memory" {
  type        = string
  description = "Exporter node resources Memory limits"
  default     = "200Mi"
}

variable "grafana_persistence_enabled" {
  type        = bool
  description = "Grafana persistence enabled"
  default     = false
}

variable "grafana_persistence_size" {
  type        = string
  description = "Grafana persistence size"
  default     = "10Gi"
}

variable "grafana_persistence_storageClass" {
  type        = string
  description = "Grafana persistence StorageClass"
  default     = "default"
}

variable "operator_resources_limits_memory" {
  type        = string
  description = "Pperator resources Memory limits"
  default     = "500Mi"
}

variable "prometheus_persistence_enabled" {
  type        = bool
  description = "Prometheus persistence enabled"
  default     = false
}

variable "prometheus_persistence_size" {
  type        = string
  description = "Prometheus persistence size"
  default     = "50Gi"
}

variable "prometheus_persistence_storageClass" {
  type        = string
  description = "Prometheus persistence StorageClass"
  default     = "default"
}

variable "prometheus_persistent_useReleaseName" {
  type        = bool
  description = "Prometheus persistence use ReleaseName"
  default     = true
}

variable "prometheus_resources_core_limits_cpu" {
  type        = string
  description = "Prometheus resources CPU Core limits"
  default     = "1000m"
}

variable "prometheus_resources_core_limits_memory" {
  type        = string
  description = "Prometheus resources Memory limits"
  default     = "1500Mi"
}

variable "prometheus_resources_core_requests_cpu" {
  type        = string
  description = "Prometheus resources CPU Core requestd"
  default     = "750m"
}

variable "prometheus_resources_core_requests_memory" {
  type        = string
  description = "Prometheus resources Memory requestd"
  default     = "750Mi"
}

variable "prometheus_retention" {
  type        = string
  description = "Prometheus retention hours"
  default     = "336h"
}

variable "node_selector" {
  description = "Monitoring node selector"
  default     = "role=tooling"
}

# Istio Inputs

variable "istio_ns_name" {
  type        = string
  description = "Istio namespace name"
  default     = "istio-system"
}

variable "istio_catalog_name" {
  type        = string
  description = "istio catalog name"
  default     = "system-library"
}

variable "istio_app_name" {
  type        = string
  description = "istio app name"
  default     = "cluster-istio"
}

variable "istio_template_name" {
  type        = string
  description = "istio template name"
  default     = "rancher-istio"
}

variable "certmanager_enabled" {
  type        = bool
  description = "certmanager enabled"
  default     = false
}

variable "enable_crds" {
  type        = bool
  description = "enableCRDs"
  default     = true
}

variable "galley_enabled" {
  type        = bool
  description = "galley enabled"
  default     = true
}

variable "gateways_enabled" {
  type        = bool
  description = "gateways enabled"
  default     = true
}

variable "gw_istio-ingressgw_limits_cpu" {
  type        = string
  description = "gateways istio-ingressgateway resources limits cpu"
  default     = "2000m"
}

variable "gw_istio-ingressgw_limits_memory" {
  type        = string
  description = "gateways istio-ingressgateway resources limits memory"
  default     = "1024Mi"
}

variable "gw_istio-ingressgw_requests_cpu" {
  type        = string
  description = "gateways istio-ingressgateway resources requests cpu"
  default     = "100m"
}

variable "gw_istio-ingressgw_requests_memory" {
  type        = string
  description = "gateways istio-ingressgateway resources requests memory"
  default     = "128Mi"
}

variable "gateways_istio-ingressgw_type" {
  type        = string
  description = "gateways istio-ingressgateway type"
  default     = "NodePort"
}

variable "global_monitoring_type" {
  type        = string
  description = "global monitoring type"
  default     = "cluster-monitoring"
}

variable "istio_cni_enabled" {
  type        = string
  description = "istio cni enabled"
  default     = "false"
}

variable "istiocoredns_enabled" {
  type        = string
  description = "istiocoredns enabled"
  default     = "false"
}

variable "kiali_enabled" {
  type        = string
  description = "kiali enabled"
  default     = "true"
}

variable "mixer_enabled" {
  type        = string
  description = "mixer enabled"
  default     = "true"
}

variable "mixer_policy_enabled" {
  type        = string
  description = "mixer policy enabled"
  default     = "true"
}

variable "mixer_policy_resources_limits_cpu" {
  type        = string
  description = "mixer policy resources limits cpu"
  default     = "4800m"
}

variable "mixer_policy_resources_limits_memory" {
  type        = string
  description = "mixer policy resources limits memory"
  default     = "4096Mi"
}

variable "mixer_policy_resources_requests_cpu" {
  type        = string
  description = "mixer policy resources requests cpu"
  default     = "1000m"
}

variable "mixer_policy_resources_requests_memory" {
  type        = string
  description = "mixer policy resources requests memory"
  default     = "1024Mi"
}

variable "mixer_telemetry_resources_limits_cpu" {
  type        = string
  description = "mixer telemetry resources limits cpu"
  default     = "4800m"
}

variable "mixer_telemetry_resources_limits_memory" {
  type        = string
  description = "mixer telemetry resources limits memory"
  default     = "4096Mi"
}

variable "mixer_telemetry_resources_requests_cpu" {
  type        = string
  description = "mixer telemetry resources requests cpu"
  default     = "1000m"
}

variable "mixer_telemetry_resources_requests_memory" {
  type        = string
  description = "mixer telemetry resources requests memory"
  default     = "1024Mi"
}

variable "mtls_enabled" {
  type        = bool
  description = "mtls enabled"
  default     = false
}

variable "nodeagent_enabled" {
  type        = bool
  description = "nodeagent enabled"
  default     = false
}

variable "pilot_enabled" {
  type        = bool
  description = "pilot enabled"
  default     = true
}

variable "pilot_resources_limits_cpu" {
  type        = string
  description = "pilot resources limits cpu"
  default     = "1000m"
}

variable "pilot_resources_limits_memory" {
  type        = string
  description = "pilot resources limits memory"
  default     = "4096Mi"
}

variable "pilot_resources_requests_cpu" {
  type        = string
  description = "pilot resources requests cpu"
  default     = "500m"
}

variable "pilot_resources_requests_memory" {
  type        = string
  description = "pilot resources requests memory"
  default     = "2048Mi"
}

variable "pilot_tracesampling" {
  type        = string
  description = "pilot traceSampling"
  default     = "1"
}

variable "security_enabled" {
  type        = bool
  description = "security enabled"
  default     = true
}

variable "sidecar_injector_webhook_enabled" {
  type        = bool
  description = "sidecarInjectorWebhook enabled"
  default     = true
}

variable "tracing_enabled" {
  type        = bool
  description = "tracing enabled"
  default     = true
}

variable "tracing_jaeger_resources_limits_cpu" {
  type        = string
  description = "tracing jaeger resources limits cpu"
  default     = "500m"
}

variable "tracing_jaeger_resources_limits_memory" {
  type        = string
  description = "tracing jaeger resources limits memory"
  default     = "1024Mi"
}

variable "tracing_jaeger_resources_requests_cpu" {
  type        = string
  description = "tracing jaeger resources requests cpu"
  default     = "100m"
}

variable "tracing_jaeger_resources_requests_memory" {
  type        = string
  description = "tracing jaeger resources requests memory"
  default     = "100Mi"
}

