variable "cluster_name" {
  default  = "-k8s-dev-cluster"
  type     = string
}
variable "default_user" {
  default  = ""
  type     = string
}
variable "max_count" {
  default  = "12"
  type     = string
}
variable "max_pods" {
  default  = "50"
  type     = string
}
variable "cidr" {
  default  = "10.3.0.0/16"
  type     = string
}
variable "service_principal_id" {
  type     = string
}
variable "service_principal_secret" {
  type     = string
}
variable "ssh_key_data" {
  type     = string
}
variable "container_registry_name" {
  default  = "ContainerRegistry1"
  type     = string
}
variable "acr_sku" {
  default  = "Basic"
  type     = string
}
variable "admin_user" {
  default  = "true"
  type     = string
}
variable "dns_preffix" {
  default  = "kubernetes-dev"
  type     = string
}
variable "kubernetes_version" {
  default  = "1.15.10"
  type     = string
}
variable "pool_profile_name" {
  default  = "workers"
  type     = string
}
variable "auto_scaling" {
  default  = "true"
  type     = string
}
variable "min_count" {
  default  = "3"
  type     = string
}
variable "vm_size" {
  default  = "Standard_D3_v2"
  type     = string
}
variable "os_disk_size_gb" {
  default  = "40"
  type     = string
}
variable "type" {
  default  = "VirtualMachineScaleSets"
  type     = string
}
variable "network_plugin" {
  default  = "azure"
  type     = string
}
variable "network_policy" {
  default  = "calico"
  type     = string
}
variable "kubernetes_vnet_name" {
  default = "kubernetes_vnet"
  type    = string
}
variable "kubernetes_subnet_name" {
  default = "kubernetes_subnet"
  type    = string
}
variable "kubernetes_subnet_address_space" {
  default = "10.3.1.0/24"
  type    = string
}
variable "gateway_subnet_name" {
  default  = "GatewaySubnet"
  type     = string
}
variable "azure_gateway_subnet_address_space" {
  default  = "10.3.2.0/24"
  type     = string
}
variable "public_ip_1_name" {
  default  = "azure_to_aws_gateway_public_ip_1"
  type     = string
}
variable "virtual_network_gateway_name" {
  default  = "azure_to_aws_vnet_gateway"
  type     = string
}
variable "aws_vpn_connection_tunnel1_address" {
  type        = string
}
variable "aws_vpc_cidr" {
  default  = "10.0.0.0/16"
  type     = string
}
variable "aws_vpn_connection_tunnel2_address" {
  type        = string
}
variable "tunnel1_name" {
  default  = "local-azure-to-aws-tunnel1"
  type     = string
}
variable "tunnel1_gateway_name" {
  default  = "gateway-azure-to-aws-tunnel1-connection"
  type     = string
}
variable "tunnel2_name" {
  default  = "local-azure-to-aws-tunnel2"
  type     = string
}
variable "tunnel2_gateway_name" {
  default  = "gateway-azure-to-aws-tunnel2-connection"
  type     = string
}
variable "tunnel1_shared_key" {
  type        = string
}
variable "tunnel2_shared_key" {
  type        = string
}
variable "nginx_ingress_minimum_count" {
  default  = "3"
  type     = string
}
variable "load_balancer_subnet" {
  default   = "kubernetes_subnet"
  type      = string
}
variable "nginx_namespace" {
  default    = "nginx"
  type       =  string
}
