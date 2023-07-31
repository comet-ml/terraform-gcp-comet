variable "project_id" {
  description = "ID of the project that resources will be provisioned in"
  type        = string
}

variable "region" {
  description = "Region that resources will be launched in"
  type        = string
}

variable "environment" {
  description = "Name for the Comet environment, for use in resource naming"
  type        = string
}

variable "vpc_subnet_cidr" {
  description = "Network CIDR block for the provisioned VPC subnet"
  type        = string
}

variable "vpc_subnet_flow_logs" {
  description = "Enables flow logs for the provisioned VPC"
  type        = bool
}

variable "gke_pods_cidr" {
  description = "Secondary network CIDR block for the VPC, to be used for GKE pods"
  type        = string
}

variable "gke_services_cidr" {
  description = "Secondary network CIDR block for the VPC, to be used for GKE services"
  type        = string
}