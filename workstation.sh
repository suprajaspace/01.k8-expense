df -hT
lsblk
sudo growpart /dev/nvme0n1 4
sudo lvextend -l +50%FREE /dev/RootVG/rootVol
sudo lvextend -l +50%FREE /dev/RootVG/varVol
sudo xfs_growfs /
sudo xfs_growfs /var

echo "success"

sudo yum install -y yum-utils
sudo yum config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y docker-compose-plugin -y
sudo systemctl start docker
# sudo systemctl status docker
sudo usermod -aG docker ec2-user
sudo docker ps
echo "docker install success"

#below 3 commands not working
# curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.2/2024-11-15/bin/darwin/amd64/kubectl
# chmod +x ./kubectl
# sudo mv kubectl /usr/local/bin/kubectl

# updated new commands for kubectl insatll
curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

#kubectl version
echo "kubectl success"
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

echo "eksctl success"
aws configure
echo "aws configure success"
sh clustercreation.sh

