# Creating and configuring DO cluster #
#######################################################

data "digitalocean_vpc" "vpc" {
  name = var.vpc_name
}

resource "digitalocean_kubernetes_cluster" "crm_k8s" {
  name    = var.cluster_name
  region  = var.cluster_region
  version = var.cluster_version
  vpc_uuid = data.digitalocean_vpc.vpc.id
  ha = var.cluster_ha

  tags = var.cluster_tags
  
  node_pool {
    name       = var.node_name
    size       = var.node_size
    auto_scale = var.node_autoscale
    min_nodes  = var.node_min_nodes
    max_nodes  = var.node_max_nodes

    labels = var.node_labels

    tags = var.node_tags
  }
}

