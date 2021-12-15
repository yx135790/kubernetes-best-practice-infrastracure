module "gke-cluster" {
  source = "../gke_cluster"
  cluster_full_name = var.cluster_full_name
  cluster_location = var.cluster_location
  vpcname = var.vpcname
  private_subnets = var.private_subnets
  project = var.project
}

module "gke-worker" {
  source = "../gke_workers"
  cluster_full_name = var.cluster_full_name
  master_cluster_id = module.gke-cluster.id
  worker_min_node_count = var.worker_min_node_count
  worker_max_node_count = var.worker_max_node_count
  service_account = "${module.gke-cluster.serviceaccount_id}@${var.project}.iam.gserviceaccount.com"
  depends_on = [
    module.gke-cluster
  ]
}