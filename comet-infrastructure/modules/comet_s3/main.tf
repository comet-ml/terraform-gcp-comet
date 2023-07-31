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