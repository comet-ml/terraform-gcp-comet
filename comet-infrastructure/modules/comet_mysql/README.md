## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.48 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mysql"></a> [mysql](#module\_mysql) | GoogleCloudPlatform/sql-db/google//modules/safer_mysql | n/a |
| <a name="module_private-service-access"></a> [private-service-access](#module\_private-service-access) | GoogleCloudPlatform/sql-db/google//modules/private_service_access | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comet_vpc_name"></a> [comet\_vpc\_name](#input\_comet\_vpc\_name) | Name of the VPC that Cloud SQL resources will be provisioned in | `string` | n/a | yes |
| <a name="input_comet_vpc_zones"></a> [comet\_vpc\_zones](#input\_comet\_vpc\_zones) | Compute zones to use within the region | `list(string)` | n/a | yes |
| <a name="input_db_assign_public_ip"></a> [db\_assign\_public\_ip](#input\_db\_assign\_public\_ip) | Enables giving the master instance a public IP address | `bool` | n/a | yes |
| <a name="input_db_deletion_protection"></a> [db\_deletion\_protection](#input\_db\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance | `bool` | n/a | yes |
| <a name="input_db_instance_tier"></a> [db\_instance\_tier](#input\_db\_instance\_tier) | The tier for the master instance | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for database user account | `string` | n/a | yes |
| <a name="input_db_random_instance_name"></a> [db\_random\_instance\_name](#input\_db\_random\_instance\_name) | Sets random suffix at the end of the Cloud SQL resource name | `bool` | n/a | yes |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Name for database user account | `string` | n/a | yes |
| <a name="input_db_version"></a> [db\_version](#input\_db\_version) | The database version to use | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysql_connection_name"></a> [mysql\_connection\_name](#output\_mysql\_connection\_name) | The connection name of the MySQL instance to be used in connection strings |
