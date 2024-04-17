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

variable "comet_vpc_zones" {
  description = "Compute zones for the GKE cluster"
  type        = list(string)
}

variable "comet_vpc_name" {
  description = "Name of the VPC that the cluster will be provisioned in"
  type        = string
}

variable "comet_vpc_subnet_name" {
  description = "Name of the subnet that the cluster will be provisioned in"
  type        = string
}

variable "gke_pods_cidr_name" {
  description = "Name of the secondary CIDR block to be used for GKE pods"
  type        = string
}

variable "gke_services_cidr_name" {
  description = "Name of the secondary CIDR block to be used for GKE services"
  type        = string
}

variable "gke_regional" {
  description = "Enables provisioning the GKE cluster with the regional architecture"
  type        = bool
}

variable "gke_kubernetes_version" {
  description = "Kubernetes version to use in the cluster"
  type        = string
}

variable "gke_create_service_account" {
  description = "Enables creation of a cluster service account"
  type        = bool
}

variable "gke_http_load_balancing" {
  description = "Enables the load balancer controller in the cluster"
  type        = bool
}

variable "gke_network_policy" {
  description = "Enables network policy usage in the cluster"
  type        = bool
}

variable "gke_network_policy_provider" {
  description = "Network policy provider to use in the cluster"
  type        = string
}

variable "gke_horizontal_pod_autoscaling" {
  description = "Enables horizontal pod autoscaling in the cluster"
  type        = bool
}

variable "gke_enable_vertical_pod_autoscaling" {
  description = "Enables vertical pod autoscaling in the cluster"
  type        = bool
}

variable "gke_filestore_csi_driver" {
  description = "Enables the Filestore CSI driver in the cluster"
  type        = bool
}

variable "gke_enable_cost_allocation" {
  description = "Enables cost allocation tracking in the cluster"
  type        = bool
}

variable "gke_remove_default_node_pool" {
  description = "Sets the cluster default nodepool to be removed when the cluster is created"
  type        = bool
}

variable "gke_release_channel" {
  description = "Sets the release channel for the cluster"
  type        = string
}

variable "gke_sa_s3_bucket_names" {
  description = "List of S3 bucket names to grant access to GKE cluster service account"
  type        = list(string)
}

variable "gke_nodepool_machine_type" {
  description = "VM machine type for the GKE nodes"
  type        = string
}

variable "gke_nodepool_min_count" {
  description = "Minimum and target count of nodes in the nodepool"
  type        = number
}

variable "gke_nodepool_max_count" {
  description = "Maximum count of nodes in the nodepool"
  type        = number
}

variable "gke_nodepool_local_ssd_count" {
  description = "Number of local SSDs to provision with nodes"
  type        = number
}

variable "gke_nodepool_spot" {
  description = "Enables using spot VMs for nodes"
  type        = bool
}

variable "gke_nodepool_disk_size_gb" {
  description = "Disk size for nodes"
  type        = number
}

variable "gke_nodepool_disk_type" {
  description = "Disk type for nodes"
  type        = string
}

variable "gke_nodepool_image_type" {
  description = "OS image type for nodes"
  type        = string
}

variable "gke_nodepool_enable_gcfs" {
  description = "Enables GCFS on nodepool"
  type        = bool
}

variable "gke_nodepool_enable_gvnic" {
  description = "Enables GVNIC on nodepool"
  type        = bool
}

variable "gke_nodepool_auto_repair" {
  description = "Enables nodepool autorepair"
  type        = bool
}

variable "gke_nodepool_auto_upgrade" {
  description = "Enables nodepool autoupgrade"
  type        = bool
}

variable "gke_nodepool_preemptible" {
  description = "Sets nodes as preemptible"
  type        = bool
}

variable "enable_mpm_infra" {
  description = "Sets node pools to be created for MPM compute"
  type        = bool
}

variable "gke_nodepool_druid_count" {
  description = "Number of nodes for Druid nodepool"
  type        = number
}

variable "gke_nodepool_zookeeper_count" {
  description = "Number of nodes for Zookeeper nodepool"
  type        = number
}

variable "gke_nodepool_airflow_count" {
  description = "Number of nodes for Airflow nodepool"
  type        = number
}

variable "gke_nodepool_druid_machine" {
  description = "Machine type for Druid nodepool"
  type        = string
}

variable "gke_nodepool_zookeeper_machine" {
  description = "Machine type for Zookeeper nodepool"
  type        = string
}

variable "gke_nodepool_airflow_machine" {
  description = "Machine type for Airflow nodepool"
  type        = string
}