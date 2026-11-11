output "resource_group_name" {
  value = azurerm_resource_group.yogesh-main.name
}

output "vnet_id" {
  value = azurerm_virtual_network.yogesh-vnet.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.yogesh-aks-subnet.id
}

output "postgres_subnet_id" {
  value = azurerm_subnet.yogesh-postgres-subnet.id
}