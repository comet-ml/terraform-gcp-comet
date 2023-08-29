data "google_compute_zones" "available" {}

locals {
  resource_name = "comet-${var.environment}"
}

module "vpc" {
  source = "terraform-google-modules/network/google"

  project_id   = var.project_id
  network_name = "${local.resource_name}-vpc"

  subnets = [
    {
      subnet_name           = "${local.resource_name}-subnet"
      subnet_ip             = var.vpc_subnet_cidr
      subnet_region         = var.region
      subnet_private_access = var.vpc_subnet_private_access
      subnet_flow_logs      = var.vpc_subnet_flow_logs
    }
  ]

  secondary_ranges = {
    "${local.resource_name}-subnet" = [
      {
        range_name    = "${local.resource_name}-subnet-gke-pods"
        ip_cidr_range = var.gke_pods_cidr
      },
      {
        range_name    = "${local.resource_name}-subnet-gke-services"
        ip_cidr_range = var.gke_services_cidr
      },
    ]
  }
}

resource "google_compute_router" "comet-router" {
  name    = "${local.resource_name}-gw"
  network = module.vpc.network_name
  region  = var.region
}

module "cloud_nat_group" {
  source     = "terraform-google-modules/cloud-nat/google"
  router     = google_compute_router.comet-router.name
  project_id = var.project_id
  region     = var.region
  name       = "${local.resource_name}-cloud-nat"
}