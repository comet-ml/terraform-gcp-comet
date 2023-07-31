output "comet_vpc_name" {
  description = "Name of the VPC created for Comet"
  value       = module.vpc.network_name
}

output "comet_vpc_subnet_name" {
  description = "Name of the subnet created in the Comet VPC"
  value       = module.vpc.subnets_names[0]
}

output "available_zones" {
  description = "First three available compute zones from the region"
  value       = slice(data.google_compute_zones.available.names, 0, 3)
}

output "gke_pods_cidr_name" {
  description = "Generated name of the secondary IP range provisioned for GKE pods"
  value       = module.vpc.subnets_secondary_ranges[0][0].range_name
}

output "gke_services_cidr_name" {
  description = "Generated name of the secondary IP range provisioned for GKE services"
  value       = module.vpc.subnets_secondary_ranges[0][1].range_name
}