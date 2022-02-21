
resource "azurerm_network_security_group" "vnet" {
  name                = var.network_security_group_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_network_security_group.vnet.resource_group_name
  location            = var.vnet_location != null ? var.vnet_location : azurerm_network_security_group.vnet.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets 
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = each.value.name
  address_prefixes     = each.value.address_prefix
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = var.pip_name
  location            = azurerm_network_security_group.vnet.location
  resource_group_name = azurerm_network_security_group.vnet.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = azurerm_network_security_group.vnet.location
  resource_group_name = azurerm_network_security_group.vnet.resource_group_name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = azurerm_subnet.subnets["AzureBastionSubnet"].id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}
resource "azurerm_availability_set" "availability_set" {
  name                = var.availability_set_name
  location            = azurerm_network_security_group.vnet.location
  resource_group_name = azurerm_network_security_group.vnet.resource_group_name

}