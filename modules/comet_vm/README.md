## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.88 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.88 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_managed_instance_group"></a> [managed\_instance\_group](#module\_managed\_instance\_group) | terraform-google-modules/vm/google//modules/mig | n/a |
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | terraform-google-modules/service-accounts/google | n/a |
| <a name="module_vm_instance_template"></a> [vm\_instance\_template](#module\_vm\_instance\_template) | terraform-google-modules/vm/google//modules/instance_template | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_project_iam_member.vm_sa_storage_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_storage_hmac_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_hmac_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_mysql"></a> [enable\_mysql](#input\_enable\_mysql) | Passed in from root configuration to indicate if VM will be used with instance from MySQL module | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | n/a | yes |
| <a name="input_vm_disk_auto_delete"></a> [vm\_disk\_auto\_delete](#input\_vm\_disk\_auto\_delete) | Enables the storage disk on the VM to be automatically deleted on VM deletion | `bool` | n/a | yes |
| <a name="input_vm_disk_size_gb"></a> [vm\_disk\_size\_gb](#input\_vm\_disk\_size\_gb) | Size in GB for storage disk | `string` | n/a | yes |
| <a name="input_vm_disk_type"></a> [vm\_disk\_type](#input\_vm\_disk\_type) | Storage disk type for the VM | `string` | n/a | yes |
| <a name="input_vm_enable_ssh"></a> [vm\_enable\_ssh](#input\_vm\_enable\_ssh) | Set to allow SSH traffic to the VM | `bool` | n/a | yes |
| <a name="input_vm_machine_type"></a> [vm\_machine\_type](#input\_vm\_machine\_type) | Machine type for the VM | `string` | n/a | yes |
| <a name="input_vm_mysql_connection_name"></a> [vm\_mysql\_connection\_name](#input\_vm\_mysql\_connection\_name) | Connection name for the MySQL instance | `string` | n/a | yes |
| <a name="input_vm_sa_s3_bucket_name"></a> [vm\_sa\_s3\_bucket\_name](#input\_vm\_sa\_s3\_bucket\_name) | Name for GCS bucket to grant access via VM service account | `string` | n/a | yes |
| <a name="input_vm_source_image_family"></a> [vm\_source\_image\_family](#input\_vm\_source\_image\_family) | Operating system family for the VM | `string` | n/a | yes |
| <a name="input_vm_subnetwork"></a> [vm\_subnetwork](#input\_vm\_subnetwork) | Name of the VPC subnet that the VM will be provisioned in | `string` | n/a | yes |
| <a name="input_vm_vpc"></a> [vm\_vpc](#input\_vm\_vpc) | Name of the VPC that the VM will be provisioned in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_group"></a> [instance\_group](#output\_instance\_group) | URL of the managed instance group created for the Comet VM |
| <a name="output_instance_sa_hmac_access_id"></a> [instance\_sa\_hmac\_access\_id](#output\_instance\_sa\_hmac\_access\_id) | Access ID of the HMAC key created for the instance service account |
| <a name="output_instance_sa_hmac_secret"></a> [instance\_sa\_hmac\_secret](#output\_instance\_sa\_hmac\_secret) | Secret of the HMAC key created for the instance service account |
| <a name="output_instance_service_account"></a> [instance\_service\_account](#output\_instance\_service\_account) | Service account used by the VM |
| <a name="output_instance_template"></a> [instance\_template](#output\_instance\_template) | Name of the VM instance template created for the Comet VM |
