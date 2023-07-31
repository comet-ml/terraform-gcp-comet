terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.1.0"
    }
  }
}