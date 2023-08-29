# Comet Infrastructure Deployment: Terraform on GCP
Terraform module for deploying infrastructure components to run CometML.

### Deployment
**Prerequisites:**
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed
- gcloud CLI
  - [Install](https://cloud.google.com/sdk/docs/install)
  - [Configure](https://cloud.google.com/sdk/docs/initializing)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed

**Infrastructure Deployment:**
- To deploy directly from this repository, follow the steps below.
  - Clone the repository to your local machine: `git clone https://github.com/comet-ml/terraform-gcp-comet.git`
  - Move into the deployment directory: `cd terraform-gcp-comet`
  - Initialize the directory: `terraform init`
  - Within terraform.tfvars, set your module toggles to enable the desired infrastructure components and set any required environment variables
  - Provision the resources: `terraform apply`

**A note on state management:**
- This configuration stores the Terraform state locally by default. To store the state file remotely in GCS, a `backend` block can be nested within the `terraform` block inside comet-infrastructure/versions.tf. Below is an example of such a configuration:
```
terraform {
  backend "gcs" {
    bucket  = "tf-state-prod"
    prefix  = "terraform/state"
  }
}
```
- More on state management in GCS can be found [here](https://developer.hashicorp.com/terraform/language/settings/backends/gcs)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.51 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.10 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~>3.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.74.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_comet_gke"></a> [comet\_gke](#module\_comet\_gke) | ./modules/comet_gke | n/a |
| <a name="module_comet_lb"></a> [comet\_lb](#module\_comet\_lb) | ./modules/comet_lb | n/a |
| <a name="module_comet_memorystore"></a> [comet\_memorystore](#module\_comet\_memorystore) | ./modules/comet_memorystore | n/a |
| <a name="module_comet_mysql"></a> [comet\_mysql](#module\_comet\_mysql) | ./modules/comet_mysql | n/a |
| <a name="module_comet_s3"></a> [comet\_s3](#module\_comet\_s3) | ./modules/comet_s3 | n/a |
| <a name="module_comet_vm"></a> [comet\_vm](#module\_comet\_vm) | ./modules/comet_vm | n/a |
| <a name="module_comet_vpc"></a> [comet\_vpc](#module\_comet\_vpc) | ./modules/comet_vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_compute_regions.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comet_vpc_name"></a> [comet\_vpc\_name](#input\_comet\_vpc\_name) | Name for the existing VPC that resources will be provisioned in | `string` | `null` | no |
| <a name="input_comet_vpc_subnet_name"></a> [comet\_vpc\_subnet\_name](#input\_comet\_vpc\_subnet\_name) | Name for the existing subnet that resources will be provisioned in | `string` | `null` | no |
| <a name="input_comet_vpc_zones"></a> [comet\_vpc\_zones](#input\_comet\_vpc\_zones) | Compute zones to use within the region | `list(string)` | `null` | no |
| <a name="input_db_assign_public_ip"></a> [db\_assign\_public\_ip](#input\_db\_assign\_public\_ip) | Enables giving the master instance a public IP address | `bool` | `true` | no |
| <a name="input_db_deletion_protection"></a> [db\_deletion\_protection](#input\_db\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance | `bool` | `false` | no |
| <a name="input_db_instance_tier"></a> [db\_instance\_tier](#input\_db\_instance\_tier) | The tier for the master instance | `string` | `"db-n1-standard-16"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for database user account | `string` | `null` | no |
| <a name="input_db_random_instance_name"></a> [db\_random\_instance\_name](#input\_db\_random\_instance\_name) | Sets random suffix at the end of the Cloud SQL resource name | `bool` | `true` | no |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Name for database user account | `string` | `"cometml"` | no |
| <a name="input_db_version"></a> [db\_version](#input\_db\_version) | The database version to use | `string` | `"MYSQL_8_0"` | no |
| <a name="input_enable_gke"></a> [enable\_gke](#input\_enable\_gke) | Toggles the comet\_gke module, to provision GKE resources for running Comet | `bool` | n/a | yes |
| <a name="input_enable_lb"></a> [enable\_lb](#input\_enable\_lb) | Toggles the comet\_lb module, to provision an application load balancer for the Comet VM | `bool` | n/a | yes |
| <a name="input_enable_memorystore"></a> [enable\_memorystore](#input\_enable\_memorystore) | Toggles the comet\_memorystore module, to provision a Redis instance for Comet | `bool` | n/a | yes |
| <a name="input_enable_mysql"></a> [enable\_mysql](#input\_enable\_mysql) | Toggles the comet\_mysql module, to provision Google Cloud SQL resources for Comet | `bool` | n/a | yes |
| <a name="input_enable_s3"></a> [enable\_s3](#input\_enable\_s3) | Toggles the comet\_s3 module, to provision a Google Cloud Storage bucket for Comet S3 | `bool` | n/a | yes |
| <a name="input_enable_vm"></a> [enable\_vm](#input\_enable\_vm) | Toggles the comet\_vm module, to provision a Google Compute Engine VM for Comet | `bool` | n/a | yes |
| <a name="input_enable_vpc"></a> [enable\_vpc](#input\_enable\_vpc) | Toggles the comet\_vpc module, to provision a new VPC for hosting the Comet resources | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | `"prod"` | no |
| <a name="input_gke_create_service_account"></a> [gke\_create\_service\_account](#input\_gke\_create\_service\_account) | Enables creation of a GKE cluster service account | `bool` | `true` | no |
| <a name="input_gke_enable_cost_allocation"></a> [gke\_enable\_cost\_allocation](#input\_gke\_enable\_cost\_allocation) | Enables cost allocation tracking in the GKE cluster | `bool` | `false` | no |
| <a name="input_gke_enable_vertical_pod_autoscaling"></a> [gke\_enable\_vertical\_pod\_autoscaling](#input\_gke\_enable\_vertical\_pod\_autoscaling) | Enables vertical pod autoscaling in the GKE cluster | `bool` | `false` | no |
| <a name="input_gke_filestore_csi_driver"></a> [gke\_filestore\_csi\_driver](#input\_gke\_filestore\_csi\_driver) | Enables the Filestore CSI driver in the GKE cluster | `bool` | `false` | no |
| <a name="input_gke_horizontal_pod_autoscaling"></a> [gke\_horizontal\_pod\_autoscaling](#input\_gke\_horizontal\_pod\_autoscaling) | Enables horizontal pod autoscaling in the GKE cluster | `bool` | `true` | no |
| <a name="input_gke_http_load_balancing"></a> [gke\_http\_load\_balancing](#input\_gke\_http\_load\_balancing) | Enables the load balancer controller in the GKE cluster | `bool` | `true` | no |
| <a name="input_gke_kubernetes_version"></a> [gke\_kubernetes\_version](#input\_gke\_kubernetes\_version) | Kubernetes version to use in the GKE cluster | `string` | `"latest"` | no |
| <a name="input_gke_network_policy"></a> [gke\_network\_policy](#input\_gke\_network\_policy) | Enables network policy usage in the GKE cluster | `bool` | `false` | no |
| <a name="input_gke_network_policy_provider"></a> [gke\_network\_policy\_provider](#input\_gke\_network\_policy\_provider) | Network policy provider to use in the GKE cluster | `string` | `"CALICO"` | no |
| <a name="input_gke_nodepool_auto_repair"></a> [gke\_nodepool\_auto\_repair](#input\_gke\_nodepool\_auto\_repair) | Enables GKE nodepool autorepair | `bool` | `true` | no |
| <a name="input_gke_nodepool_auto_upgrade"></a> [gke\_nodepool\_auto\_upgrade](#input\_gke\_nodepool\_auto\_upgrade) | Enables GKE nodepool autoupgrade | `bool` | `true` | no |
| <a name="input_gke_nodepool_disk_size_gb"></a> [gke\_nodepool\_disk\_size\_gb](#input\_gke\_nodepool\_disk\_size\_gb) | Disk size for GKE nodes | `number` | `100` | no |
| <a name="input_gke_nodepool_disk_type"></a> [gke\_nodepool\_disk\_type](#input\_gke\_nodepool\_disk\_type) | Disk type for GKE nodes | `string` | `"pd-standard"` | no |
| <a name="input_gke_nodepool_enable_gcfs"></a> [gke\_nodepool\_enable\_gcfs](#input\_gke\_nodepool\_enable\_gcfs) | Enables GCFS on GKE nodepool | `bool` | `false` | no |
| <a name="input_gke_nodepool_enable_gvnic"></a> [gke\_nodepool\_enable\_gvnic](#input\_gke\_nodepool\_enable\_gvnic) | Enables GVNIC on GKE nodepool | `bool` | `false` | no |
| <a name="input_gke_nodepool_image_type"></a> [gke\_nodepool\_image\_type](#input\_gke\_nodepool\_image\_type) | OS image type for GKE nodes | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_gke_nodepool_local_ssd_count"></a> [gke\_nodepool\_local\_ssd\_count](#input\_gke\_nodepool\_local\_ssd\_count) | Number of local SSDs to provision with GKE nodes | `number` | `0` | no |
| <a name="input_gke_nodepool_machine_type"></a> [gke\_nodepool\_machine\_type](#input\_gke\_nodepool\_machine\_type) | VM machine type for the GKE nodes | `string` | `"n1-standard-8"` | no |
| <a name="input_gke_nodepool_max_count"></a> [gke\_nodepool\_max\_count](#input\_gke\_nodepool\_max\_count) | Maximum count of nodes in the GKE nodepool | `number` | `3` | no |
| <a name="input_gke_nodepool_min_count"></a> [gke\_nodepool\_min\_count](#input\_gke\_nodepool\_min\_count) | Minimum and target count of nodes in the GKE nodepool | `number` | `1` | no |
| <a name="input_gke_nodepool_preemptible"></a> [gke\_nodepool\_preemptible](#input\_gke\_nodepool\_preemptible) | Sets GKE nodes as preemptible | `bool` | `false` | no |
| <a name="input_gke_nodepool_spot"></a> [gke\_nodepool\_spot](#input\_gke\_nodepool\_spot) | Enables using spot VMs for GKE nodes | `bool` | `false` | no |
| <a name="input_gke_pods_cidr"></a> [gke\_pods\_cidr](#input\_gke\_pods\_cidr) | Secondary network CIDR block for the VPC, to be used for GKE pods | `string` | `"10.1.0.0/16"` | no |
| <a name="input_gke_pods_cidr_name"></a> [gke\_pods\_cidr\_name](#input\_gke\_pods\_cidr\_name) | Name of the secondary CIDR block to be used for GKE pods | `string` | `null` | no |
| <a name="input_gke_regional"></a> [gke\_regional](#input\_gke\_regional) | Enables provisioning the GKE cluster with the regional architecture | `bool` | `true` | no |
| <a name="input_gke_release_channel"></a> [gke\_release\_channel](#input\_gke\_release\_channel) | Sets the release channel for the cluster | `string` | `"STABLE"` | no |
| <a name="input_gke_remove_default_node_pool"></a> [gke\_remove\_default\_node\_pool](#input\_gke\_remove\_default\_node\_pool) | Sets the cluster default GKE nodepool to be removed when the cluster is created | `bool` | `false` | no |
| <a name="input_gke_services_cidr"></a> [gke\_services\_cidr](#input\_gke\_services\_cidr) | Secondary network CIDR block for the VPC, to be used for GKE services | `string` | `"10.2.0.0/20"` | no |
| <a name="input_gke_services_cidr_name"></a> [gke\_services\_cidr\_name](#input\_gke\_services\_cidr\_name) | Name of the secondary CIDR block to be used for GKE services | `string` | `null` | no |
| <a name="input_lb_backend_enable_cdn"></a> [lb\_backend\_enable\_cdn](#input\_lb\_backend\_enable\_cdn) | Enables using CDN load balancer | `bool` | `false` | no |
| <a name="input_lb_backend_instance_group"></a> [lb\_backend\_instance\_group](#input\_lb\_backend\_instance\_group) | Compute managed instance group to serve as backend for the load balancer | `string` | `null` | no |
| <a name="input_lb_backend_service_logging"></a> [lb\_backend\_service\_logging](#input\_lb\_backend\_service\_logging) | Enables logging for the load balancer requests to backend | `bool` | `false` | no |
| <a name="input_lb_backend_timeout_sec"></a> [lb\_backend\_timeout\_sec](#input\_lb\_backend\_timeout\_sec) | Timeout in seconds for backend connections | `number` | `10` | no |
| <a name="input_lb_cloudnat_router_name"></a> [lb\_cloudnat\_router\_name](#input\_lb\_cloudnat\_router\_name) | Name of the router used for Cloud NAT | `string` | `null` | no |
| <a name="input_lb_enable_iap_config"></a> [lb\_enable\_iap\_config](#input\_lb\_enable\_iap\_config) | Enables using identity-aware proxy with the load balancer | `bool` | `false` | no |
| <a name="input_lb_enable_ssl"></a> [lb\_enable\_ssl](#input\_lb\_enable\_ssl) | Enables SSL support on the load balancer | `bool` | `false` | no |
| <a name="input_lb_health_check_logging"></a> [lb\_health\_check\_logging](#input\_lb\_health\_check\_logging) | Enables logging for the load balancer health checks | `bool` | `false` | no |
| <a name="input_lb_logging_sample_rate"></a> [lb\_logging\_sample\_rate](#input\_lb\_logging\_sample\_rate) | Sample rate for the backend logging | `number` | `1` | no |
| <a name="input_lb_managed_ssl_certificate_domains"></a> [lb\_managed\_ssl\_certificate\_domains](#input\_lb\_managed\_ssl\_certificate\_domains) | Google-managed SSL certificates for specified domains. Requires lb\_enable\_ssl to be set to true and lb\_use\_provided\_ssl\_certificates set to false | `list(string)` | `[]` | no |
| <a name="input_lb_provided_ssl_certificates"></a> [lb\_provided\_ssl\_certificates](#input\_lb\_provided\_ssl\_certificates) | List of existing SSL certificates to use for the load balancer | `list(string)` | `[]` | no |
| <a name="input_lb_use_provided_ssl_certificates"></a> [lb\_use\_provided\_ssl\_certificates](#input\_lb\_use\_provided\_ssl\_certificates) | If true, use the certificates provided from lb\_provided\_ssl\_certificates | `bool` | `false` | no |
| <a name="input_memorystore_instance_tier"></a> [memorystore\_instance\_tier](#input\_memorystore\_instance\_tier) | Memorystore instance tier | `string` | `"BASIC"` | no |
| <a name="input_memorystore_maintenance_day"></a> [memorystore\_maintenance\_day](#input\_memorystore\_maintenance\_day) | Day to allow maintenance window for Memorystore instance | `string` | `"SATURDAY"` | no |
| <a name="input_memorystore_maintenance_start_hour"></a> [memorystore\_maintenance\_start\_hour](#input\_memorystore\_maintenance\_start\_hour) | Starting hour for Memorystore maintenance window | `number` | `0` | no |
| <a name="input_memorystore_maintenance_start_min"></a> [memorystore\_maintenance\_start\_min](#input\_memorystore\_maintenance\_start\_min) | Starting minute for Memorystore maintenance window | `number` | `30` | no |
| <a name="input_memorystore_memory_size_gb"></a> [memorystore\_memory\_size\_gb](#input\_memorystore\_memory\_size\_gb) | Amount of memory for the Memorystore instance | `number` | `32` | no |
| <a name="input_memorystore_redis_version"></a> [memorystore\_redis\_version](#input\_memorystore\_redis\_version) | Redis version for the Memorystore instance | `string` | `"REDIS_6_X"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | `"us-east1"` | no |
| <a name="input_s3_existing_bucket_name"></a> [s3\_existing\_bucket\_name](#input\_s3\_existing\_bucket\_name) | Name of an existing storage bucket to use with Comet; only used with enable\_s3 set to false | `string` | `"no-bucket"` | no |
| <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy) | Setting to allow storage bucket to be deleted while still holding objects | `bool` | `false` | no |
| <a name="input_s3_storage_class"></a> [s3\_storage\_class](#input\_s3\_storage\_class) | Storage bucket class | `string` | `"STANDARD"` | no |
| <a name="input_s3_uniform_bucket_level_access"></a> [s3\_uniform\_bucket\_level\_access](#input\_s3\_uniform\_bucket\_level\_access) | Enables uniform bucket level access | `bool` | `true` | no |
| <a name="input_s3_versioning"></a> [s3\_versioning](#input\_s3\_versioning) | Enables versioning for objects in the storage bucket | `bool` | `false` | no |
| <a name="input_vm_disk_auto_delete"></a> [vm\_disk\_auto\_delete](#input\_vm\_disk\_auto\_delete) | Enables the storage disk on the VM to be automatically deleted on VM deletion | `bool` | `false` | no |
| <a name="input_vm_disk_size_gb"></a> [vm\_disk\_size\_gb](#input\_vm\_disk\_size\_gb) | Size in GB for storage disk | `string` | `"1000"` | no |
| <a name="input_vm_disk_type"></a> [vm\_disk\_type](#input\_vm\_disk\_type) | Storage disk type for the VM | `string` | `"pd-standard"` | no |
| <a name="input_vm_enable_ssh"></a> [vm\_enable\_ssh](#input\_vm\_enable\_ssh) | Set to allow SSH traffic to the VM | `bool` | `true` | no |
| <a name="input_vm_machine_type"></a> [vm\_machine\_type](#input\_vm\_machine\_type) | Machine type for the VM | `string` | `"n1-standard-16"` | no |
| <a name="input_vm_source_image_family"></a> [vm\_source\_image\_family](#input\_vm\_source\_image\_family) | Operating system family for the VM | `string` | `"ubuntu-2204-lts"` | no |
| <a name="input_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#input\_vpc\_subnet\_cidr) | Network CIDR block for the provisioned VPC subnet | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_subnet_flow_logs"></a> [vpc\_subnet\_flow\_logs](#input\_vpc\_subnet\_flow\_logs) | Enables flow logs for the provisioned VPC | `bool` | `false` | no |
| <a name="input_vpc_subnet_private_access"></a> [vpc\_subnet\_private\_access](#input\_vpc\_subnet\_private\_access) | Enables resources in VPC without public IPs to access Google APIs and services | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_comet_gke_cluster"></a> [comet\_gke\_cluster](#output\_comet\_gke\_cluster) | Name of the GKE cluster |
| <a name="output_comet_gke_configure_kubectl"></a> [comet\_gke\_configure\_kubectl](#output\_comet\_gke\_configure\_kubectl) | Configure kubectl: run the following command to update your kubeconfig with the newly provisioned cluster |
| <a name="output_comet_gke_nodepools"></a> [comet\_gke\_nodepools](#output\_comet\_gke\_nodepools) | Names of the nodepools in the GKE cluster |
| <a name="output_comet_gke_sa_hmac_access_id"></a> [comet\_gke\_sa\_hmac\_access\_id](#output\_comet\_gke\_sa\_hmac\_access\_id) | Access ID of the HMAC key created for the cluster service account |
| <a name="output_comet_gke_sa_hmac_secret"></a> [comet\_gke\_sa\_hmac\_secret](#output\_comet\_gke\_sa\_hmac\_secret) | Secret of the HMAC key created for the cluster service account |
| <a name="output_comet_gke_service_account"></a> [comet\_gke\_service\_account](#output\_comet\_gke\_service\_account) | Service account used by the GKE nodes |
| <a name="output_comet_lb_external_ip"></a> [comet\_lb\_external\_ip](#output\_comet\_lb\_external\_ip) | External IP address for the VM load balancer |
| <a name="output_comet_memorystore_host"></a> [comet\_memorystore\_host](#output\_comet\_memorystore\_host) | Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service |
| <a name="output_comet_memorystore_name"></a> [comet\_memorystore\_name](#output\_comet\_memorystore\_name) | ID of the Redis instance |
| <a name="output_comet_memorystore_port"></a> [comet\_memorystore\_port](#output\_comet\_memorystore\_port) | The port number of the exposed Redis endpoint |
| <a name="output_comet_mysql_connection_name"></a> [comet\_mysql\_connection\_name](#output\_comet\_mysql\_connection\_name) | The connection name of the MySQL instance to be used in connection strings |
| <a name="output_comet_s3_storage_bucket_name"></a> [comet\_s3\_storage\_bucket\_name](#output\_comet\_s3\_storage\_bucket\_name) | Name of the storage bucket |
| <a name="output_comet_s3_storage_bucket_url"></a> [comet\_s3\_storage\_bucket\_url](#output\_comet\_s3\_storage\_bucket\_url) | Base URL of the storage bucket |
| <a name="output_comet_vm_instance_group"></a> [comet\_vm\_instance\_group](#output\_comet\_vm\_instance\_group) | URL of the managed instance group created for the Comet VM |
| <a name="output_comet_vm_instance_sa_hmac_access_id"></a> [comet\_vm\_instance\_sa\_hmac\_access\_id](#output\_comet\_vm\_instance\_sa\_hmac\_access\_id) | Access ID of the HMAC key created for the instance service account |
| <a name="output_comet_vm_instance_sa_hmac_secret"></a> [comet\_vm\_instance\_sa\_hmac\_secret](#output\_comet\_vm\_instance\_sa\_hmac\_secret) | Secret of the HMAC key created for the instance service account |
| <a name="output_comet_vm_instance_service_account"></a> [comet\_vm\_instance\_service\_account](#output\_comet\_vm\_instance\_service\_account) | Service account used by the VM |
| <a name="output_comet_vm_instance_template"></a> [comet\_vm\_instance\_template](#output\_comet\_vm\_instance\_template) | Name of the VM instance template created for the Comet VM |
| <a name="output_comet_vpc_name"></a> [comet\_vpc\_name](#output\_comet\_vpc\_name) | Name of the VPC created for Comet |
| <a name="output_comet_vpc_subnet_name"></a> [comet\_vpc\_subnet\_name](#output\_comet\_vpc\_subnet\_name) | Name of the subnet created in the Comet VPC |
| <a name="output_comet_vpc_name"></a> [comet\_vpc\_name](#output\_comet\_vpc\_name) | Name of the VPC created for Comet |
| <a name="output_comet_vpc_subnet_name"></a> [comet\_vpc\_subnet\_name](#output\_comet\_vpc\_subnet\_name) | Name of the subnet created in the Comet VPC |
