provider "google" {
  region = var.region
  zone = var.zone
  project = var.project
}
terraform {
  backend "gcs" {
  bucket  = "leoclusters-vpc-terraform-state"
  prefix  = "terraform/state"
  }
}