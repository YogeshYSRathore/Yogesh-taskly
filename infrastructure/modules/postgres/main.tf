resource "azurerm_postgresql_flexible_server" "yogesh-postgres-server" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  version = "16"
  delegated_subnet_id = var.subnet_id
  private_dns_zone_id = var.private_dns_zone_id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone = "1"

  storage_mb = 32768
  storage_tier = "P4"

  sku_name   = "B_Standard_B1ms"

  backup_retention_days = 7

  public_network_access_enabled = false

  tags = {
    project = "taskly"
  }
}

resource "azurerm_postgresql_flexible_server_database" "yogesh-taskly-database" {
  name      = "taskly"
  server_id = azurerm_postgresql_flexible_server.yogesh-postgres-server.id

  charset   = "UTF8"
  collation = "en_US.utf8"
}