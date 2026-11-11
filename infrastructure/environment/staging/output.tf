output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "postgres_endpoint" {
  value = module.postgres.server_fqdn
}

output "postgres_database" {
  value = module.postgres.database_name
}

output "redis_hostname" {
  value = module.redis.redis_hostname
}

output "redis_port" {
  value = module.redis.redis_ssl_port
}

output "redis_password" {
  value     = module.redis.redis_primary_access_key
  sensitive = true
}