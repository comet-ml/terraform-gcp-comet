output "memorystore_name" {
  description = "ID of the Redis instance"
  value = google_redis_instance.comet-redis.name
}

output "memorystore_host" {
  description = "Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service"
  value = google_redis_instance.comet-redis.host
}

output "memorystore_port" {
  description = "The port number of the exposed Redis endpoint"
  value = google_redis_instance.comet-redis.port
}

output "memorystore_redis_auth" {
  description = "The Redis AUTH string if AUTH enabled"
  value = google_redis_instance.comet-redis.auth_string
}