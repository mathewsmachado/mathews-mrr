terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }

  required_version = "1.14.5"

  backend "gcs" {
    bucket = "mathews-mrr-prd-terraform-bucket"
    prefix = "state"
  }
}

locals {
  shared = jsondecode(file("../../shared/config.json"))
}

provider "google" {
  project = var.project_id
  region  = local.shared.project_region
}
