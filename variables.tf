################
#### Global ####
################
variable "project_id" {
  description = "ID of the project that resources will be provisioned in"
  type        = string
}

variable "region" {
  description = "Region that resources will be launched in"
  type        = string
  default     = "us-east1"
  validation {
    condition = contains([
      "asia-east1",
      "asia-east2",
      "asia-northeast1",
      "asia-northeast2",
      "asia-northeast3",
      "asia-south1",
      "asia-south2",
      "asia-southeast1",
      "asia-southeast2",
      "australia-southeast1",
      "australia-southeast2",
      "europe-central2",
      "europe-north1",
      "europe-southwest1",
      "europe-west1",
      "europe-west12",
      "europe-west2",
      "europe-west3",
      "europe-west4",
      "europe-west6",
      "europe-west8",
      "europe-west9",
      "me-central1",
      "me-west1",
      "northamerica-northeast1",
      "northamerica-northeast2",
      "southamerica-east1",
      "southamerica-west1",
      "us-central1",
      "us-east1",
      "us-east4",
      "us-east5",
      "us-south1",
      "us-west1",
      "us-west2",
      "us-west3",
      "us-west4",
      ],
      var.region
    )
    error_message = "Invalid region"
  }
}

variable "environment" {
  description = "Name for the Comet environment, for use in resource naming"
  type        = string
  default     = "prod"
}

variable "comet_vpc_name" {
  description = "Name for the existing VPC that resources will be provisioned in"
  type        = string
  default     = null
}

variable "comet_vpc_subnet_name" {
  description = "Name for the existing subnet that resources will be provisioned in"
  type        = string
  default     = null
}

variable "comet_vpc_zones" {
  description = "Compute zones to use within the region"
  type        = list(string)
  default     = null
}

### Feature toggles ###
variable "enable_gke" {
  description = "Toggles the comet_gke module, to provision GKE resources for running Comet"
  type        = bool
}

variable "enable_lb" {
  description = "Toggles the comet_lb module, to provision an application load balancer for the Comet VM"
  type        = bool
}

variable "enable_memorystore" {
  description = "Toggles the comet_memorystore module, to provision a Redis instance for Comet"
  type        = bool
}

variable "enable_mysql" {
  description = "Toggles the comet_mysql module, to provision Google Cloud SQL resources for Comet"
  type        = bool
}

variable "enable_s3" {
  description = "Toggles the comet_s3 module, to provision a Google Cloud Storage bucket for Comet S3"
  type        = bool
}

variable "enable_vm" {
  description = "Toggles the comet_vm module, to provision a Google Compute Engine VM for Comet"
  type        = bool
}

variable "enable_vpc" {
  description = "Toggles the comet_vpc module, to provision a new VPC for hosting the Comet resources"
  type        = bool
}

#######################
#### Module inputs ####
#######################

#### comet_gke ####
# cluster
variable "gke_pods_cidr_name" {
  description = "Name of the secondary CIDR block to be used for GKE pods"
  type        = string
  default     = null
}

variable "gke_services_cidr_name" {
  description = "Name of the secondary CIDR block to be used for GKE services"
  type        = string
  default     = null
}

variable "gke_regional" {
  description = "Enables provisioning the GKE cluster with the regional architecture"
  type        = bool
  default     = true
}

variable "gke_kubernetes_version" {
  description = "Kubernetes version to use in the GKE cluster"
  type        = string
  default     = "latest"
}

variable "gke_create_service_account" {
  description = "Enables creation of a GKE cluster service account"
  type        = bool
  default     = true
}

variable "gke_http_load_balancing" {
  description = "Enables the load balancer controller in the GKE cluster"
  type        = bool
  default     = true
}

variable "gke_network_policy" {
  description = "Enables network policy usage in the GKE cluster"
  type        = bool
  default     = false
}

variable "gke_network_policy_provider" {
  description = "Network policy provider to use in the GKE cluster"
  type        = string
  default     = "CALICO"
}

variable "gke_horizontal_pod_autoscaling" {
  description = "Enables horizontal pod autoscaling in the GKE cluster"
  type        = bool
  default     = true
}

variable "gke_enable_vertical_pod_autoscaling" {
  description = "Enables vertical pod autoscaling in the GKE cluster"
  type        = bool
  default     = false
}

