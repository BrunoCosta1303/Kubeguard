resource "kubernetes_manifest" "persistentvolumeclaim_kubeguard_adguardhome" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "labels" = {
        "app" = "kubeguard"
      }
      "name" = "adguardhome"
      "namespace" = "kubeguard"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "2Gi"
        }
      }
    }
  }
}

resource "kubernetes_manifest" "deployment_kubeguard_adguardhome" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "kubeguard"
      }
      "name" = "adguardhome"
      "namespace" = "kubeguard"
    }
    "spec" = {
      "replicas" = 2
      "selector" = {
        "matchLabels" = {
          "app" = "kubeguard"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge" = 0
          "maxUnavailable" = 1
        }
        "type" = "RollingUpdate"
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
              "image" = "adguard/adguardhome:latest"
              "name" = "adguardhome"
              "ports" = [
                {
                  "containerPort" = 53
                  "protocol" = "UDP"
                },
                {
                  "containerPort" = 853
                  "protocol" = "UDP"
                },
                {
                  "containerPort" = 3000
                  "protocol" = "TCP"
                },
              ]
              "resources" = {
                "limits" = {
                  "cpu" = "512m"
                  "memory" = "728Mi"
                }
                "requests" = {
                  "cpu" = "200m"
                  "memory" = "256Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = false
                "privileged" = false
              }
              "volumeMounts" = [
                {
                  "mountPath" = "/opt/adguardhome/conf"
                  "name" = "adguardhome-config"
                },
                {
                  "mountPath" = "/opt/adguardhome/work"
                  "name" = "adguardhome-logs"
                },
              ]
            },
          ]
          "volumes" = [
            {
              "name" = "adguardhome-config"
              "persistentVolumeClaim" = {
                "claimName" = "adguardhome"
              }
            },
            {
              "emptyDir" = {}
              "name" = "adguardhome-logs"
            },
          ]
        }
      }
    }
  }
}
