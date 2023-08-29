## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.51 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gce-app-lb"></a> [gce-app-lb](#module\_gce-app-lb) | GoogleCloudPlatform/lb-http/google | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Name for the Comet environment, for use in resource naming | `string` | n/a | yes |
| <a name="input_lb_backend_enable_cdn"></a> [lb\_backend\_enable\_cdn](#input\_lb\_backend\_enable\_cdn) | Enables using CDN load balancer | `bool` | n/a | yes |
| <a name="input_lb_backend_instance_group"></a> [lb\_backend\_instance\_group](#input\_lb\_backend\_instance\_group) | Compute managed instance group to serve as backend for the load balancer | `string` | n/a | yes |
| <a name="input_lb_backend_service_logging"></a> [lb\_backend\_service\_logging](#input\_lb\_backend\_service\_logging) | Enables logging for the load balancer requests to backend | `bool` | n/a | yes |
| <a name="input_lb_backend_timeout_sec"></a> [lb\_backend\_timeout\_sec](#input\_lb\_backend\_timeout\_sec) | Timeout in seconds for backend connections | `number` | n/a | yes |
| <a name="input_lb_cloudnat_router_name"></a> [lb\_cloudnat\_router\_name](#input\_lb\_cloudnat\_router\_name) | Name of the router used for Cloud NAT | `string` | n/a | yes |
| <a name="input_lb_comet_subnet"></a> [lb\_comet\_subnet](#input\_lb\_comet\_subnet) | Name of the VPC subnet that the load balancer will be provisioned in | `string` | n/a | yes |
| <a name="input_lb_enable_iap_config"></a> [lb\_enable\_iap\_config](#input\_lb\_enable\_iap\_config) | Enables using identity-aware proxy with the load balancer | `bool` | n/a | yes |
| <a name="input_lb_enable_ssl"></a> [lb\_enable\_ssl](#input\_lb\_enable\_ssl) | Enables SSL support on the load balancer | `bool` | n/a | yes |
| <a name="input_lb_health_check_logging"></a> [lb\_health\_check\_logging](#input\_lb\_health\_check\_logging) | Enables logging for the load balancer health checks | `bool` | n/a | yes |
| <a name="input_lb_logging_sample_rate"></a> [lb\_logging\_sample\_rate](#input\_lb\_logging\_sample\_rate) | Sample rate for the backend logging | `number` | n/a | yes |
| <a name="input_lb_managed_ssl_certificate_domains"></a> [lb\_managed\_ssl\_certificate\_domains](#input\_lb\_managed\_ssl\_certificate\_domains) | Google-managed SSL certificates for specified domains. Requires lb\_enable\_ssl to be set to true and lb\_use\_provided\_ssl\_certificates set to false | `list(string)` | n/a | yes |
| <a name="input_lb_provided_ssl_certificates"></a> [lb\_provided\_ssl\_certificates](#input\_lb\_provided\_ssl\_certificates) | List of existing SSL certificates to use for the load balancer | `list(string)` | n/a | yes |
| <a name="input_lb_use_provided_ssl_certificates"></a> [lb\_use\_provided\_ssl\_certificates](#input\_lb\_use\_provided\_ssl\_certificates) | If true, use the certificates provided from lb\_provided\_ssl\_certificates | `bool` | n/a | yes |
| <a name="input_lb_vpc"></a> [lb\_vpc](#input\_lb\_vpc) | Name of the VPC that the load balancer will be provisioned in | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project that resources will be provisioned in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region that resources will be launched in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_external_ip"></a> [lb\_external\_ip](#output\_lb\_external\_ip) | External IP address for the load balancer |
