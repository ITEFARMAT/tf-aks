resource "azurerm_container_registry" "acr" {
  name                                 = var.container_registry_name
  resource_group_name                  = var.resource_group.name
  location                             = var.resource_group.location
  sku                                  = var.acr_sku
  admin_enabled                        = var.admin_user

  depends_on                           = [
     var.resource_group
  ]
}
