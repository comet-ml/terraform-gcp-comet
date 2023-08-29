output "instance_group" {
  description = "URL of the managed instance group created for the Comet VM"
  value       = module.managed_instance_group.instance_group
}

output "instance_template" {
  description = "Name of the VM instance template created for the Comet VM"
  value       = module.vm_instance_template.name
}

output "instance_service_account" {
  description = "Service account used by the VM"
  value       = module.service_accounts.email
}

output "instance_sa_hmac_access_id" {
  description = "Access ID of the HMAC key created for the instance service account"
  value       = google_storage_hmac_key.key.access_id
}

output "instance_sa_hmac_secret" {
  description = "Secret of the HMAC key created for the instance service account"
  value       = google_storage_hmac_key.key.secret
}