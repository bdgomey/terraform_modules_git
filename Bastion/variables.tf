variable "pip_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "allocation_method" {
  type = string
}

variable "sku" {
  type = string
}

variable "bastion_name" {
  type = string
}

variable "ip_configuration_name" {
  type = string
}

variable "subnet_id" {
  type = string
}
 
variable "tags" {
  type = map(string)
}

