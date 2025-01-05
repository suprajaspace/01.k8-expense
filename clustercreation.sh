cd ..
git clone https://github.com/suprajaspace/k8-eksctl.git
cd k8-eksctl/
eksctl create cluster --config-file=eks.yaml
kubectl get nodes