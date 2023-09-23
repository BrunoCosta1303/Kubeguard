resource "kubernetes_manifest" "service_kubeguard_kubeguard_tcp_service_lb" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "kubeguard-tcp-service-lb"
      "namespace" = "kubeguard"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "adguard-console"
          "port" = 3000
          "protocol" = "TCP"
          "targetPort" = 3000
        },
        {
          "name" = "wireguard-console"
          "port" = 51821
          "protocol" = "TCP"
          "targetPort" = 51821
        },
      ]
      "selector" = {
        "app" = "kubeguard"
      }
      "type" = "LoadBalancer"
    }
  }
}

resource "kubernetes_manifest" "service_kubeguard_kubeguard_udp_service_lb" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "kubeguard-udp-service-lb"
      "namespace" = "kubeguard"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "adguard-dns"
          "port" = 53
          "protocol" = "UDP"
          "targetPort" = 53
        },
        {
          "name" = "wireguard-vpn"
          "port" = 51820
          "protocol" = "UDP"
          "targetPort" = 51820
        },
      ]
      "selector" = {
        "app" = "kubeguard"
      }
      "type" = "LoadBalancer"
    }
  }
}
