# Install cert-manager helm chart
resource "helm_release" "cert_manager" {
  depends_on = [
    kubernetes_job.create_cert_manager_ns,
  ]

  repository = "https://charts.jetstack.io"
  name       = "cert-manager"
  chart      = "cert-manager"
  version    = var.cert_manager.version
  namespace  = var.cert_manager.ns

  dynamic set {
    for_each = var.cert_manager.chart_set
    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}

# Install Rancher helm chart
resource "helm_release" "rancher_server" {
  depends_on = [
    kubernetes_job.create_cattle_system_ns,
    helm_release.cert_manager,
  ]

  repository = "https://releases.rancher.com/server-charts/${var.rancher_server.branch}"
  name       = "rancher"
  chart      = "rancher"
  version    = var.rancher_server.version
  namespace  = var.rancher_server.ns

  set {
    name  = "hostname"
    value = var.rancher_hostname
  }

  set {
    name  = "replicas"
    value = var.rancher_replicas
  }

  dynamic set {
    for_each = var.rancher_server.chart_set
    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}

resource "null_resource" "wait_for_rancher" {

  depends_on = [helm_release.rancher_server]
  provisioner "local-exec" {
    command = <<EOF
while [ "$${resp}" != "pong" ]; do
    echo "$${RANCHER_HOSTNAME}"
    resp=$(curl -sSk -m 2 "https://$${RANCHER_HOSTNAME}/ping")
    echo "Rancher Response: $${resp}"
    if [ "$${resp}" != "pong" ]; then
      sleep 10
    fi
done
EOF


    environment = {
      RANCHER_HOSTNAME = var.rancher_hostname
    }
  }
}

resource "rancher2_bootstrap" "admin" {
  provider = rancher2.bootstrap

  depends_on = [null_resource.wait_for_rancher]

  current_password = var.rancher_current_password
  password         = var.rancher_password
}
