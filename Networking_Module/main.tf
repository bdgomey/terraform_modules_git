data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet.name
  location = var.vnet_location != null ? var.vnet_location : data.azurerm_resource_group.vnet.location
  address_space = var.address_space
  dns-server = var.dns_server
  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  count = length(var.subnet_names)
  name = var.subnet_name[count.index]
  resource_group_name = data.azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix = [var.subnet_prefixes[count.index]]
}

locals {
  azurerm_subnets = {
    for index, subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  for_each                  = var.nsg_ids
  subnet_id                 = local.azurerm_subnets[each.key]
  network_security_group_id = each.value
}

resource "azurerm_subnet_route_table_association" "vnet" {
  for_each       = var.route_tables_ids
  route_table_id = each.value
  subnet_id      = local.azurerm_subnets[each.key]
}