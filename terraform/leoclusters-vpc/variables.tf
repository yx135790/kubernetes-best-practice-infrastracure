variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "project" {
  type = string
}

variable "vpc_block" {
  type = string
}

variable "clusters_name_prefix" {
  type = string
}

variable "private_subnets_prefix_list" {
  type = list
}

variable "public_subnets_prefix_list" {
  type = list
}
