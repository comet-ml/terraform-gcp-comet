locals {
  resource_name = "comet-${var.environment}"
}

module "private-service-access" {
  source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  project_id  = var.project_id
  vpc_network = var.comet_vpc_name
}

module "mysql" {
  source               = "GoogleCloudPlatform/sql-db/google//modules/safer_mysql"
  name                 = "${local.resource_name}-db"
  random_instance_name = var.db_random_instance_name
  project_id           = var.project_id

  deletion_protection = var.db_deletion_protection
  database_version    = var.db_version
  disk_size           = var.db_disk_size
  region              = var.region
  zone                = var.comet_vpc_zones[0]
  tier                = var.db_instance_tier

  assign_public_ip   = var.db_assign_public_ip
  vpc_network        = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/${var.comet_vpc_name}"
  allocated_ip_range = module.private-service-access.google_compute_global_address_name

  database_flags = [
    {
      name  = "cloudsql_iam_authentication"
      value = "on"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    },
    {
      name  = "innodb_lock_wait_timeout"
      value = "120"
    },
    {
      name  = "max_allowed_packet"
      value = "157286400"
    },
    {
      name  = "thread_stack"
      value = "2000000"
    },
    {
      name  = "collation_server"
      value = "utf8mb4_unicode_ci"
    },
    {
      name  = "group_concat_max_len"
      value = "1000000"
    },
    {
      name  = "log_bin_trust_function_creators"
      value = "on"
    }
  ]

  // By default, all users will be permitted to connect only via the
  // Cloud SQL proxy.
  additional_users = [
    {
      name            = var.db_user
      password        = var.db_password
      host            = "%"
      type            = "BUILT_IN"
      random_password = false
    },
  ]

  module_depends_on = [module.private-service-access.peering_completed]
}