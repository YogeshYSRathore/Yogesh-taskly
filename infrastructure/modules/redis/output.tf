output "redis_id" {
  value = azurerm_redis_cache.yogesh-redis.id
}

output "redis_hostname" {
  value = azurerm_redis_cache.yogesh-redis.hostname
}

output "redis_ssl_port" {
  value = azurerm_redis_cache.yogesh-redis.ssl_port
}

output "redis_primary_access_key" {
  value     = azurerm_redis_cache.yogesh-redis.primary_access_key
  sensitive = true
}