module "leoclusters" {
  source = "../modules/cluster"
  cluster_full_name = var.cluster_full_name
  cluster_location = var.cluster_location
  vpcname = var.vpcname
  private_subnets = var.private_subnets 
  worker_min_node_count = var.worker_min_node_count
  worker_max_node_count = var.worker_max_node_count
  project = var.project
}