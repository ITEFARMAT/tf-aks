resource "azurerm_resource_group" "rg" {
  name                               = var.resource_group_name
  location                           = var.region

  tags = {
    environment = "K8S, RTA"
  }
}
# User Assigned Identities
resource "azurerm_user_assigned_identity" "k8s-identity" {
  resource_group_name                = azurerm_resource_group.rg.name
  location                           = azurerm_resource_group.rg.location

  name                               = "k8s-ingress-identity"
}
