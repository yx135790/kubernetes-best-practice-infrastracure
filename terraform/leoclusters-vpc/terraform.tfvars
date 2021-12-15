region  = "asia-east2"
zone    = "asia-east2-c"
project = "leok8s"

clusters_name_prefix = "leoclusters"

vpc_block = "10.40.0.0/17"

public_subnets_prefix_list = [
"10.40.0.0/20",
"10.40.16.0/20",
"10.40.32.0/20",
]
private_subnets_prefix_list = [
"10.40.64.0/20",
"10.40.80.0/20",
"10.40.96.0/20",
]