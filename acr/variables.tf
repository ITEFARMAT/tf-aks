variable "region" {
  default     = ""
  type        = string
}
variable "resource_group" {
  type        = any
}
variable "container_registry_name" {
  default     = ""
  type        = string
}
variable "acr_sku" {
  default     = ""
  type        = string
}
variable "admin_user" {
  default     = ""
  type        = string
}
