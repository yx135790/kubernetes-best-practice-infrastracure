resource "google_container_cluster" "cluster" {
    name = var.cluster_full_name
    location = var.cluster_location
    remove_default_node_pool = true
    initial_node_count       = 1
    enable_legacy_abac = true
    network = var.vpcname
    subnetwork = var.private_subnets

}


resource "google_project_iam_custom_role" "cluster-role" {
  role_id     = "${var.cluster_full_name}clusterrole"
  title       = "${var.cluster_full_name}-cluster-role"
  description = "This is the cluster admin role for ${var.cluster_full_name}-cluster-role"
  permissions = ["container.clusters.create", "container.clusters.delete", "container.clusters.get","container.clusters.list","container.clusters.update","container.operations.get","container.operations.list"]
}


resource "google_service_account" "service_account" {
  account_id   = "${var.cluster_full_name}service-account-id"
  display_name = "${var.cluster_full_name}-service-account"
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/${google_project_iam_custom_role.cluster-role.title}"

    members = [
      "${google_service_account.service_account.account_id}@y${var.project}.iam.gserviceaccount.com",
    ]
    }
  depends_on = [
    google_service_account.service_account,
    google_project_iam_custom_role.cluster-role
  ]
}

resource "google_compute_firewall" "default" {
  name    = "${var.cluster_full_name}-cluster-firewall"
  network = var.vpcname
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]

}