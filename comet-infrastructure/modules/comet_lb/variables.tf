variable "project_id" {
  description = "ID of the project that resources will be provisioned in"
  type        = string
}

variable "environment" {
  description = "Name for the Comet environment, for use in resource naming"
  type        = string
}

variable "region" {
  description = "Region that resources will be launched in"
  type        = string
}

variable "lb_enable_ssl" {
  description = "Enables SSL support on the load balancer"
  type        = bool
}

variable "lb_managed_ssl_certificate_domains" {
  description = "Google-managed SSL certificates for specified domains. Requires lb_enable_ssl to be set to true and lb_use_provided_ssl_certificates set to false"
  type        = list(string)
}

variable "lb_use_provided_ssl_certificates" {
  description = "If true, use the certificates provided from lb_provided_ssl_certificates"
  type        = bool
}

variable "lb_provided_ssl_certificates" {
  description = "List of existing SSL certificates to use for the load balancer"
  type        = list(string)
}

variable "lb_cloudnat_router_name" {
  description = "Name of the router used for Cloud NAT"
  type        = string
}

variable "lb_vpc" {
  description = "Name of the VPC that the load balancer will be provisioned in"
  type        = string
}

variable "lb_comet_subnet" {
  description = "Name of the VPC subnet that the load balancer will be provisioned in"
  type        = string
}

variable "lb_backend_timeout_sec" {
  description = "Timeout in seconds for backend connections"
  type        = number
}

variable "lb_backend_enable_cdn" {
  description = "Enables using CDN load balancer"
  type        = bool
}

variable "lb_health_check_logging" {
  description = "Enables logging for the load balancer health checks"
  type        = bool
}

variable "lb_backend_service_logging" {
  description = "Enables logging for the load balancer requests to backend"
  type        = bool
}

variable "lb_logging_sample_rate" {
  description = "Sample rate for the backend logging"
  type        = number
}

variable "lb_backend_instance_group" {
  description = "Compute managed instance group to serve as backend for the load balancer"
  type        = string
}

variable "lb_enable_iap_config" {
  description = "Enables using identity-aware proxy with the load balancer"
  type        = bool
}