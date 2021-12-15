data "google_compute_regions" "available" {
    project = var.project
}

module "vpc-private" {
    source  = "terraform-google-modules/network/google"
    project_id = "${var.project}"
    network_name = "${var.clusters_name_prefix}-vpc-private"
    subnets = [
        {
            subnet_name = "k8s-private-${var.clusters_name_prefix}-${data.google_compute_regions.available.names[1]}"
            subnet_ip = element(var.private_subnets_prefix_list,1)
            subnet_region = data.google_compute_regions.available.names[1]
        },
        {
            subnet_name = "k8s-private-${var.clusters_name_prefix}-${data.google_compute_regions.available.names[2]}"
            subnet_ip = element(var.private_subnets_prefix_list,2)
            subnet_region = data.google_compute_regions.available.names[2]
        },
        {
            subnet_name = "k8s-private-${var.clusters_name_prefix}-${data.google_compute_regions.available.names[3]}"
            subnet_ip = element(var.private_subnets_prefix_list,3)
            subnet_region = data.google_compute_regions.available.names[3]
        }
    ]
}

module "vpc-public" {
    source  = "terraform-google-modules/network/google"
    project_id = "${var.project}"
    network_name = "${var.clusters_name_prefix}-vpc-public"
    subnets = [
        {
            subnet_name = "k8s-public-${var.clusters_name_prefix}-${data.google_compute_regions.available.names[1]}"
            subnet_ip = element(var.public_subnets_prefix_list,1)
            subnet_region = data.google_compute_regions.available.names[1]
        },
        {
            subnet_name = "k8s-public-${var.clusters_name_prefix}-${data.google_compute_regions.available.names[2]}"
            subnet_ip = element(var.public_subnets_prefix_list,2)
            subnet_region = data.google_compute_regions.available.names[2]
        },
        {
            subnet_name = "k8s-public-${var.clusters_name_prefix}-${data.google_compute_regions.available.names[3]}"
            subnet_ip = element(var.public_subnets_prefix_list,3)
            subnet_region = data.google_compute_regions.available.names[3]
        }
    ]
}