locals {
  resource_name  = "comet-${var.environment}"
  node_locations = join(",", var.comet_vpc_zones)
}

module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google"
  project_id                      = var.project_id
  name                            = "${local.resource_name}-cluster"
  regional                        = var.gke_regional
  region                          = var.region
  zones                           = var.comet_vpc_zones
  network                         = var.comet_vpc_name
  subnetwork                      = var.comet_vpc_subnet_name
  ip_range_pods                   = var.gke_pods_cidr_name
  ip_range_services               = var.gke_services_cidr_name
  kubernetes_version              = var.gke_kubernetes_version
  create_service_account          = var.gke_create_service_account
  http_load_balancing             = var.gke_http_load_balancing
  network_policy                  = var.gke_network_policy
  network_policy_provider         = var.gke_network_policy_provider
  horizontal_pod_autoscaling      = var.gke_horizontal_pod_autoscaling
  enable_vertical_pod_autoscaling = var.gke_enable_vertical_pod_autoscaling
  filestore_csi_driver            = var.gke_filestore_csi_driver
  enable_cost_allocation          = var.gke_enable_cost_allocation
  remove_default_node_pool        = var.gke_remove_default_node_pool

  node_pools = [
    {
      name               = "${local.resource_name}-node-pool"
      node_locations     = local.node_locations
      machine_type       = var.gke_nodepool_machine_type
      min_count          = var.gke_nodepool_min_count
      max_count          = var.gke_nodepool_max_count
      local_ssd_count    = var.gke_nodepool_local_ssd_count
      spot               = var.gke_nodepool_spot
      disk_size_gb       = var.gke_nodepool_disk_size_gb
      disk_type          = var.gke_nodepool_disk_type
      image_type         = var.gke_nodepool_image_type
      enable_gcfs        = var.gke_nodepool_enable_gcfs
      enable_gvnic       = var.gke_nodepool_enable_gvnic
      auto_repair        = var.gke_nodepool_auto_repair
      auto_upgrade       = var.gke_nodepool_auto_upgrade
      preemptible        = var.gke_nodepool_preemptible
      initial_node_count = var.gke_nodepool_min_count
    }
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}