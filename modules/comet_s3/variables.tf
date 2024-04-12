variable "project_id" {
  description = "ID of the project that resources will be provisioned in"
  type        = string
}

variable "environment" {
  description = "Name for the Comet environment, for use in resource naming"
  type        = string
}

variable "s3_location" {
  description = "Region for the storage bucket to be provisioned in"
  type        = string
}

variable "s3_force_destroy" {
  description = "Setting to allow storage bucket to be deleted while still holding objects"
  type        = bool
}

variable "s3_storage_class" {
  description = "Storage bucket class"
  type        = string
  validation {
    condition     = can(regex("^STANDARD|MULTI_REGIONAL|REGIONAL$", var.s3_storage_class))
    error_message = "Invalid storage class. Accepted values: STANDARD, MULTI_REGIONAL, REGIONAL"
  }
}

variable "s3_uniform_bucket_level_access" {
  description = "Enables uniform bucket level access"
  type        = bool
}

variable "s3_versioning" {
  description = "Enables versioning for objects in the storage bucket"
  type        = bool
}

variable "enable_mpm_infra" {
  description = "Enables provisioning of additional S3 buckets for MPM"
  type        = bool
}