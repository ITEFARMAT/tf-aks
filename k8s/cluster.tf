resource "azurerm_kubernetes_cluster" "developers_cluster" {
  name                                = var.cluster_name
  location                            = var.resource_group.location
  resource_group_name                 = var.resource_group.name
  dns_prefix                          = var.dns_preffix
  kubernetes_version                  = var.kubernetes_version


  default_node_pool {
    name                              = var.pool_profile_name
    enable_auto_scaling               = var.auto_scaling
    min_count                         = var.min_count
    max_count                         = var.max_count
    max_pods                          = var.max_pods
    vm_size                           = var.vm_size
    os_disk_size_gb                   = var.os_disk_size_gb
    type                              = var.type

    vnet_subnet_id                    = var.kubernetes_subnet.id
  }


  linux_profile {
    admin_username                    = var.default_user

    ssh_key {
      key_data                        = var.ssh_key_data
    }
  }

  service_principal {
    client_id                         = var.service_principal_id
    client_secret                     = var.service_principal_secret
  }

  tags = {
    environment                       = "developement"
    network                           = "default"
    service                           = "kubernetes"
  }

  network_profile {
    network_plugin                    = var.network_plugin
    network_policy                    = var.network_policy
  }

  depends_on                          = [
     var.resource_group,
     var.virtual_gateway
  ]
}
