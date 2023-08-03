    1  clear
    2  nano /etc/hosts
    3  apt update -y && apt upgrade -y
    4  apt install -y docker.io
    5  nano /etc/docker/daemon.json
    6  systemctl enable docker.service --now
    7  nano /etc/fstab
    8  sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
    9  systemctl daemon-reload
   10  clear
   11  nano /etc/profile 
   12  source /etc/profile
   13  swapoff -a
   14  sysctl -p
   15  apt install -y apt-transport-https curl
   16  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
   17  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
   18  apt install gnupg
   19  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
   20  apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
   21  modprobe overlay
   22  modprobe br_netfilter
   23  cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

   24  apt install sudo
   25  cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

   26  cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1 
EOF

   27  clear
   28  sysctl --system
   29  free -m
   30  apt install gnupg2 apt-transport-https
   31  echo "deb [signed-by=/usr/share/keyrings/libcontainers-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
   32  echo "deb [signed-by=/usr/share/keyrings/libcontainers-crio-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list
   33  mkdir -p /usr/share/keyrings
   34  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-archive-keyring.gpg
   35  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-crio-archive-keyring.gpg
   36  apt update -y
   37  export OS=Debian_11
   38  export VERSION=1.24
   39  echo "deb [signed-by=/usr/share/keyrings/libcontainers-crio-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list
   40  mkdir -p /usr/share/keyrings
   41  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-archive-keyring.gpg
   42  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-crio-archive-keyring.gpg
   43  apt update
   44  nano /etc/apt/sources.list.d/devel\:kubic\:libcontainers\:stable
   45  ls /etc/apt/sources.list.d/
   46  cat /etc/apt/sources.list.d/devel\:kubic\:libcontainers\:stable
   47  cat '/etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:.list'
   48* rm -rf '/etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:.lis'
   49  cat '/etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list'
   50  apt update
   51  rm -rf '/etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list'
   52  ls /etc/apt/sources.list.d/
   53  rm -rf '/etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:1.24.list'
   54  echo "deb [signed-by=/usr/share/keyrings/libcontainers-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
   55  echo "deb [signed-by=/usr/share/keyrings/libcontainers-crio-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list
   56  mkdir -p /usr/share/keyrings
   57  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-archive-keyring.gpg
   58  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-crio-archive-keyring.gpg
   59  apt update
   60  apt upgrade -y
   61  clear
   62  apt install cri-o cri-o-runc cri-tools
   63  curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
   64  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
   65  sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
   66  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
   67  cat /usr/share/keyrings/kubernetes-archive-keyring.gpg
   68  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
   69  apt update
   70  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
   71  nano /etc/apt/sources.list.d/kubernetes.list
   72  apt update
   73  apt install kubelet kubeadm kubectl
   74  lsmod | grep br_netfilter
   75  systemctl disable containerd
   76  kubeadm join 192.168.15.186:6443 --token h7nhp1.avvj9c7mks3p260t 	--discovery-token-ca-cert-hash sha256:e782e45b7f1dd9d5ed0c73d82ecdbf8655c34c631b369b323545ae6779541d6b
   77  history
