output "lke_status" {
    value = linode_lke_cluster.kubeguard-lke.status
}

output "lke_dashboard" {
    value = linode_lke_cluster.kubeguard-lke.dashboard_url
}

output "lke_configuration_file" {
    value = linode_lke_cluster.kubeguard-lke.kubeconfig
}
