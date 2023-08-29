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

variable "comet_vpc_name" {
  description = "Name of the VPC that Cloud SQL resources will be provisioned in"
  type        = string
  validation {
    condition     = length(var.comet_vpc_name) > 0
    error_message = "Value for comet_vpc_name must not be null or an empty string."
  }
}

variable "comet_vpc_zones" {
  description = "Compute zones to use within the region"
  type        = list(string)
}

variable "db_random_instance_name" {
  description = "Sets random suffix at the end of the Cloud SQL resource name"
  type        = bool
}

variable "db_deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance"
  type        = bool
}

variable "db_version" {
  description = "The database version to use"
  type        = string
}

variable "db_instance_tier" {
  description = "The tier for the master instance"
  type        = string
}

variable "db_assign_public_ip" {
  description = "Enables giving the master instance a public IP address"
  type        = bool
}

variable "db_user" {
  description = "Name for database user account"
  type        = string
}

variable "db_password" {
  description = "Password for database user account"
  type        = string
}