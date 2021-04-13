variable "kubernetes_namespace" {
  default  = "nginx"
  type     = any
}
variable "client_certificate" {
  type     = any
}
variable "cluster_ca_certificate" {
  type     = any
}
variable "kube_user" {
  type     = any
}
variable "kube_user_password" {
  type     = any
}
variable "host" {
  type     = any
}
variable "kube_config" {
  type     = any
}
variable "client_key" {
  type     = any
}
variable "nginx_ingress_minimum_count" {
  default  = "3"
  type     = string
}
variable "load_balancer_subnet" {
  default  = "kubernetes_subnet"
  type     = string
}
variable "nginx_namespace" {
  default  = "nginx"
  type     =  string
}
