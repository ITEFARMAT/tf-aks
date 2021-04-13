provider "kubernetes" {

  load_config_file                   = false
  host                               = var.host
  client_certificate                 = base64decode(var.client_certificate)
  client_key                         = base64decode(var.client_key)
  cluster_ca_certificate             = base64decode(var.cluster_ca_certificate)
  username                           = var.kube_user
  password                           = var.kube_user_password
}
resource "kubernetes_namespace" "nginx-ingress" {
  metadata {
    name                             = "nginx"
  }
  depends_on                         = [
    var.host
    ]
}
