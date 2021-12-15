resource "google_storage_bucket" "leocluster_tf_state_storage_bucket" {
  name = "${var.clusters_name_prefix}-terraform-state"
  location = "ASIA-EAST2"
  versioning {
      enabled = true
  }
}

resource "google_storage_bucket" "leocluster_VPC_storage_bucket" {
  name = "${var.clusters_name_prefix}-vpc-terraform-state"
  location = "ASIA-EAST2"
  versioning {
      enabled = true
  }
}

