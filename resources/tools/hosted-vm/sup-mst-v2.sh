    1  ip a
    2  ip a
    3  systemctl restart netowrking.service
    4  systemctl restart netowrking
    5  systemctl restart netowrk
    6  reboot
    7  clear
    8  apt update
    9  apt upgrade
   10  clear
   11  apt install nano 
   12  apt install git 
   13  clear
   14  nmcli
   15  apt install nmcli
   16  ls /etc/network
   17  ls /etc/network/interfaces
   18  ls /etc/network/interfaces.d/
   19  ls /etc/network/interfaces
   20  nano /etc/network/interfaces
   21  nano /etc/network/interfaces
   22  nano /etc/network/interfaces
   23  systemctl restart networking.service
   24  history
   25  clear
   26  python -m http.server 6443
   27  python3 -m http.server 6443
   28  systemctl status firewalld
   29  clear
   30  nano /etc/hosts
   31  apt update -y && apt upgrade -y
   32  apt install -y docker.io
   33  nano /etc/docker/daemon.json
   34  systemctl enable docker.service --now
   35  systemctl status docker
   36  nano /etc/fstab
   37  swapoff -a
   38  apt install swapoff
   39  systemctl status *swap
   40  systemctl --type swap
   41  sysctl mask "dev-*.swap"
   42  systemctl mask "dev-*.swap"
   43  systemctl --type swap
   44  :q
   45  systemctl status *swap
   46  swapoff
   47  sudo swapoff
   48  apt install sudo
   49  cp /etc/fstab /etc/fstab.bak
   50  swapon
   51  mount
   52  fstab
   53  apt install util-linux-ng
   54  apt install util-linux
   55  swapoff
   56  util-linux
   57  fstab
   58  swappon
   59  swapoff
   60  ed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
   61  sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
   62  cat /etc/fstab
   63  systemctl daemon-reload
   64  clear
   65  nano /etc/sysctl.conf
   66  sysctl -p
   67  apt install sysctl
   68  exit
   69  clear
   70  apt-cache search sysctl
   71  apt install procps
   72  apt update 
   73  apt install procps
   74  sysctl
   75  /sbin/sysctl 
   76  echo $PATH
   77  export $PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/opt:/usr/share
   78  export $PATH /usr/local/bin:/usr/bin:/bin:/sbin:/opt:/usr/share
   79  env
   80  env PATH
   81  ls /etc/profile
   82  nano /etc/profile
   83  source /etc/profile
   84  clear
   85  swapoff -a
   86  echo $PATH
   87  sysctl -p
   88  apt install -y apt-transport-https curl
   89  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
   90  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
   91  apt install gnupg
   92  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
   93  ping k8s-deb-wkr
   94  modprobe overlay
   95  modprobe br_netfilter
   96  cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
   97  overlay
   98  br_netfilter
   99  EOF
  100  cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
  101  net.bridge.bridge-nf-call-iptables = 1
  102  net.bridge.bridge-nf-call-ip6tables = 1
  103  net.ipv4.ip_forward = 1 
  104  EOF
  105  clear
  106  sysctl --system
  107  free -m
  108  apt install gnupg2 apt-transport-https
  109  export OS=Debian_11
  110  export VERSION=1.24
  111  echo "deb [signed-by=/usr/share/keyrings/libcontainers-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
  112  echo "deb [signed-by=/usr/share/keyrings/libcontainers-crio-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list
  113  mkdir -p /usr/share/keyrings
  114  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-archive-keyring.gpg
  115  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/Release.key | gpg --dearmor -o /usr/share/keyrings/libcontainers-crio-archive-keyring.gpg
  116  apt update -y
  117  apt updagre -y
  118  apt upgrade -y
  119  clear
  120  apt install cri-o cri-o-runc cri-tools
  121  nano /etc/crio/crio.conf
  122  nano /etc/cni/net.d/100-crio-bridge.conf 
  123  systemctl enable crio --now
  124  systemctl restart crio
  125  curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  126  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  127  apt update
  128  sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  129  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  130  apt update
  131  sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  132  ls /usr/share/keyrings/kubernetes-archive-keyring.gpg 
  133  cat /usr/share/keyrings/kubernetes-archive-keyring.gpg 
  134  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  135  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  136  apt update
  137  nano /etc/apt/sources.list.d/kubernetes.list
  138  apt update
  139  apt install kubelet kubeadm kubectl
  140  lsmod | grep br_netfilter
  141  kubeadm config images pull
  142  nano /etc/cni/net.d/100-crio-bridge.conf 
  143  cat /var/run/containerd/containerd.sock
  144  cat /var/run/crio/crio.sock 
  145  ls /var/run/docker.sock 
  146  systemctl restart docker.service
  147  kubeadm config images pull
  148  systemctl stop docker.service
  149  rm -rf /var/run/docker.sock 
  150  systemctl start docker.service
  151  kubeadm config images pull
  152  cat /var/run/crio/crio.sock
  153  systemctl restart container.d
  154  systemctl restart containerd
  155  systemctl start docker.service
  156  kubeadm config images pull
  157  cat /var/run/containerd/containerd.sock
  158  reboot
  159  clear
  160  kubeadm config images pull
  161  ls /etc/kubernetes/
  162  ls /etc/kubernetes/manifests/
  163  kubeadm config images pull --cri-socket /var/run/crio.sock 
  164  kubeadm config images pull 
  165  systemctl stop containerd
  166  rm -rf /var/run/containerd/containerd.sock
  167  kubeadm config images pull 
  168  systemctl disable containerd
  169  crictl images
  170  kubeadm init --pod-network-cidr=10.13.0.0/24 --apiserver-advertise-address=192.168.15.186 --cri-socket=unix:///var/run/crio/crio.sock
  171  export KUBECONFIG=/etc/kubernetes/admin.conf
  172  cat /etc/kubernetes/admin.conf
  173  kubectl cluster info
  174  kubectl cluster-info
  175  history
