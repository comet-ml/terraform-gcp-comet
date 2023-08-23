data "google_client_config" "default" {}
data "google_compute_regions" "available" {}

module "comet_gke" {
  source      = "./modules/comet_gke"
  count       = var.enable_gke ? 1 : 0
  project_id  = var.project_id
  region      = var.region
  environment = var.environment

  comet_vpc_zones        = var.enable_vpc ? module.comet_vpc[0].available_zones : var.comet_vpc_zones
  comet_vpc_name         = var.enable_vpc ? module.comet_vpc[0].comet_vpc_name : var.comet_vpc_name
  comet_vpc_subnet_name  = var.enable_vpc ? module.comet_vpc[0].comet_vpc_subnet_name : var.comet_vpc_subnet_name
  gke_pods_cidr_name     = var.enable_vpc ? module.comet_vpc[0].gke_pods_cidr_name : var.gke_pods_cidr_name
  gke_services_cidr_name = var.enable_vpc ? module.comet_vpc[0].gke_services_cidr_name : var.gke_services_cidr_name
  gke_sa_s3_bucket_name  = var.enable_s3 ? module.comet_s3[0].storage_bucket_name : var.s3_existing_bucket_name

  gke_regional                        = var.gke_regional
  gke_kubernetes_version              = var.gke_kubernetes_version
  gke_create_service_account          = var.gke_create_service_account
  gke_http_load_balancing             = var.gke_http_load_balancing
  gke_network_policy                  = var.gke_network_policy
  gke_network_policy_provider         = var.gke_network_policy_provider
  gke_horizontal_pod_autoscaling      = var.gke_horizontal_pod_autoscaling
  gke_enable_vertical_pod_autoscaling = var.gke_enable_vertical_pod_autoscaling
  gke_filestore_csi_driver            = var.gke_filestore_csi_driver
  gke_enable_cost_allocation          = var.gke_enable_cost_allocation
  gke_remove_default_node_pool        = var.gke_remove_default_node_pool

  gke_nodepool_machine_type    = var.gke_nodepool_machine_type
  gke_nodepool_min_count       = var.gke_nodepool_min_count
  gke_nodepool_max_count       = var.gke_nodepool_max_count
  gke_nodepool_local_ssd_count = var.gke_nodepool_local_ssd_count
  gke_nodepool_spot            = var.gke_nodepool_spot
  gke_nodepool_disk_size_gb    = var.gke_nodepool_disk_size_gb
  gke_nodepool_disk_type       = var.gke_nodepool_disk_type
  gke_nodepool_image_type      = var.gke_nodepool_image_type
  gke_nodepool_enable_gcfs     = var.gke_nodepool_enable_gcfs
  gke_nodepool_enable_gvnic    = var.gke_nodepool_enable_gvnic
  gke_nodepool_auto_repair     = var.gke_nodepool_auto_repair
  gke_nodepool_auto_upgrade    = var.gke_nodepool_auto_upgrade
  gke_nodepool_preemptible     = var.gke_nodepool_preemptible
}

module "comet_lb" {
  source      = "./modules/comet_lb"
  count       = var.enable_lb ? 1 : 0
  project_id  = var.project_id
  region      = var.region
  environment = var.environment

  lb_enable_ssl                      = var.lb_enable_ssl
  lb_managed_ssl_certificate_domains = var.lb_managed_ssl_certificate_domains
  lb_use_provided_ssl_certificates   = var.lb_use_provided_ssl_certificates
  lb_provided_ssl_certificates       = var.lb_provided_ssl_certificates

