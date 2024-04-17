locals {
  resource_name = "comet-${var.environment}"
}

resource "google_storage_bucket" "comet-s3" {
  name                        = "${local.resource_name}-bucket-${var.project_id}"
  location                    = var.s3_location
  force_destroy               = var.s3_force_destroy
  storage_class               = var.s3_storage_class
  uniform_bucket_level_access = var.s3_uniform_bucket_level_access
  versioning {
    enabled = var.s3_versioning
  }
}

resource "google_storage_bucket" "comet-s3-druid" {
  count                       = var.enable_mpm_infra ? 1 : 0
  name                        = "${local.resource_name}-druid-bucket-${var.project_id}"
  location                    = var.s3_location
  force_destroy               = var.s3_force_destroy
  storage_class               = var.s3_storage_class
  uniform_bucket_level_access = var.s3_uniform_bucket_level_access
  versioning {
    enabled = var.s3_versioning
  }
}

resource "google_storage_bucket" "comet-s3-airflow" {
  count                       = var.enable_mpm_infra ? 1 : 0
  name                        = "${local.resource_name}-airflow-bucket-${var.project_id}"
  location                    = var.s3_location
  force_destroy               = var.s3_force_destroy
  storage_class               = var.s3_storage_class
  uniform_bucket_level_access = var.s3_uniform_bucket_level_access
  versioning {
    enabled = var.s3_versioning
  }
} 