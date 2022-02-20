data "azurerm_resource_group" "networking_rg" {
  name = var.resource_group_name
}

resource "azurerm_network_security_group" "vnet" {
  name                = var.network_security_group_name 
  resource_group_name  = data.azurerm_resource_group.networking_rg.name
  location = data.azurerm_resource_group.networking_rg.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.networking_rg.name
  location = var.vnet_location != null ? var.vnet_location: data.azurerm_resource_group.networking_rg.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = var.tags
}

resource "azurerm_subnet" "vnet" {
  count = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = data.azurerm_resource_group.networking_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}