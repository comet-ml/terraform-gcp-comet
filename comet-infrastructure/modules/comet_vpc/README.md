## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.25 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_gke_pods_cidr"></a> [gke\_pods\_cidr](#input\_gke\_pods\_cidr) | Secondary network CIDR block for the VPC, to be used for GKE pods | `string` | n/a | yes |
| <a name="input_gke_services_cidr"></a> [gke\_services\_cidr](#input\_gke\_services\_cidr) | Secondary network CIDR block for the VPC, to be used for GKE services | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | n/a | yes |
| <a name="input_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#input\_vpc\_subnet\_cidr) | Network CIDR block for the provisioned VPC subnet | `string` | n/a | yes |
| <a name="input_vpc_subnet_flow_logs"></a> [vpc\_subnet\_flow\_logs](#input\_vpc\_subnet\_flow\_logs) | Enables flow logs for the provisioned VPC | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_available_zones"></a> [available\_zones](#output\_available\_zones) | First three available compute zones from the region |
| <a name="output_comet_vpc_name"></a> [comet\_vpc\_name](#output\_comet\_vpc\_name) | Name of the VPC created for Comet |
| <a name="output_comet_vpc_subnet_name"></a> [comet\_vpc\_subnet\_name](#output\_comet\_vpc\_subnet\_name) | Name of the subnet created in the Comet VPC |
| <a name="output_gke_pods_cidr_name"></a> [gke\_pods\_cidr\_name](#output\_gke\_pods\_cidr\_name) | Generated name of the secondary IP range provisioned for GKE pods |
| <a name="output_gke_services_cidr_name"></a> [gke\_services\_cidr\_name](#output\_gke\_services\_cidr\_name) | Generated name of the secondary IP range provisioned for GKE services |
