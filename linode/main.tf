#Creates cluster and main infrastructure used 
#https://registry.terraform.io/providers/linode/linode/latest/docs/resources/lke_cluster
resource "linode_lke_cluster" "kubeguard-lke" {
    label       = "kubeguard-lke"
    k8s_version = "1.21"
    region      = "us-central"
    tags        = ["prod"]

    #We're going minimal here, in case you wish to add tools to the stack check the linode types bellow:
    #https://api.linode.com/v4/linode/types
    pool {
        type  = "g6-standard-2" #instance type
        count = 2 #the ammount of nodes on the cluster
    }
}

#TODO: Check if it is possible to attach the firewall rules to the cluster
# https://registry.terraform.io/providers/linode/linode/latest/docs/resources/firewall
#Rules where based on the linode forum https://www.linode.com/community/questions/19155/securing-k8s-cluster#answer-81275
# resource "linode_firewall" "kubeguard-firewall" {
#   label = "kubeguard-firewall"

#   inbound {
#     label    = "allow-kubelet-health-check"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "10250"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-calico-bgp"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "179"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-node-ports"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "30000 - 32767"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-http"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-http"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-http"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-https"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "443"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }
 
#   inbound {
#     label    = "allow-adguard-panel"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "3000"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-wg-vpn"
#     action   = "ACCEPT"
#     protocol = "UDP"
#     ports    = "51820"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound {
#     label    = "allow-wgeasy-panel"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "51821"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   inbound_policy = "DROP"

#   outbound {
#     label    = "reject-http"
#     action   = "DROP"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   outbound {
#     label    = "reject-https"
#     action   = "DROP"
#     protocol = "TCP"
#     ports    = "443"
#     ipv4     = ["0.0.0.0/0"]
#     ipv6     = ["::/0"]
#   }

#   outbound_policy = "ACCEPT"

# }
