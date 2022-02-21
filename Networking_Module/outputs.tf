output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet.address_space
}

output "azure_subnet_id" {
    value = {
        for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
    }
    description = "Lists the ID's of the subnets"
}

output "bastion_pubip" {
  value = azurerm_public_ip.bastion_pip.ip_address
  description = "List the public IP of the bastion server"
}