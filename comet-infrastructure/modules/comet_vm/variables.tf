variable "project_id" {
  description = "ID of the project that resources will be provisioned in"
  type        = string
}

variable "region" {
  description = "Region that resources will be launched in"
  type        = string
}

variable "environment" {
  description = "Name for the Comet environment, for use in resource naming"
  type        = string
}

variable "vm_vpc" {
  description = "Name of the VPC that the VM will be provisioned in"
  type        = string
}

variable "vm_subnetwork" {
  description = "Name of the VPC subnet that the VM will be provisioned in"
  type        = string
}

variable "vm_source_image_family" {
  description = "Operating system family for the VM"
  type        = string
}

variable "vm_machine_type" {
  description = "Machine type for the VM"
  type        = string
}

variable "vm_disk_type" {
  description = "Storage disk type for the VM"
  type        = string
}

variable "vm_disk_size_gb" {
  description = "Size in GB for storage disk"
  type        = string
}

variable "vm_disk_auto_delete" {
  description = "Enables the storage disk on the VM to be automatically deleted on VM deletion"
  type        = bool
}

variable "vm_enable_ssh" {
  description = "Set to allow SSH traffic to the VM"
  type        = bool
}