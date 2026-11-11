resource "azurerm_kubernetes_cluster" "yogesh-k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = "${var.cluster_name}-dns-yogesh"

  sku_tier = "Standard"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = "system"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.subnet_id

    auto_scaling_enabled = true
    min_count            = 1
    max_count            = 3
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "azure"
    load_balancer_sku   = "standard"

    service_cidr   = "10.200.0.0/16"
    dns_service_ip = "10.200.0.10"
    pod_cidr       = "10.244.0.0/16"

  }

  tags = {
    project     = "taskly-${var.environment}"
    environment = "staging"
  }
}