resource "google_container_node_pool" "cluter_nodes" {
  name       = "${var.cluster_full_name}-node-pool"
  cluster    = var.master_cluster_id
  node_count = 1
  autoscaling {
      min_node_count = var.worker_min_node_count
      max_node_count = var.worker_max_node_count
  }


  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}