# Kubernetes Install Script

---

## Getting Started

### Ensure you are Root user

```shell
sudo -i
```

### Run Script

```shell
sudo sh install_kubernetes.sh
```

### Init control panel in master node 

```shell
kubeadm init
```

### Setup KubeConfig as normal user

```shell
exit
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
#to verify, if kubectl is working or not, run the following command.
kubectl get pod -A
``` 

### Deploy the network plugins(weave network)

```shell
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
#verify if weave is deployed successfully
kubectl get pods -A
```

### Create the master join token on the master node

```shell
kubeadm token create
kubeadm token create — print-join-command
```

Worker Node Type

```shell
kubeadm join <MasterNode_IP>:6443 — token <YOUR_TOKEN> \
 — discovery-token-ca-cert-hash <HASH>
```

### Check Node Status

```shell
kubectl get nodes
```

---

## Reference

1. [Medium - Simplifying Kubernetes Installation on Ubuntu using a Bash Shell Script](https://medium.com/@olorunfemikawonise_56441/simplifying-kubernetes-installation-on-ubuntu-using-a-bash-shell-script-d75fed68a31)