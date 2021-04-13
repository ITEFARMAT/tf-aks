# Tunnel from Azure to AWS vpn_connection_1 (tunnel1)
resource "azurerm_local_network_gateway" "local_network_gateway_1_tunnel1" {
  name                                                  = var.tunnel1_name
  location                                              = var.resource_group.location
  resource_group_name                                   = var.resource_group.name
  # AWS VPN Connection public IP address
  gateway_address                                       = var.aws_vpn_connection_tunnel1_address
  # AWS VPC CIDR
  address_space                                         = [var.aws_vpc_cidr]
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_1_tunnel1" {
  name                                                  = var.tunnel1_gateway_name
  location                                              = var.resource_group.location
  resource_group_name                                   = var.resource_group.name
  type                                                  = "IPsec"
  virtual_network_gateway_id                            = azurerm_virtual_network_gateway.azure_virtual_network_gateway.id
  local_network_gateway_id                              = azurerm_local_network_gateway.local_network_gateway_1_tunnel1.id
  shared_key                                            = var.tunnel1_shared_key

  depends_on                                            = [azurerm_virtual_network_gateway.azure_virtual_network_gateway]
}
# Tunnel from Azure to AWS vpn_connection_1 (tunnel2)
resource "azurerm_local_network_gateway" "local_network_gateway_1_tunnel2" {
  name                                                  = var.tunnel2_name
  location                                              = var.resource_group.location
  resource_group_name                                   = var.resource_group.name
  # AWS VPN Connection public IP address
  gateway_address                                       = var.aws_vpn_connection_tunnel2_address
  # AWS VPC CIDR
  address_space                                         = [var.aws_vpc_cidr]
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_1_tunnel2" {
  name                                                  = var.tunnel2_gateway_name
  location                                              = var.resource_group.location
  resource_group_name                                   = var.resource_group.name

  type                                                  = "IPsec"
  virtual_network_gateway_id                            = azurerm_virtual_network_gateway.azure_virtual_network_gateway.id
  local_network_gateway_id                              = azurerm_local_network_gateway.local_network_gateway_1_tunnel2.id
  # AWS VPN Connection secret shared key
  shared_key                                            = var.tunnel2_shared_key

  depends_on                                            = [azurerm_virtual_network_gateway.azure_virtual_network_gateway]
}
