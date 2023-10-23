terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51, <= 4.76"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.1.0"
    }
  }
}