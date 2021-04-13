resource "azurerm_network_security_group" "kubernetes" {
    name                         = var.kubernetes_nsg_name
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name

    tags = {
        environment              = "developement"
        subnet                   = "kubernetes"
    }

}
