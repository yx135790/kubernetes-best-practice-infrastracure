output "firewall" {
  value = google_compute_firewall.default.name
}

output "id" {
  value = google_container_cluster.cluster.id
}

output "client_key" {
  value = google_container_cluster.cluster.master_auth.0.client_key
}

output "ca" {
  value = google_container_cluster.cluster.master_auth.0.cluster_ca_certificate
}

output "endpoint" {
  value = google_container_cluster.cluster.endpoint
}
output "serviceaccount_id" {
  value = google_service_account.service_account.account_id
}