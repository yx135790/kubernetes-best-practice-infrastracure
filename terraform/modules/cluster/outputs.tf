output "client_key" {
  value = module.gke-cluster.client_key
}

output "endpoint" {
  value = module.gke-cluster.endpoint
}

output "master_cluster_id" {
  value = module.gke-cluster.id
}

output "ca" {
  value = module.gke-cluster.ca
}

output "firewall" {
  value = module.gke-cluster.firewall
}

output "service_account" {
  value = module.gke-cluster.serviceaccount_id
}
