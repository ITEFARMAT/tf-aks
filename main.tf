module "resource_group" {
  source = "./resource_group"
}

module "networking" {
  source = "./networking"

  kubernetes_vnet_name               = var.kubernetes_vnet_name
  cidr                               = var.cidr
  kubernetes_subnet_name             = var.kubernetes_subnet_name
  kubernetes_subnet_address_space    = var.kubernetes_subnet_address_space
  gateway_subnet_name                = var.gateway_subnet_name
  azure_gateway_subnet_address_space = var.azure_gateway_subnet_address_space
  public_ip_1_name                   = var.public_ip_1_name
  virtual_network_gateway_name       = var.virtual_network_gateway_name
  aws_vpn_connection_tunnel1_address = var.aws_vpn_connection_tunnel1_address
  aws_vpc_cidr                       = var.aws_vpc_cidr
  aws_vpn_connection_tunnel2_address = var.aws_vpn_connection_tunnel2_address
  tunnel1_name                       = var.tunnel1_name
  tunnel1_gateway_name               = var.tunnel1_gateway_name
  tunnel2_name                       = var.tunnel2_name
  tunnel2_gateway_name               = var.tunnel2_gateway_name
  tunnel1_shared_key                 = var.tunnel1_shared_key
  tunnel2_shared_key                 = var.tunnel2_shared_key

  # auto generated
  resource_group                     = module.resource_group.resource_group

}

module "azure-container-registry" {
  source = "./acr"

  container_registry_name           = var.container_registry_name
  acr_sku                           = var.acr_sku
  admin_user                        = var.admin_user

  # auto generated
  resource_group                    = module.resource_group.resource_group
}

module "k8s-azure" {
  source = "./k8s"

  cluster_name                     = var.cluster_name
  dns_preffix                      = var.dns_preffix
  kubernetes_version               = var.kubernetes_version
  pool_profile_name                = var.pool_profile_name
  auto_scaling                     = var.auto_scaling
  vm_size                          = var.vm_size
  os_disk_size_gb                  = var.os_disk_size_gb
  type                             = var.type
  default_user                     = var.default_user
  network_plugin                   = var.network_plugin
  network_policy                   = var.network_policy
  ssh_key_data                     = var.ssh_key_data
  service_principal_id             = var.service_principal_id
  service_principal_secret         = var.service_principal_secret
  min_count                        = var.min_count
  max_count                        = var.max_count
  max_pods                         = var.max_pods

  # auto generated
  resource_group                   = module.resource_group.resource_group
  kubernetes_subnet                = module.networking.kubernetes_subnet
  virtual_gateway                  = module.networking.virtual_gateway
}

module "create-namespace" {
  source = "./k8s_namespace"

  # auto generated
  host                            = module.k8s-azure.host
  client_key                      = module.k8s-azure.client_key
  client_certificate              = module.k8s-azure.client_certificate
  kube_config                     = module.k8s-azure.kube_config
  cluster_ca_certificate          = module.k8s-azure.cluster_ca_certificate
  kube_user                       = module.k8s-azure.kube_user
  kube_user_password              = module.k8s-azure.kube_user_password

}

module "helm-install" {
  source = "./helm"

  load_balancer_subnet           = var.load_balancer_subnet
  nginx_ingress_minimum_count    = var.nginx_ingress_minimum_count

  # auto generated
  host                           = module.k8s-azure.host
  client_key                     = module.k8s-azure.client_key
  client_certificate             = module.k8s-azure.client_certificate
  kube_config                    = module.k8s-azure.kube_config
  cluster_ca_certificate         = module.k8s-azure.cluster_ca_certificate
  kube_user                      = module.k8s-azure.kube_user
  kube_user_password             = module.k8s-azure.kube_user_password
  kubernetes_namespace           = module.create-namespace.kubernetes_namespace
}
