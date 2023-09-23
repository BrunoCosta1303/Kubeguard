resource "kubernetes_manifest" "deployment_kubeguard_wireguard" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "name" = "wireguard"
      "namespace" = "kubeguard"
    }
    "spec" = {
      "replicas" = 2
      "selector" = {
        "matchLabels" = {
          "app" = "kubeguard"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "kubeguard"
          }
        }
        "spec" = {
          "containers" = [
            {
              "env" = [
                {
                  "name" = "WG_HOST"
                  "value" = "localhost"
                },
                {
                  "name" = "WG_DEFAULT_DNS"
                  "value" = "1.1.1.1"
                },
                {
                  "name" = "PASSWORD"
                  "value" = "asdfghjk"
                },
              ]
              "image" = "weejewel/wg-easy"
              "name" = "wireguard"
              "ports" = [
                {
                  "containerPort" = 51820
                  "protocol" = "UDP"
                },
                {
                  "containerPort" = 51821
                  "protocol" = "TCP"
                },
              ]
              "resources" = {
                "limits" = {
                  "cpu" = "768m"
                  "memory" = "512Mi"
                }
                "requests" = {
                  "cpu" = "512m"
                  "memory" = "256Mi"
                }
              }
              "securityContext" = {
                "capabilities" = {
                  "add" = [
                    "NET_ADMIN",
                    "SYS_MODULE",
                  ]
                }
                "privileged" = true
              }
              "volumeMounts" = [
                {
                  "mountPath" = "/etc/wireguard"
                  "name" = "wireguard-volume"
                },
                {
                  "mountPath" = "/lib/modules"
                  "name" = "lib-volume"
                },
              ]
            },
          ]
          "volumes" = [
            {
              "hostPath" = {
                "path" = "/mnt/k3s/wireguard"
              }
              "name" = "wireguard-volume"
            },
            {
              "hostPath" = {
                "path" = "/lib/modules"
              }
              "name" = "lib-volume"
            },
          ]
        }
      }
    }
  }
}
