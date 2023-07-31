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
| [google_storage_bucket.comet-s3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy) | Setting to allow storage bucket to be deleted while still holding objects | `bool` | n/a | yes |
| <a name="input_s3_location"></a> [s3\_location](#input\_s3\_location) | Region for the storage bucket to be provisioned in | `string` | n/a | yes |
| <a name="input_s3_storage_class"></a> [s3\_storage\_class](#input\_s3\_storage\_class) | Storage bucket class | `string` | n/a | yes |
| <a name="input_s3_uniform_bucket_level_access"></a> [s3\_uniform\_bucket\_level\_access](#input\_s3\_uniform\_bucket\_level\_access) | Enables uniform bucket level access | `bool` | n/a | yes |
| <a name="input_s3_versioning"></a> [s3\_versioning](#input\_s3\_versioning) | Enables versioning for objects in the storage bucket | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_bucket_name"></a> [storage\_bucket\_name](#output\_storage\_bucket\_name) | Name of the storage bucket |
| <a name="output_storage_bucket_url"></a> [storage\_bucket\_url](#output\_storage\_bucket\_url) | Base URL of the storage bucket |
