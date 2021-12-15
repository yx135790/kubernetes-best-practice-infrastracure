output "firewall" {
  value = module.leoclusters.firewall
}

output "project" {
  value = var.project
}
output "id" {
  value = module.leoclusters.id
}

output "client_key" {
  value = module.leoclusters.client_key
}

output "ca" {
  value = module.leoclusters.ca
}

output "endpoint" {
  value = module.leoclusters.endpoint
}
output "serviceaccount" {
  value = "${module.leoclusters.serviceaccount_id}@${var.project}..iam.gserviceaccount.com"
}