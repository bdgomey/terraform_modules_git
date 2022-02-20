variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}
variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
}
variable "vnet_name" {
  description = "Name of the vnet."
  type        = string
}
variable "vnet_location" {
  description = "vnet location"
  type        = string
}
variable "address_space" {
  description = "vnet address space."
  type        = list(string)
}
variable "dns_servers" {
  description = "dns server address space."
  type        = list(string)
}
variable "subnet_names" {
  description = "subnet names"
  type        = string
}
variable "subnet_prefixes" {
  description = "subnet prefixes"
  type        = list(string)
}
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}
variable "tags" {
  type = map(string)
}