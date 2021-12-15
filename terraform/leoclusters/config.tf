provider "google" {
  region = var.region
  zone = var.zone
  project = var.project
}

terraform {
  required_version = "> 0.14.5"
  required_providers {
    google = {
      version = "> 4.0.0"
    }
  }
  backend "gcs" {
  bucket  = "leoclusters-terraform-state"
  prefix  = "terraform/state"
  }
}

