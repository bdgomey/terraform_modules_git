variable "pip_name" {
  type = string
  default = "bastion_pip"
}

variable "resource_group_location" {
  type = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
  default = "bjg_rg"
}

variable "allocation_method" {
  type = string
}

variable "sku" {
  type = string
  default = "Standard"
}

variable "bastion_name" {
  type = string
}

variable "ip_configuration_name" {
  type = string
  default = "bastion_pip_configuration"
}

variable "bastion_subnet_id" {
  type = string
}
 
variable "tags" {
  type = map(string)
}

