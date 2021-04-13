output "acr_id" {
  value             = azurerm_container_registry.acr.id
  sensitive         = true
  description       = "The ID of the container registry"
}
output "acr_login_server" {
  value             = azurerm_container_registry.acr.login_server
  sensitive         = true
  description       = "The login server address of the container registry"
}
output "acr_admin_username" {
  value            = azurerm_container_registry.acr.admin_username
  sensitive        = true
  description      = "The admin user name  for acces to the container registry"
}
output "acr_admin_password" {
  value            = azurerm_container_registry.acr.admin_password
  sensitive        = true
  description      = "The admin user name password for acces to the container registry"
}
