resource "azurerm_redis_cache" "yogesh-redis" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.resource_group_name

  capacity = var.capacity
  family   = var.family
  sku_name = var.sku_name

    non_ssl_port_enabled = false
  minimum_tls_version = "1.2"

  redis_configuration {}

  tags = {
    project     = "taskly"
    environment = "staging"
  }
}