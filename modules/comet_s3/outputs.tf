output "storage_bucket_name" {
  description = "Name of the storage bucket"
  value = google_storage_bucket.comet-s3.name
}

output "storage_bucket_url" {
  description = "Base URL of the storage bucket"
  value = google_storage_bucket.comet-s3.url
}