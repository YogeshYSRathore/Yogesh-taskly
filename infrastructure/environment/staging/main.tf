locals {
  prefix = "taskly-${var.environment}-yogesh"
}

# NETWORKING

module "networking" {
  source = "../../modules/networking"

  resource_group_name = "${local.prefix}-rg"
  location            = var.location
  environment         = var.environment
}

# POSTGRESQL PRIVATE DNS

resource "azurerm_private_dns_zone" "postgres-zone-yogesh" {
  name                = "taskly-staging.postgres.database.azure.com"
  resource_group_name = module.networking.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres-dns-link" {
  name                  = "taskly-postgres-dns-link"
  resource_group_name   = module.networking.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.postgres-zone-yogesh.name
  virtual_network_id    = module.networking.vnet_id
}

# AKS KUBERNETES CLUSTER

module "aks" {
  source = "../../modules/aks"

  cluster_name        = "${local.prefix}-aks"
  resource_group_name = module.networking.resource_group_name
  location            = var.location
  environment         = var.environment

  subnet_id  = module.networking.aks_subnet_id
  node_count = 2
  vm_size    = "Standard_D2s_v6"
}

# MANAGED POSTGRESQL DATABASE

module "postgres" {
  source = "../../modules/postgres"

  server_name         = "${local.prefix}-postgres"
  resource_group_name = module.networking.resource_group_name
  location            = var.location

  subnet_id           = module.networking.postgres_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.postgres-zone-yogesh.id

  administrator_login    = var.postgres_admin
  administrator_password = var.postgres_password

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.postgres-dns-link
  ]
}

# MANAGED REDIS CACHE

module "redis" {
  source = "../../modules/redis"

  redis_name          = "${local.prefix}-redis"
  resource_group_name = module.networking.resource_group_name
  location            = var.location

  sku_name = "Standard"
  family   = "C"
  capacity = 1
}