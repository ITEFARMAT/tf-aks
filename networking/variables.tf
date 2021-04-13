variable "kubernetes_vnet_name" {
 default = "kubernetes_vnet"
 type    = string
}
variable "cidr" {
 default = "10.3.0.0/16"
 type    = string
}
variable "kubernetes_subnet_name" {
 default = "kubernetes_subnet"
 type    = string
}
variable "kubernetes_subnet_address_space" {
 default = "10.3.1.0/24"
 type    = string
}
variable "kubernetes_nsg_name" {
 default = "kubernetes"
 type    = string
}
variable "resource_group" {
 type    = any
}
variable "location" {
 default = "WestEurope"
 type    = string
}
variable "gateway_subnet_name" {
 default = "GatewaySubnet"
 type    = string
}
variable "azure_gateway_subnet_address_space" {
 default = "10.3.2.0/24"
 type    = string
}
variable "public_ip_1_name" {
 default = "azure_to_aws_gateway_public_ip_1"
 type    = string
}
variable "virtual_network_gateway_name" {
 default = "azure_to_aws_vnet_gateway"
 type    = string
}
variable "aws_vpn_connection_tunnel1_address" {
 type        = string
 description = "It depends on AWS config, so it's not default"
}
variable "aws_vpc_cidr" {
 default = "10.0.0.0/16"
 type    = string
}
variable "aws_vpn_connection_tunnel2_address" {
 type        = string
 description = "It depends on AWS config, so it's not default"
}
variable "tunnel1_name" {
 default = "local-azure-to-aws-tunnel1"
 type    = string
}
variable "tunnel1_gateway_name" {
 default = "gateway-azure-to-aws-tunnel1-connection"
 type    = string
}
variable "tunnel2_name" {
 default = "local-azure-to-aws-tunnel2"
 type    = string
}
variable "tunnel2_gateway_name" {
 default = "gateway-azure-to-aws-tunnel2-connection"
 type    = string
}
variable "tunnel1_shared_key" {
 type    = string
}
variable "tunnel2_shared_key" {
 type    = string
}
