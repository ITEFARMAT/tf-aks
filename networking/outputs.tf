output "kubernetes_subnet" {
  value         = azurerm_subnet.kubernetes_subnet
  sensitive     = true
}
output "virtual_gateway" {
  value         = azurerm_virtual_network_gateway.azure_virtual_network_gateway
}
