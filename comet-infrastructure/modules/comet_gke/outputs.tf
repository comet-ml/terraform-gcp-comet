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