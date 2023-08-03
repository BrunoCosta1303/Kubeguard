#Preparing cluster for the VPN Service
#https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace

resource "kubernetes_namespace" "kubeguard-namespace" {
  metadata {
    labels = {
      mylabel = "kubeguard"
    }

    name = "kubeguard-ns"
  }
  depends_on = [
    linode_lke_cluster.kubeguard-lke
  ]
}

# #Deploys our custom DNS server
# resource "kubernetes_deployment" "adguard-deployment" {
  
# }

# #Deploys our VPN service
# resource "kubernetes_deployment" "wireguard-deployment" {
  
# }

#Try to create and apply manifest yaml on resources into our kubernetes cluster
resource "kubernetes_manifest" "adguard-deployment-manifest" {
  manifest = yamldecode(file("${path.module}../resources/config.yml"))

  wait {
    rollout = true
  }

  depends_on = [
    kubernetes_namespace.kubeguard-namespace
  ]
}

resource "kubernetes_manifest" "wireguard-deployment-manifest" {
  manifest = yamldecode(file("${path.module}../resources/config.yml"))

  wait {
    rollout = true
  }
    depends_on = [
    kubernetes_manifest.adguard-deployment-manifest
  ]
}

resource "kubernetes_manifest" "kubeguard-service-manifest" {
  manifest = yamldecode(file("${path.module}../resources/config.yml"))

  wait {
    rollout = true
  }

  depends_on = [
    kubernetes_manifest.adguard-deployment-manifest,
    kubernetes_manifest.wireguard-deployment-manifest
  ]
}

