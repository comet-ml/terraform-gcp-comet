## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.51 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.51 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.sa_sql_client_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.gcp-proxy-svs-account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.gcp-proxy-svs-account-key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [kubernetes_namespace.cometml](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.gcp-proxy-svs-account-secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comet_vpc_name"></a> [comet\_vpc\_name](#input\_comet\_vpc\_name) | Name of the VPC that the cluster will be provisioned in | `string` | n/a | yes |
| <a name="input_comet_vpc_subnet_name"></a> [comet\_vpc\_subnet\_name](#input\_comet\_vpc\_subnet\_name) | Name of the subnet that the cluster will be provisioned in | `string` | n/a | yes |
| <a name="input_comet_vpc_zones"></a> [comet\_vpc\_zones](#input\_comet\_vpc\_zones) | Compute zones for the GKE cluster | `list(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_gke_create_service_account"></a> [gke\_create\_service\_account](#input\_gke\_create\_service\_account) | Enables creation of a cluster service account | `bool` | n/a | yes |
| <a name="input_gke_enable_cost_allocation"></a> [gke\_enable\_cost\_allocation](#input\_gke\_enable\_cost\_allocation) | Enables cost allocation tracking in the cluster | `bool` | n/a | yes |
| <a name="input_gke_enable_vertical_pod_autoscaling"></a> [gke\_enable\_vertical\_pod\_autoscaling](#input\_gke\_enable\_vertical\_pod\_autoscaling) | Enables vertical pod autoscaling in the cluster | `bool` | n/a | yes |
| <a name="input_gke_filestore_csi_driver"></a> [gke\_filestore\_csi\_driver](#input\_gke\_filestore\_csi\_driver) | Enables the Filestore CSI driver in the cluster | `bool` | n/a | yes |
| <a name="input_gke_horizontal_pod_autoscaling"></a> [gke\_horizontal\_pod\_autoscaling](#input\_gke\_horizontal\_pod\_autoscaling) | Enables horizontal pod autoscaling in the cluster | `bool` | n/a | yes |
| <a name="input_gke_http_load_balancing"></a> [gke\_http\_load\_balancing](#input\_gke\_http\_load\_balancing) | Enables the load balancer controller in the cluster | `bool` | n/a | yes |
| <a name="input_gke_kubernetes_version"></a> [gke\_kubernetes\_version](#input\_gke\_kubernetes\_version) | Kubernetes version to use in the cluster | `string` | n/a | yes |
| <a name="input_gke_network_policy"></a> [gke\_network\_policy](#input\_gke\_network\_policy) | Enables network policy usage in the cluster | `bool` | n/a | yes |
| <a name="input_gke_network_policy_provider"></a> [gke\_network\_policy\_provider](#input\_gke\_network\_policy\_provider) | Network policy provider to use in the cluster | `string` | n/a | yes |
| <a name="input_gke_nodepool_auto_repair"></a> [gke\_nodepool\_auto\_repair](#input\_gke\_nodepool\_auto\_repair) | Enables nodepool autorepair | `bool` | n/a | yes |
| <a name="input_gke_nodepool_auto_upgrade"></a> [gke\_nodepool\_auto\_upgrade](#input\_gke\_nodepool\_auto\_upgrade) | Enables nodepool autoupgrade | `bool` | n/a | yes |
| <a name="input_gke_nodepool_disk_size_gb"></a> [gke\_nodepool\_disk\_size\_gb](#input\_gke\_nodepool\_disk\_size\_gb) | Disk size for nodes | `number` | n/a | yes |
| <a name="input_gke_nodepool_disk_type"></a> [gke\_nodepool\_disk\_type](#input\_gke\_nodepool\_disk\_type) | Disk type for nodes | `string` | n/a | yes |
| <a name="input_gke_nodepool_enable_gcfs"></a> [gke\_nodepool\_enable\_gcfs](#input\_gke\_nodepool\_enable\_gcfs) | Enables GCFS on nodepool | `bool` | n/a | yes |
| <a name="input_gke_nodepool_enable_gvnic"></a> [gke\_nodepool\_enable\_gvnic](#input\_gke\_nodepool\_enable\_gvnic) | Enables GVNIC on nodepool | `bool` | n/a | yes |
| <a name="input_gke_nodepool_image_type"></a> [gke\_nodepool\_image\_type](#input\_gke\_nodepool\_image\_type) | OS image type for nodes | `string` | n/a | yes |
| <a name="input_gke_nodepool_local_ssd_count"></a> [gke\_nodepool\_local\_ssd\_count](#input\_gke\_nodepool\_local\_ssd\_count) | Number of local SSDs to provision with nodes | `number` | n/a | yes |
| <a name="input_gke_nodepool_machine_type"></a> [gke\_nodepool\_machine\_type](#input\_gke\_nodepool\_machine\_type) | VM machine type for the GKE nodes | `string` | n/a | yes |
| <a name="input_gke_nodepool_max_count"></a> [gke\_nodepool\_max\_count](#input\_gke\_nodepool\_max\_count) | Maximum count of nodes in the nodepool | `number` | n/a | yes |
| <a name="input_gke_nodepool_min_count"></a> [gke\_nodepool\_min\_count](#input\_gke\_nodepool\_min\_count) | Minimum and target count of nodes in the nodepool | `number` | n/a | yes |
| <a name="input_gke_nodepool_preemptible"></a> [gke\_nodepool\_preemptible](#input\_gke\_nodepool\_preemptible) | Sets nodes as preemptible | `bool` | n/a | yes |
| <a name="input_gke_nodepool_spot"></a> [gke\_nodepool\_spot](#input\_gke\_nodepool\_spot) | Enables using spot VMs for nodes | `bool` | n/a | yes |
| <a name="input_gke_pods_cidr_name"></a> [gke\_pods\_cidr\_name](#input\_gke\_pods\_cidr\_name) | Name of the secondary CIDR block to be used for GKE pods | `string` | n/a | yes |
| <a name="input_gke_regional"></a> [gke\_regional](#input\_gke\_regional) | Enables provisioning the GKE cluster with the regional architecture | `bool` | n/a | yes |
| <a name="input_gke_remove_default_node_pool"></a> [gke\_remove\_default\_node\_pool](#input\_gke\_remove\_default\_node\_pool) | Sets the cluster default nodepool to be removed when the cluster is created | `bool` | n/a | yes |
| <a name="input_gke_services_cidr_name"></a> [gke\_services\_cidr\_name](#input\_gke\_services\_cidr\_name) | Name of the secondary CIDR block to be used for GKE services | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | CA certificate from cluster to use for auth via Kubernetes provider |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint to use for auth to cluster via Kubernetes provider |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the cluster |
| <a name="output_cluster_nodepools_names"></a> [cluster\_nodepools\_names](#output\_cluster\_nodepools\_names) | Names of the nodepools in the cluster |
