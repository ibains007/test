
resource "null_resource" "wait_for_cluster" {

  provisioner "local-exec" {
    command = <<EOF
        until kubectl get cs; do 
          sleep 10    
        done
        EOF

    }
}

resource "kubernetes_deployment" "app" {
  depends_on = [null_resource.wait_for_cluster]

  lifecycle {
    ignore_changes = [
      metadata[0].annotations
    ]
  }
  metadata {
    name    = var.deployment_name
    labels  = var.labels
  }

  spec {
    replicas = 3
    selector {
      match_labels = var.labels
    }

    template {
      metadata {
        labels = var.labels
      }

      spec {
        container {
          image = var.image
          name  = var.deployment_name

          resources {
            limits = var.resource_limits
            requests = var.resource_requests
          }
        }
      }
    }
  }
}