variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
  default     = "acctvnet"
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = "bjg_rg"
}

variable "resource_group_location" {
  description = "Loacation of the resource group to be imported."
  type        = string
  default     = "eastus"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "subnets" {
  type = map(any)
  default = {
    webserver_subnet = {
      name             = "webserver"
      address_prefixes = ["10.0.1.0/24"]
    }
    business_subnet = {
      name             = "business"
      address_prefixes = ["10.0.2.0/24"]
    }
    database_subnet = {
      name             = "database"
      address_prefixes = ["10.0.3.0/24"]
    }
    # The name must be AzureBastionSubnet
    AzureBastionSubnet = {
      name             = "AzureBastionSubnet"
      address_prefixes = ["10.0.4.0/24"]
    }
  }
}


variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    ENV = "test"
  }
}

variable "vnet_location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = null
}

variable "network_security_group_name" {
  description = "The NSG Name."
  type        = string
}

variable "pip_name" {
  type    = string
  default = "bastion_pip"
}

variable "allocation_method" {
  type    = string
  default = "Static"
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "bastion_name" {
  type = string
}

variable "ip_configuration_name" {
  type    = string
  default = "bastion_pip_configuration"
}
variable "availability_set_name" {
  type = string
}
