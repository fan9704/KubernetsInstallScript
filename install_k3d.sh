# Intall K3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# Install Kubectl
# download the latest release based on architecture (ARM or x86)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

# validate, expect to see 'kubectl: OK'
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# install
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Check kubectl version
kubectl version

# Export k3d context to kubectl
export KUBECONFIG="$(k3d kubeconfig write k3s-default)"

# Create k3d default cluster [k3s-default]
k3d cluster create

# List cluster
k3d cluster list
# List Node
k3d node list
# kubectl cluster-info
kubectl cluster-info

echo "[Install Finished] Powered By FKT"