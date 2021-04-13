output "kubernetes_namespace" {
  value        = kubernetes_namespace.nginx-ingress
  sensitive    = true
}
