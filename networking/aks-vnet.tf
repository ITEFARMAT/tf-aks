resource "azurerm_virtual_network" "kubernetes_vnet" {
  name                            = var.kubernetes_vnet_name
  resource_group_name             = var.resource_group.name
  location                        = var.resource_group.location
  address_space                   = [var.cidr]
  tags = {
      enviroment                  = ""
  }
  depends_on                      = [
    var.resource_group
  ]
}
