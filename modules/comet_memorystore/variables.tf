variable "region" {
  description = "Region that resources will be launched in"
  type        = string
}

variable "environment" {
  description = "Name for the Comet environment, for use in resource naming"
  type        = string
}

variable "comet_vpc_name" {
  description = "Name of the VPC that memorystore instance will be provisioned in"
  type        = string
  validation {
    condition     = length(var.comet_vpc_name) > 0
    error_message = "Value for comet_vpc_name must not be null or an empty string."
  }
}

variable "memorystore_redis_version" {
  description = "Redis version for the Memorystore instance"
  type        = string
  validation {
    condition     = can(regex("^REDIS_5_0|REDIS_6_X$", var.memorystore_redis_version))
    error_message = "Invalid Redis version. Accepted values: REDIS_5_0, REDIS_6_X"
  }
}

variable "memorystore_instance_tier" {
  description = "Memorystore instance tier"
  type        = string
}

variable "memorystore_memory_size_gb" {
  description = "Amount of memory for the Memorystore instance"
  type        = number
}

variable "memorystore_maintenance_day" {
  description = "Day to allow maintenance window for Memorystore instance"
  type        = string
  validation {
    condition     = can(regex("^DAY_OF_WEEK_UNSPECIFIED|MONDAY|TUESDAY|WEDNESDAY|THURSDAY|FRIDAY|SATURDAY|SUNDAY$", var.memorystore_maintenance_day))
    error_message = "Invalid value for day of week. Accepted values: DAY_OF_WEEK_UNSPECIFIED, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY"
  }
}

variable "memorystore_maintenance_start_hour" {
  description = "Starting hour for Memorystore maintenance window"
  type        = number
  validation {
    condition     = var.memorystore_maintenance_start_hour >= 0 && var.memorystore_maintenance_start_hour <= 23
    error_message = "Invalid value for hour of the day. Accepted values: 0 to 23"
  }
}

variable "memorystore_maintenance_start_min" {
  description = "Starting minute for Memorystore maintenance window"
  type        = number
  validation {
    condition     = var.memorystore_maintenance_start_min >= 0 && var.memorystore_maintenance_start_min <= 59
    error_message = "Invalid value for minute of the hour. Accepted values: 0 to 59"
  }
}

variable "memorystore_redis_auth" {
  description = "Setting to enable or disable Redis AUTH"
  type        = bool
}