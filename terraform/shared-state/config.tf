terraform {
  required_version = "> 0.14.5"
  required_providers {
    google = {
      version = "> 4.0.0"
    }
  }
}

provider "google" {
  region = var.region
  zone = var.zone
  project = var.project
}
