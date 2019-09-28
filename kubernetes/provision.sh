#!/bin/bash
# sed -i.bak 's/\r$//' k8s.sh
# kubectl create -f jenkins-deployment.yaml
# kubectl create -f jenkins-service.yaml
# kubectl describe pods
# kubectl cluster-info
# kubectl get service
# kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts:default
# kubectl -n kube-system get deployment coredns -o yaml | sed 's/allowPrivilegeEscalation: false/allowPrivilegeEscalation: true/g' | kubectl apply -f -

# cd ../jenkins
# curl -s -XPOST 'http://?:30000/createItem?name=seed-job' --data-binary @seed-job.xml -H "Content-Type:text/xml"

# Load balancer and static IP

gcloud container clusters create k8s

# Reverve static IP for "jenkins-master" application
gcloud compute addresses create jenkins-master --global

kubectl apply -f jenkins-ingress.yaml
kubectl apply -f jenkins-service.yaml
kubectl apply -f jenkins-deployment.yaml

# find IP address of the application
kubectl get ingress

# Wait about 10 mins until application comes up