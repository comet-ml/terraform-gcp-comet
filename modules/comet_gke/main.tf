data "google_service_account" "gke_cluster_sa" {
  account_id = module.gke.service_account
}

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
  release_channel                 = var.gke_release_channel

  node_pools = concat([
    {
      name               = "${local.resource_name}-node-pool"
      node_locations     = local.node_locations
      machine_type       = var.gke_nodepool_machine_type
      min_count          = var.gke_nodepool_min_count
      max_count          = var.gke_nodepool_max_count
      initial_node_count = var.gke_nodepool_min_count
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
    }
  ],
  var.enable_mpm_infra ? [
    {
      name               = "druid-node-pool"
      node_locations     = local.node_locations
      machine_type       = var.gke_nodepool_druid_machine
      min_count          = var.gke_nodepool_druid_count
      max_count          = var.gke_nodepool_druid_count
      initial_node_count = var.gke_nodepool_druid_count
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
    },
    {
      name               = "zookeeper-node-pool"
      node_locations     = local.node_locations
      machine_type       = var.gke_nodepool_zookeeper_machine
      min_count          = var.gke_nodepool_zookeeper_count
      max_count          = var.gke_nodepool_zookeeper_count
      initial_node_count = var.gke_nodepool_zookeeper_count
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
    },
    {
      name               = "airflow-node-pool"
      node_locations     = local.node_locations
      machine_type       = var.gke_nodepool_airflow_machine
      min_count          = var.gke_nodepool_airflow_count
      max_count          = var.gke_nodepool_airflow_count
      initial_node_count = var.gke_nodepool_airflow_count
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
    }
  ] : []
  )
  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
  node_pools_labels = {
    all = {}
    "${local.resource_name}-node-pool" = {
      nodegroup_name = "comet"
    }
    "druid-node-pool" = {
      nodegroup_name = "druid"
    }
    "zookeeper-node-pool" = {
      nodegroup_name = "zookeeper"
    }
    "airflow-node-pool" = {
      nodegroup_name = "airflow"
    }
  }
}

resource "google_service_account" "gcp-proxy-svs-account" {
  account_id   = "gcp-proxy-svs-account"
  display_name = "gcp-proxy-svs-account"
}

resource "google_project_iam_member" "sa_sql_client_binding" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.gcp-proxy-svs-account.email}"
}

resource "google_service_account_key" "gcp-proxy-svs-account-key" {
  service_account_id = google_service_account.gcp-proxy-svs-account.name
}

resource "kubernetes_namespace" "cometml" {
  metadata {
    name = "cometml"
  }
}

resource "kubernetes_secret" "gcp-proxy-svs-account-secret" {
  metadata {
    name      = "gcp-proxy-svs-account.json"
    namespace = kubernetes_namespace.cometml.metadata[0].name
  }
  data = {
    "gcp-proxy-svs-account.json" = base64decode(google_service_account_key.gcp-proxy-svs-account-key.private_key)
  }
}

resource "google_storage_hmac_key" "key" {
  service_account_email = data.google_service_account.gke_cluster_sa.email
}

resource "google_project_iam_member" "cluster_sa_storage_binding" {
  for_each = { for idx, name in var.gke_sa_s3_bucket_names : idx => name }
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${data.google_service_account.gke_cluster_sa.email}"

  condition {
    title       = "comet_bucket_only_${each.key}"
    expression  = "resource.name.startsWith(\"projects/_/buckets/${each.value}\")"
  }
}

resource "google_compute_ssl_policy" "comet-lb-ssl-policy" {
  name            = "comet-gke-lb-ssl-policy"
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}