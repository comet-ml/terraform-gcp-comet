output "comet_gke_cluster" {
  description = "Name of the GKE cluster"
  value       = var.enable_gke ? module.comet_gke[0].cluster_name : null
}

output "comet_gke_nodepools" {
  description = "Names of the nodepools in the GKE cluster"
  value       = var.enable_gke ? module.comet_gke[0].cluster_nodepools_names : null
}

output "comet_gke_service_account" {
  description = "Service account used by the GKE nodes"
  value       = var.enable_gke ? module.comet_gke[0].cluster_service_account : null
}

output "comet_gke_sa_hmac_access_id" {
  description = "Access ID of the HMAC key created for the cluster service account"
  value       = var.enable_gke ? module.comet_gke[0].cluster_sa_hmac_access_id : null
}

output "comet_gke_sa_hmac_secret" {
  description = "Secret of the HMAC key created for the cluster service account"
  value       = var.enable_gke ? module.comet_gke[0].cluster_sa_hmac_secret : null
  sensitive   = true
}

output "comet_gke_configure_kubectl" {
  description = "Configure kubectl: run the following command to update your kubeconfig with the newly provisioned cluster"
  value       = var.enable_gke ? "gcloud container clusters get-credentials ${module.comet_gke[0].cluster_name} --region ${var.region}" : null
}

output "comet_lb_external_ip" {
  description = "External IP address for the VM load balancer"
  value       = var.enable_lb ? module.comet_lb[0].lb_external_ip : null
}

output "comet_memorystore_name" {
  description = "ID of the Redis instance"
  value       = var.enable_memorystore ? module.comet_memorystore[0].memorystore_name : null
}

output "comet_memorystore_host" {
  description = "Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service"
  value       = var.enable_memorystore ? module.comet_memorystore[0].memorystore_host : null
}

output "comet_memorystore_port" {
  description = "The port number of the exposed Redis endpoint"
  value       = var.enable_memorystore ? module.comet_memorystore[0].memorystore_port : null
}

output "comet_mysql_connection_name" {
  description = "The connection name of the MySQL instance to be used in connection strings"
  value       = var.enable_mysql ? module.comet_mysql[0].mysql_connection_name : null
}

output "comet_s3_storage_bucket_name" {
  description = "Name of the storage bucket"
  value       = var.enable_s3 ? module.comet_s3[0].storage_bucket_name : null
}

output "comet_s3_storage_bucket_url" {
  description = "Base URL of the storage bucket"
  value       = var.enable_s3 ? module.comet_s3[0].storage_bucket_url : null
}

output "comet_vm_instance_group" {
  description = "URL of the managed instance group created for the Comet VM"
  value       = var.enable_vm ? module.comet_vm[0].instance_group : null
}

output "comet_vm_instance_template" {
  description = "Name of the VM instance template created for the Comet VM"
  value       = var.enable_vm ? module.comet_vm[0].instance_template : null
}

output "comet_vpc_name" {
  description = "Name of the VPC created for Comet"
  value       = var.enable_vpc ? module.comet_vpc[0].comet_vpc_name : null
}

output "comet_vpc_subnet_name" {
  description = "Name of the subnet created in the Comet VPC"
  value       = var.enable_vpc ? module.comet_vpc[0].comet_vpc_subnet_name : null
}