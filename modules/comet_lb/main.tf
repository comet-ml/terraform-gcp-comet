locals {
  resource_name = "comet-${var.environment}"
}

module "gce-app-lb" {
  source  = "GoogleCloudPlatform/lb-http/google"
  name    = "${local.resource_name}-lb"
  project = var.project_id

  ssl                             = var.lb_enable_ssl
  managed_ssl_certificate_domains = var.lb_managed_ssl_certificate_domains
  #use_ssl_certificates            = var.lb_use_provided_ssl_certificates
  ssl_certificates                = var.lb_provided_ssl_certificates
  ssl_policy                      = google_compute_ssl_policy.comet-lb-ssl-policy.self_link

  target_tags = [
    "${local.resource_name}",
    "${var.lb_cloudnat_router_name}"
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

resource "google_compute_ssl_policy" "comet-lb-ssl-policy" {
  name            = "${local.resource_name}-lb-ssl-policy"
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}