# Public IP will being attached to the Virtual Network Gateway below
# Public IP needs to be dynamic for the Virtual Network Gateway
# Create public IP for network gateway
resource "azurerm_public_ip" "public_ip_1" {
  name                                               = var.public_ip_1_name
  location                                           = var.resource_group.location
  resource_group_name                                = var.resource_group.name
  allocation_method                                  = "Dynamic"
}
resource "azurerm_virtual_network_gateway" "azure_virtual_network_gateway" {
  name                                               = var.virtual_network_gateway_name
  location                                           = var.resource_group.location
  resource_group_name                                = var.resource_group.name
  type                                               = "Vpn"
  vpn_type                                           = "RouteBased"
  # No high-avability required for now
  active_active                                      = false
  sku                                                = "Basic"
  # Configuring the  previously created public IP Addresses
  ip_configuration {
    name                                             = azurerm_public_ip.public_ip_1.name
    public_ip_address_id                             = azurerm_public_ip.public_ip_1.id
    private_ip_address_allocation                    = "Dynamic"
    subnet_id                                        = azurerm_subnet.azure_to_aws_gateway_subnet.id
  }
  depends_on                                         = [
      azurerm_virtual_network.kubernetes_vnet,
      azurerm_subnet.azure_to_aws_gateway_subnet,
      azurerm_public_ip.public_ip_1,
    ]
}
