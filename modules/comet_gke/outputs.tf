output "cluster_endpoint" {
  description = "Endpoint to use for auth to cluster via Kubernetes provider"
  value       = module.gke.endpoint
}

output "cluster_ca_certificate" {
  description = "CA certificate from cluster to use for auth via Kubernetes provider"
  value       = module.gke.ca_certificate
}

output "cluster_name" {
  description = "Name of the cluster"
  value       = module.gke.name
}

output "cluster_nodepools_names" {
  description = "Names of the nodepools in the cluster"
  value       = module.gke.node_pools_names
}

output "cluster_service_account" {
  description = "Service account used by the GKE nodes"
  value       = module.gke.service_account
}

output "cluster_sa_hmac_access_id" {
  description = "Access ID of the HMAC key created for the cluster service account"
  value       = google_storage_hmac_key.key.access_id
}

output "cluster_sa_hmac_secret" {
  description = "Secret of the HMAC key created for the cluster service account"
  value       = google_storage_hmac_key.key.secret
}