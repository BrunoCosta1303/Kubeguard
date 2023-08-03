terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.4.0"
    }
    kubernetes = {
      soursource = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = "${var.linode_token}"
}

provider "kubernetes" {
  config_path    = "${linode_lke_cluster.kubeguard-lke.kubeconfig}"
}