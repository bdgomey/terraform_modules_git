resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = azurerm_public_ip.pip.location
  resource_group_name = azurerm_public_ip.pip.resource_group_name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}