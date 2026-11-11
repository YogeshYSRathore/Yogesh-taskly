resource "azurerm_resource_group" "yogesh-main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "yogesh-vnet" {
  name                = "taskly-${var.environment}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.yogesh-main.name

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "yogesh-aks-subnet" {
  name                 = "taskly-${var.environment}-aks-subnet"
  resource_group_name  = azurerm_resource_group.yogesh-main.name
  virtual_network_name = azurerm_virtual_network.yogesh-vnet.name

  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "yogesh-postgres-subnet" {
  name                 = "taskly-${var.environment}-postgres-subnet"
  resource_group_name  = azurerm_resource_group.yogesh-main.name
  virtual_network_name = azurerm_virtual_network.yogesh-vnet.name

  address_prefixes = ["10.0.2.0/24"]

  delegation {
    name = "postgres-delegation"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}