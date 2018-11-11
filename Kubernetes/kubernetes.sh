# Deploy kubeadm and prerequisite packages
sudo su -
apt-get update && sudo apt-get install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet=1.10.1-00 kubeadm=1.10.1-00 kubectl

# Check Kubeadm version
kubeadm version

# Build kubeadm Custom Config
cat <<EOF > kubeadm.conf
kind: MasterConfiguration
apiVersion: kubeadm.k8s.io/v1alpha1
apiServerExtraArgs:
  runtime-config: api/all,admissionregistration.k8s.io/v1alpha1
  admission-control: PodPreset,Initializers,NamespaceLifecycle,LimitRanger,ServiceAccount,PersistentVolumeLabel,DefaultStorageClass,DefaultTolerationSeconds,NodeRestriction,ResourceQuota
kubernetesVersion: v1.10.1
networking:
  podSubnet: 192.168.0.0/16
EOF

# Create a cluster
kubeadm init --config=kubeadm.conf

# Watch the result
watch kubectl get pods --all-namespaces -o wide

# Download and deploy calico
wget https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml

# Now lets deploy Calico as a daemon set.
watch kubectl get pods --all-namespaces -o wide
kubectl apply -f calico.yaml

# Test deployment
kubectl run nginx --replicas=2 --image=nginx --labels="run=nginx-example" --port=8080

kubectl describe deployment nginx
kubectl get deployment nginx

kubectl get pods