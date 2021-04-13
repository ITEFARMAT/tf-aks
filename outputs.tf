output "acr_login_server" {
  value                  = module.azure-container-registry.acr_login_server
  description            = "The login server address of the container registry"
}
output "acr_admin_username" {
  value                  = module.azure-container-registry.acr_admin_username
  description            = "The admin user name  for acces to the container registry"
}
output "acr_admin_password" {
  value                  = module.azure-container-registry.acr_admin_password
  description            = "The admin user name password for acces to the container registry"
}