variable "gke_filestore_csi_driver" {
  description = "Enables the Filestore CSI driver in the GKE cluster"
  type        = bool
  default     = false
}

variable "gke_enable_cost_allocation" {
  description = "Enables cost allocation tracking in the GKE cluster"
  type        = bool
  default     = false
}

variable "gke_remove_default_node_pool" {
  description = "Sets the cluster default GKE nodepool to be removed when the cluster is created"
  type        = bool
  default     = false
}
variable "gke_release_channel" {
  description = "Sets the release channel for the cluster"
  type        = string
  default     = "STABLE"
}
# node pool
variable "gke_nodepool_machine_type" {
  description = "VM machine type for the GKE nodes"
  type        = string
  default     = "n1-standard-8"
}

variable "gke_nodepool_min_count" {
  description = "Minimum and target count of nodes in the GKE nodepool"
  type        = number
  default     = 1
}

variable "gke_nodepool_max_count" {
  description = "Maximum count of nodes in the GKE nodepool"
  type        = number
  default     = 3
}

variable "gke_nodepool_local_ssd_count" {
  description = "Number of local SSDs to provision with GKE nodes"
  type        = number
  default     = 0
}

variable "gke_nodepool_spot" {
  description = "Enables using spot VMs for GKE nodes"
  type        = bool
  default     = false
}

variable "gke_nodepool_disk_size_gb" {
  description = "Disk size for GKE nodes"
  type        = number
  default     = 500
}

variable "gke_nodepool_disk_type" {
  description = "Disk type for GKE nodes"
  type        = string
  default     = "pd-standard"
}

variable "gke_nodepool_image_type" {
  description = "OS image type for GKE nodes"
  type        = string
  default     = "COS_CONTAINERD"
}

variable "gke_nodepool_enable_gcfs" {
  description = "Enables GCFS on GKE nodepool"
  type        = bool
  default     = false
}

variable "gke_nodepool_enable_gvnic" {
  description = "Enables GVNIC on GKE nodepool"
  type        = bool
  default     = false
}

variable "gke_nodepool_auto_repair" {
  description = "Enables GKE nodepool autorepair"
  type        = bool
  default     = true
}

variable "gke_nodepool_auto_upgrade" {
  description = "Enables GKE nodepool autoupgrade"
  type        = bool
  default     = true
}

variable "gke_nodepool_preemptible" {
  description = "Sets GKE nodes as preemptible"
  type        = bool
  default     = false
}

#### comet_lb ####
variable "lb_enable_ssl" {
  description = "Enables SSL support on the load balancer"
  type        = bool
  default     = false
}

variable "lb_managed_ssl_certificate_domains" {
  description = "Google-managed SSL certificates for specified domains. Requires lb_enable_ssl to be set to true and lb_use_provided_ssl_certificates set to false"
  type        = list(string)
  default     = []
}

variable "lb_use_provided_ssl_certificates" {
  description = "If true, use the certificates provided from lb_provided_ssl_certificates"
  type        = bool
  default     = false
}

variable "lb_provided_ssl_certificates" {
  description = "List of existing SSL certificates to use for the load balancer"
  type        = list(string)
  default     = []
}

variable "lb_cloudnat_router_name" {
  description = "Name of the router used for Cloud NAT"
  type        = string
  default     = null
}

variable "lb_backend_timeout_sec" {
  description = "Timeout in seconds for backend connections"
  type        = number
  default     = 10
}

variable "lb_backend_enable_cdn" {
  description = "Enables using CDN load balancer"
  type        = bool
  default     = false
}

variable "lb_health_check_logging" {
  description = "Enables logging for the load balancer health checks"
  type        = bool
  default     = false
}

variable "lb_backend_service_logging" {
  description = "Enables logging for the load balancer requests to backend"
  type        = bool
  default     = false
}

variable "lb_logging_sample_rate" {
  description = "Sample rate for the backend logging"
  type        = number
  default     = 1.0
}

variable "lb_backend_instance_group" {
  description = "Compute managed instance group to serve as backend for the load balancer"
  type        = string
  default     = null
}

variable "lb_enable_iap_config" {
  description = "Enables using identity-aware proxy with the load balancer"
  type        = bool
  default     = false
}

#### comet_memorystore ####
variable "memorystore_redis_version" {
  description = "Redis version for the Memorystore instance"
  type        = string
  default     = "REDIS_6_X"
}

