#!/bin/bash
sudo su -

# Setup Wireguard Kernel modules and tools required for wg-easy to work
apt update -y && apt upgrade -y
apt install -y openssl wireguard gnupg2 apt-transport-https

# Change line 16 to the desired version
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

apt update -y && apt upgrade -y
apt install -y docker-ce containerd.io

# Configure environment for any kubernetes services 
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

modprobe br_netfilter
modprobe overlay

systemctl enable docker
systemctl start docker

systemctl enable containerd
systemctl start containerd

cat < /etc/sysctl.conf
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
net.ipv4.conf.all.src_valid_mark = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

# Install K3s on workers
curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
