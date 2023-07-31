output "instance_group" {
  description = "URL of the managed instance group created for the Comet VM"
  value       = module.managed_instance_group.instance_group
}

output "instance_template" {
  description = "Name of the VM instance template created for the Comet VM"
  value       = module.vm_instance_template.name
}