provider "helm" {
  kubernetes {

  load_config_file              = false
  host                          = var.host
  client_certificate            = base64decode(var.client_certificate)
  client_key                    = base64decode(var.client_key)
  cluster_ca_certificate        = base64decode(var.cluster_ca_certificate)
  username                      = var.kube_user
  password                      = var.kube_user_password
  }

}

resource "helm_release" "nginx-ingress-controler" {
  name                          = "nginx-ingress-controler"
  chart                         = "stable/nginx-ingress"

  namespace                     = var.nginx_namespace
  set {
    name                        = "controller.autoscaling.minReplicas"
    value                       = var.nginx_ingress_minimum_count
  }
  set {
    name                        = "controller.nodeSelector.\\beta\\.kubernetes\\.io/os"
    value                       = "linux"
  }
  set {
    name                        = "defaultBackend.nodeSelector.\\beta\\.kubernetes\\.io/os"
    value                       = "linux"
  }
  set {
    name                        = "service.beta.kubernetes.io/azure-load-balancer-internal"
    value                       = "true"
  }
  set {
    name                        = "service.beta.kubernetes.io/azure-load-balancer-internal-subnet"
    value                       = var.load_balancer_subnet
  }

  depends_on                    = [
  var.kubernetes_namespace
  ]

}
