variable "cluster_name" {
 default = "k8s-dev-cluster"
 type    = string
}
variable "dns_preffix" {
 default = "kubernetes-dev"
 type    = string
}
variable "kubernetes_version" {
 default = "1.15.10"
 type    = string
}
variable "pool_profile_name" {
 default = "workers"
 type    = any
}
variable "auto_scaling" {
 default = "true"
 type    = any
}
variable "min_count" {
 default = "3"

}
variable "max_pods" {
 default = "50"
 type    = string
}
variable "max_count" {
 default = "12"
 type    = string
}
variable "vm_size" {
 default = "Standard_D3_v2"
 type    = string
}
variable "os_disk_size_gb" {
 default = "40"
 type    = string
}
variable "type" {
 default = "VirtualMachineScaleSets"
 type    = string
}
variable "default_user" {
 default = "to be fill up"
 type    = string
}
variable "resource_group" {
 type    = any
}
variable "kubernetes_subnet" {
 default = "kubernetes_subnet"
 type    = any
}
variable "service_principal_id" {
 type    = string
}
variable "service_principal_secret" {
 type    = string
}
variable "ssh_key_data" {
 type    = string
}
variable "virtual_gateway" {
 type    = any
}
variable "network_plugin" {
 default = "azure"
 type    = string
}
variable "network_policy" {
 default = "calico"
 type    = string
}

