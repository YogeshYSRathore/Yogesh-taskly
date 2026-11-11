output "cluster_id" {
  value = azurerm_kubernetes_cluster.yogesh-k8s.id
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.yogesh-k8s.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.yogesh-k8s.kube_config_raw
  sensitive = true
}