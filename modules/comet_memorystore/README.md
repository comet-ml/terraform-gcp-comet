## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_redis_instance.comet-redis](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comet_vpc_name"></a> [comet\_vpc\_name](#input\_comet\_vpc\_name) | Name of the VPC that memorystore instance will be provisioned in | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_memorystore_instance_tier"></a> [memorystore\_instance\_tier](#input\_memorystore\_instance\_tier) | Memorystore instance tier | `string` | n/a | yes |
| <a name="input_memorystore_maintenance_day"></a> [memorystore\_maintenance\_day](#input\_memorystore\_maintenance\_day) | Day to allow maintenance window for Memorystore instance | `string` | n/a | yes |
| <a name="input_memorystore_maintenance_start_hour"></a> [memorystore\_maintenance\_start\_hour](#input\_memorystore\_maintenance\_start\_hour) | Starting hour for Memorystore maintenance window | `number` | n/a | yes |
| <a name="input_memorystore_maintenance_start_min"></a> [memorystore\_maintenance\_start\_min](#input\_memorystore\_maintenance\_start\_min) | Starting minute for Memorystore maintenance window | `number` | n/a | yes |
| <a name="input_memorystore_memory_size_gb"></a> [memorystore\_memory\_size\_gb](#input\_memorystore\_memory\_size\_gb) | Amount of memory for the Memorystore instance | `number` | n/a | yes |
| <a name="input_memorystore_redis_version"></a> [memorystore\_redis\_version](#input\_memorystore\_redis\_version) | Redis version for the Memorystore instance | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_memorystore_host"></a> [memorystore\_host](#output\_memorystore\_host) | Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service |
| <a name="output_memorystore_name"></a> [memorystore\_name](#output\_memorystore\_name) | ID of the Redis instance |
| <a name="output_memorystore_port"></a> [memorystore\_port](#output\_memorystore\_port) | The port number of the exposed Redis endpoint |
