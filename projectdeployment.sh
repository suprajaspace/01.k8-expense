kubectl get nodes
cd ..
# git clone https://github.com/suprajaspace/01.k8-expense.git
cd 01.k8-expense/
kubectl apply -f namespace.yaml

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx

sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx

sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

kubens expense

cd mysql
kubectl apply -f manifest.yaml
sleep 5
kubectl get pods
# kubectl exec -it mysql-77f4d45568-mqk4w -- bash
# [expense@mysql-77f4d45568-mqk4w /]$ mysql -u root -pExpenseApp@1
# mysql> show databases;
# mysql> use transactions;
# mysql> show tables;
# mysql> exit
# [expense@mysql-77f4d45568-mqk4w /]$ exit


cd ..
cd backend
kubectl apply -f manifest.yaml
sleep 10
kubectl get svc
kubectl get pods
# kubectl logs  backend-589d9cd455-kjprf
# kubectl exec -it backend-589d9cd455-kjprf -- sh

# cd ..
# cd debug
# kubectl apply -f manifest.yaml
# kubectl get pods
# kubectl exec -it debug -- bash

# [root@debug /]# telnet mysql 3306
# .
# Connected to mysql.

# [root@debug /]# telnet backend 8080
# Connected to backend.

# Connection: close

# Connection closed by foreign host.
# [root@debug /]# exit

cd ..
cd frontend
kubectl apply -f manifest.yaml
sleep 10
kubectl get pods
kubectl get svc

