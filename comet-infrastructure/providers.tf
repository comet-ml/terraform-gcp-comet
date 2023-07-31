provider "google" {
  region  = var.region
  project = var.project_id
}

provider "kubernetes" {
  host                   = var.enable_gke ? "https://${module.comet_gke[0].cluster_endpoint}" : null
  cluster_ca_certificate = var.enable_gke ? base64decode(module.comet_gke[0].cluster_ca_certificate) : null
  token                  = var.enable_gke ? data.google_client_config.default.access_token : null
}