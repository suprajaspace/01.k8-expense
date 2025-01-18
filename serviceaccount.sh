eksctl utils associate-iam-oidc-provider     --region us-east-1     --cluster expense-dev     --approve
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json
aws iam create-policy     --policy-name AWSLoadBalancerControllerIAMPolicy     --policy-document file://iam-policy.json
# eksctl create iamserviceaccount --cluster=expense-dev --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --region us-east-1 --approve
eksctl create iamserviceaccount --cluster=expense-dev --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::861276084496:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --region us-east-1 --approve
helm repo add eks https://aws.github.io/eks-charts
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=expense-dev --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller
helm list
helm list -n kube-system
kubectl get pods -n kube-system