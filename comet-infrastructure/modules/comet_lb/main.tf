locals {
  resource_name = "comet-${var.environment}"
}

module "gce-app-lb" {
  source  = "GoogleCloudPlatform/lb-http/google"
  name    = "${local.resource_name}-lb"
  project = var.project_id

  ssl                             = var.lb_enable_ssl
  managed_ssl_certificate_domains = var.lb_managed_ssl_certificate_domains
  use_ssl_certificates            = var.lb_use_provided_ssl_certificates
  ssl_certificates                = var.lb_provided_ssl_certificates

  target_tags = [
    "${local.resource_name}",
    module.cloud-nat-group.router_name
  ]
  firewall_networks = [var.lb_vpc]
  backends = {
    default = {

      protocol    = "HTTP"
      port        = 80
      port_name   = "http"
      timeout_sec = var.lb_backend_timeout_sec
      enable_cdn  = var.lb_backend_enable_cdn

      health_check = {
        request_path = "/api/isAlive/ping"
        port         = 80
        logging      = var.lb_health_check_logging
      }

      log_config = {
        enable      = var.lb_backend_service_logging
        sample_rate = var.lb_logging_sample_rate
      }

      groups = [
        {
          group = var.lb_backend_instance_group
        }
      ]

      iap_config = {
        enable = var.lb_enable_iap_config
      }
    }
  }
}

resource "google_compute_router" "comet-mig-router" {
  name    = "${local.resource_name}-gw"
  network = var.lb_vpc
  region  = var.region
}

module "cloud-nat-group" {
  source     = "terraform-google-modules/cloud-nat/google"
  router     = google_compute_router.comet-mig-router.name
  project_id = var.project_id
  region     = var.region
  name       = "${local.resource_name}-cloud-nat"
}