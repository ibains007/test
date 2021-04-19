output "nodeport" {
    value = kubernetes_service.notejam.spec.0.port.0.node_port
}

output "lb_fqdn" {
    value = kubernetes_service.notejam.status.0.load_balancer.0.ingress.0.hostname
}