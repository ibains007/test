resource "kubernetes_service" "notejam" {
  lifecycle {
    ignore_changes = [
      metadata[0].annotations
    ]
  }
  metadata {
    name = var.deployment_name
    //annotations = {
    //  "service.beta.kubernetes.io/aws-load-balancer-type": "nlb"
    //}
  }

  
  spec {
    selector = {
      app = kubernetes_deployment.app.metadata.0.labels.app
    }
    //session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}