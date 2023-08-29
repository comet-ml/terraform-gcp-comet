locals {
  resource_name = "comet-${var.environment}"
}

resource "google_redis_instance" "comet-redis" {
  name               = "${local.resource_name}-redis"
  region             = var.region
  tier               = var.memorystore_instance_tier
  memory_size_gb     = var.memorystore_memory_size_gb
  redis_version      = var.memorystore_redis_version
  authorized_network = var.comet_vpc_name

  maintenance_policy {
    weekly_maintenance_window {
      day = var.memorystore_maintenance_day
      start_time {
        hours   = var.memorystore_maintenance_start_hour
        minutes = var.memorystore_maintenance_start_min
        seconds = 0
        nanos   = 0
      }
    }
  }
}