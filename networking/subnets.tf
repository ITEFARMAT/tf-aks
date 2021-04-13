 resource "azurerm_subnet" "kubernetes_subnet" {

    name                                  = var.kubernetes_subnet_name
    resource_group_name                   = var.resource_group.name
    virtual_network_name                  = azurerm_virtual_network.kubernetes_vnet.name
    address_prefixes                      = [var.kubernetes_subnet_address_space]

    depends_on                            = [
        azurerm_network_security_group.kubernetes,
        azurerm_virtual_network.kubernetes_vnet
    ]
}
# The subnet where the VPN tunnel to AWS will live
# Only one "GatewaySubnet" is allowed per V-net
resource "azurerm_subnet" "azure_to_aws_gateway_subnet" {
  name                                      = var.gateway_subnet_name
  resource_group_name                       = var.resource_group.name
  virtual_network_name                      = azurerm_virtual_network.kubernetes_vnet.name
  address_prefixes                          = [var.azure_gateway_subnet_address_space]

  depends_on                                = [
      azurerm_virtual_network.kubernetes_vnet,
      azurerm_subnet.kubernetes_subnet
    ]
}

resource "azurerm_subnet_network_security_group_association" "kubernetes" {
    subnet_id                               = azurerm_subnet.kubernetes_subnet.id
    network_security_group_id               = azurerm_network_security_group.kubernetes.id

    depends_on                              = [
        azurerm_network_security_group.kubernetes,
        azurerm_virtual_network.kubernetes_vnet,
        azurerm_subnet.kubernetes_subnet
    ]
}