  lb_cloudnat_router_name    = var.enable_vpc ? module.comet_vpc[0].vpc_cloudnat_router_name : var.lb_cloudnat_router_name
  lb_vpc                     = var.enable_vpc ? module.comet_vpc[0].comet_vpc_name : var.comet_vpc_name
  lb_comet_subnet            = var.enable_vpc ? module.comet_vpc[0].comet_vpc_subnet_name : var.comet_vpc_subnet_name
  lb_backend_instance_group  = var.enable_vm ? module.comet_vm[0].instance_group : var.lb_backend_instance_group
  lb_backend_timeout_sec     = var.lb_backend_timeout_sec
  lb_backend_enable_cdn      = var.lb_backend_enable_cdn
  lb_health_check_logging    = var.lb_health_check_logging
  lb_backend_service_logging = var.lb_backend_service_logging
  lb_logging_sample_rate     = var.lb_logging_sample_rate
  lb_enable_iap_config       = var.lb_enable_iap_config
}

module "comet_memorystore" {
  source      = "./modules/comet_memorystore"
  count       = var.enable_memorystore ? 1 : 0
  region      = var.region
  environment = var.environment

  comet_vpc_name                     = var.enable_vpc ? module.comet_vpc[0].comet_vpc_name : var.comet_vpc_name
  memorystore_redis_version          = var.memorystore_redis_version
  memorystore_instance_tier          = var.memorystore_instance_tier
  memorystore_memory_size_gb         = var.memorystore_memory_size_gb
  memorystore_maintenance_day        = var.memorystore_maintenance_day
  memorystore_maintenance_start_hour = var.memorystore_maintenance_start_hour
  memorystore_maintenance_start_min  = var.memorystore_maintenance_start_min
}

module "comet_mysql" {
  source      = "./modules/comet_mysql"
  count       = var.enable_mysql ? 1 : 0
  project_id  = var.project_id
  region      = var.region
  environment = var.environment

  comet_vpc_name          = var.enable_vpc ? module.comet_vpc[0].comet_vpc_name : var.comet_vpc_name
  comet_vpc_zones         = var.enable_vpc ? module.comet_vpc[0].available_zones : var.comet_vpc_zones
  db_random_instance_name = var.db_random_instance_name
  db_deletion_protection  = var.db_deletion_protection
  db_version              = var.db_version
  db_instance_tier        = var.db_instance_tier
  db_assign_public_ip     = var.db_assign_public_ip
  db_user                 = var.db_user
  db_password             = var.db_password

  depends_on = [module.comet_vpc]
}

module "comet_s3" {
  source      = "./modules/comet_s3"
  count       = var.enable_s3 ? 1 : 0
  project_id  = var.project_id
  environment = var.environment

  s3_location                    = var.region
  s3_force_destroy               = var.s3_force_destroy
  s3_storage_class               = var.s3_storage_class
  s3_uniform_bucket_level_access = var.s3_uniform_bucket_level_access
  s3_versioning                  = var.s3_versioning
}

module "comet_vm" {
  source       = "./modules/comet_vm"
  count        = var.enable_vm ? 1 : 0
  project_id   = var.project_id
  region       = var.region
  environment  = var.environment
  enable_mysql = var.enable_mysql

  vm_vpc                   = var.enable_vpc ? module.comet_vpc[0].comet_vpc_name : var.comet_vpc_name
  vm_subnetwork            = var.enable_vpc ? module.comet_vpc[0].comet_vpc_subnet_name : var.comet_vpc_subnet_name
  vm_source_image_family   = var.vm_source_image_family
  vm_machine_type          = var.vm_machine_type
  vm_disk_type             = var.vm_disk_type
  vm_disk_size_gb          = var.vm_disk_size_gb
  vm_disk_auto_delete      = var.vm_disk_auto_delete
  vm_enable_ssh            = var.vm_enable_ssh
  vm_mysql_connection_name = var.enable_mysql ? module.comet_mysql[0].mysql_connection_name : null
}

module "comet_vpc" {
  source      = "./modules/comet_vpc"
  count       = var.enable_vpc ? 1 : 0
  project_id  = var.project_id
  region      = var.region
  environment = var.environment

  vpc_subnet_cidr           = var.vpc_subnet_cidr
  vpc_subnet_private_access = var.vpc_subnet_private_access
  vpc_subnet_flow_logs      = var.vpc_subnet_flow_logs
  gke_pods_cidr             = var.gke_pods_cidr
  gke_services_cidr         = var.gke_services_cidr
}