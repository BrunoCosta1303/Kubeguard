#!/bin/bash
# Runs on CentOS 8 Stream
# Preparation of the system overall 

yum makecache
yum -y update 
yum -y upgrade

# Setup Wireguard Kernel modules and tools required for wg-easy to work

yum install -y elrepo-release epel-release
yum install -y kmod-wireguard wireguard-tools

cat < /etc/sysctl.conf
net.ipv4.conf.all.src_valid_mark = 1
net.ipv4.ip_forward = 1
EOF

# Configure environment for any kubernetes services 
#https://upcloud.com/resources/tutorials/install-kubernetes-cluster-centos-8
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce containerd.io

swapoff -a
modprobe br_netfilter

systemctl enable docker
systemctl start docker

systemctl enable containerd
systemctl start containerd

setnforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux



firewall-cmd --add-masquerade --permanent
firewall-cmd --reload

cat < /etc/sysctl.d/99-sysctl.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

firewall-cmd --zone=public --permanent --add-port={6443,2379,2380,10250,10251,10252}/tcp
firewall-cmd --zone=public --permanent --add-rich-rule 'rule family=ipv4 source address=172.17.0.0/16 accept'
#In case of multiple worker nodes uncomment this line
# firewall-cmd --zone=public --permanent --add-rich-rule 'rule family=ipv4 source address=worker-IP-address/32 accept'
firewall-cmd --zone=public --permanent --add-port={3000,51820,51821,10250,30000-32767}/tcp
firewall-cmd --zone=public --permanent --add-port={53,51820,51821,10250,30000-32767}/udp
firewall-cmd --reload

# Install K3s
curl -sfL https://get.k3s.io | sh -
# Install K3s mixed protocols for lb service 
curl -sfL https://get.k3s.io | sh -s - --kube-apiserver-arg feature-gates=MixedProtocolLBService=true

sysctl --system