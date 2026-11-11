output "server_id" {
  value = azurerm_postgresql_flexible_server.yogesh-postgres-server.id
}

output "server_fqdn" {
  value = azurerm_postgresql_flexible_server.yogesh-postgres-server.fqdn
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.yogesh-taskly-database.name
}