variable "memorystore_instance_tier" {
  description = "Memorystore instance tier"
  type        = string
  default     = "BASIC"
}

variable "memorystore_memory_size_gb" {
  description = "Amount of memory for the Memorystore instance"
  type        = number
  default     = 32
}

variable "memorystore_maintenance_day" {
  description = "Day to allow maintenance window for Memorystore instance"
  type        = string
  default     = "SATURDAY"
}

variable "memorystore_maintenance_start_hour" {
  description = "Starting hour for Memorystore maintenance window"
  type        = number
  default     = 0
}

variable "memorystore_maintenance_start_min" {
  description = "Starting minute for Memorystore maintenance window"
  type        = number
  default     = 30
}

#### comet_mysql ####
variable "db_random_instance_name" {
  description = "Sets random suffix at the end of the Cloud SQL resource name"
  type        = bool
  default     = true
}

variable "db_deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance"
  type        = bool
  default     = false
}

variable "db_version" {
  description = "The database version to use"
  type        = string
  default     = "MYSQL_8_0"
}

variable "db_instance_tier" {
  description = "The tier for the master instance"
  type        = string
  default     = "db-n1-standard-16"
}

variable "db_assign_public_ip" {
  description = "Enables giving the master instance a public IP address"
  type        = bool
  default     = true
}

variable "db_user" {
  description = "Name for database user account"
  type        = string
  default     = "cometml"
}

variable "db_password" {
  description = "Password for database user account"
  type        = string
  default     = null
}

variable "db_disk_size" {
  description = "Initial size of the database storage disk"
  type        = number
  default     = 100
}

#### comet_s3 ####
variable "s3_existing_bucket_name" {
  description = "Name of an existing storage bucket to use with Comet; only used with enable_s3 set to false"
  type        = string
  default     = "no-bucket"
}
variable "s3_force_destroy" {
  description = "Setting to allow storage bucket to be deleted while still holding objects"
  type        = bool
  default     = false
}

variable "s3_storage_class" {
  description = "Storage bucket class"
  type        = string
  default     = "STANDARD"
}

variable "s3_uniform_bucket_level_access" {
  description = "Enables uniform bucket level access"
  type        = bool
  default     = true
}

variable "s3_versioning" {
  description = "Enables versioning for objects in the storage bucket"
  type        = bool
  default     = false
}

#### comet_vm ####
variable "vm_source_image_family" {
  description = "Operating system family for the VM"
  type        = string
  default     = "ubuntu-2204-lts"
  validation {
    condition     = can(regex("^rhel-(7|8|9)$|^ubuntu-(20|22)04-lts$", var.vm_source_image_family))
    error_message = "Invalid OS image family. Allowed values are 'rhel-7', 'rhel-8', 'rhel-9', 'ubuntu-2004-lts', 'ubuntu-2204-lts'"
  }
}

variable "vm_machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "n1-standard-16"
}

variable "vm_disk_type" {
  description = "Storage disk type for the VM"
  type        = string
  default     = "pd-standard"
}

variable "vm_disk_size_gb" {
  description = "Size in GB for storage disk"
  type        = string
  default     = "1000"
}

variable "vm_disk_auto_delete" {
  description = "Enables the storage disk on the VM to be automatically deleted on VM deletion"
  type        = bool
  default     = false
}

variable "vm_enable_ssh" {
  description = "Set to allow SSH traffic to the VM"
  type        = bool
  default     = true
}

variable "vm_enable_public_ip" {
  description = "Set to enable public IP on the VM"
  type        = bool
  default     = false
}

#### comet_vpc ####
variable "vpc_subnet_cidr" {
  description = "Network CIDR block for the provisioned VPC subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_subnet_private_access" {
  description = "Enables resources in VPC without public IPs to access Google APIs and services"
  type        = bool
  default     = true
}

variable "vpc_subnet_flow_logs" {
  description = "Enables flow logs for the provisioned VPC"
  type        = bool
  default     = false
}

variable "gke_pods_cidr" {
  description = "Secondary network CIDR block for the VPC, to be used for GKE pods"
  type        = string
  default     = "10.1.0.0/16"
}

variable "gke_services_cidr" {
  description = "Secondary network CIDR block for the VPC, to be used for GKE services"
  type        = string
  default     = "10.2.0.0/20"
}